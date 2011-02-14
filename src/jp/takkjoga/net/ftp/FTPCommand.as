package jp.takkjoga.net.ftp
{

import flash.events.EventDispatcher;
import jp.takkjoga.net.ftp.ControlConnection;
import jp.takkjoga.net.ftp.events.FTPConnectionEvent;

/**
 * FTP コマンド用の抽象クラス
 */
public class FTPCommand extends EventDispatcher
{
    protected var _controlConnection:ControlConnection;

    public function set controlConnection(_controlConnection:ControlConnection):void
    {
        _controlConnection = _controlConnection;
        _controlConnection.addEventListener(FTPConnectionEvent.RECEIVE_REPLY, receiveReplyHandler);
    }

    final protected function _send(commandText:String):void
    {
        _controlConnection.sendCommand(commandText);
    }

    protected function receiveReplyHandler(event:FTPConnectionEvent):void
    {
        _controlConnection.removeEventListener(FTPConnectionEvent.RECEIVE_REPLY, receiveReplyHandler);
        try {
            evaluateReply(_controlConnection.getReply());
        } catch (e:Error) {
        }
        var ftpConnectionEvent:FTPConnectionEvent = new FTPConnectionEvent(FTPConnectionEvent.COMMAND_FINISHED);
        dispatchEvent(ftpConnectionEvent);
    }
}
}
