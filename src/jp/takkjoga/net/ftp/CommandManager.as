package jp.takkjoga.net.ftp
{

import flash.events.ProgressEvent;
import jp.takkjoga.net.ftp.command.*;
import jp.takkjoga.net.ftp.*;
import jp.takkjoga.net.ftp.events.*;

public class CommandManager
{
    private var _controlConnection:ControlConnection;
    private var commands:Iterator = new Iterator();

    // 自動接続するか
    private var isAutoConnect:Boolean = true;
    // 自動接続用の接続コマンドの保存
    private var connectCommand:Connect;

    public function CommandManager(controlConnection:ControlConnection):void
    {
        _controlConnection = controlConnection;
    }

    private function _execute(command:IFTPCommand) {
        command.addEventListener(FTPConnectionEvent.COMMAND_FINISHED, commandFinishedHandler);
        command.addEventListener(FTPDataConnectionEvent.DATA_CONNECTION, dataConnectionHandler);
        command.execute();
    }

    public function send(command:IFTPCommand):void
    {
        command.controlConnection = _controlConnection;
        commands.push(command);

        if (command is Connect && isAutoConnect) {
            // 自動接続オンで接続コマンドだった場合、保存しておく。
            connectCommand = Connect(command);
        }

        //if (command is Connect || command is Cwd || command is Type || command is Help || command is Quit) {
        if (!commands.hasNext()) {
            _execute(command);
        }
    }

    private function commandFinishedHandler(event:FTPConnectionEvent):void
    {
        var finishedCommand:IFTPCommand = commands.shift();
        finishedCommand.removeEventListener(FTPConnectionEvent.COMMAND_FINISHED, commandFinishedHandler);
        finishedCommand.removeEventListener(FTPDataConnectionEvent.DATA_CONNECTION, dataConnectionHandler);
        if (commands.hasNext()) {
            _execute(commands.current);
        }
    }

    /**
     * データコネクションの開始
     */
    public function dataConnectionHandler(event:FTPDataConnectionEvent):void
    {
        event.target.removeEventListener(FTPDataConnectionEvent.DATA_CONNECTION, dataConnectionHandler);
        var dataConnection:DataConnection = event.target.dataConnection;
        dataConnection.addEventListener(ProgressEvent.SOCKET_DATA, dataReceiveHandler);
    }

    /**
     * データの受信
     */
    public function dataReceiveHandler(event:ProgressEvent):void
    {
        dataConnection.removeEventListener(ProgressEvent.SOCKET_DATA, dataReceiveHandler);
        var response:String = event.target.readUTFBytes(event.target.bytesAvailable);
        event.target.close();

        if (nowCommand is List) {
            //FileList.instance.formatData(response);
        } else if (nowCommand is Retr) {
            //FileData.instance.data = response;
        }
    }
}
}

