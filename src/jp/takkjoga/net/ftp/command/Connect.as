package jp.takkjoga.air.net.FTP.commands
{

import flash.events.Event;
import flash.events.SecurityErrorEvent;
import flash.events.IOErrorEvent;
import jp.takkjoga.air.net.FTP;
import jp.takkjoga.air.net.FTPEvent;
import jp.takkjoga.air.net.FTP.*;

public class Connect extends AbstractCommand implements ICommand
{
    private var host:String;
    private var port:int;

    public function Connect(host:String, port:int):void
    {
        this.host = host;
        this.port = port;
    }

    public function execute():void
    {
        // イベントハンドラを構築
        _socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, function(event:SecurityErrorEvent):void {
            Message.instance.text = 'Security Error' + "\n";
        });
        _socket.addEventListener(IOErrorEvent.IO_ERROR, function(event:IOErrorEvent):void {
            //Message.instance.text = 'IO Error' + "\n";
            Message.instance.text = 'サーバーに接続できません' + "\n";
            _socket.dispatchEvent(new FTPEvent(FTPEvent.UNKNOWN_HOST));
        });
        _socket.addEventListener(Event.CONNECT, function(event:Event):void {
            //Message.instance.text = "connected" + "\n";
            Message.instance.text = 'サーバーに接続しました' + "\n";
        });
        
        try {
            _socket.connect(host, port);
        } catch (error:Error) {
        }
    }

    public function response():Boolean
    {
        if (_receive() == 220) {
            return true;
        }
        return false;
    }
}
}

