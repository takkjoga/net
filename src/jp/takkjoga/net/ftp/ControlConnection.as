package jp.takkjoga.net.ftp
{

import flash.net.Socket;
import flash.events.Event;
import flash.events.ProgressEvent;
import jp.takkjoga.net.ftp.events.FTPConnectionEvent;
import jp.takkjoga.net.ftp.FTPReply;

public class ControlConnection extends Socket
{
    private var _controlConnection:Socket; 
    private var isConnected:Boolean = false;

    public function set controlConnection(_controlConnection:Socket):void
    {
        _controlConnection = _controlConnection;
        _controlConnection.addEventListener(ProgressEvent.SOCKET_DATA, socketDataHandler);
        _controlConnection.addEventListener(Event.CONNECT, connectHandler);
        _controlConnection.addEventListener(Event.CLOSE, closeHandler);
    }

    public function sendCommand(commandText:String):void
    {
        commandText += FTP.CRLF;
        try {
            _controlConnection.writeUTFBytes(commandText);
            _controlConnection.flush();
        } catch (error:Error) {
        }
    }

    public function getReply():FTPReply
    {
        var reply:String = _controlConnection.readUTFBytes(_controlConnection.bytesAvailable);
        return new FTPReply(reply);
    }

    private function socketDataHandler(event:ProgressEvent):void
    {
        var ftpConnectionEvent:FTPConnectionEvent = new FTPConnectionEvent(FTPConnectionEvent.DATA_CONNECTION);
        dispatchEvent(ftpConnectionEvent);
    }

    private function connectHandler(event:Event):void
    {
        isConnected = true;
    }

    private function closeHandler(event:Event):void
    {
        isConnected = false;
    }
}
}
