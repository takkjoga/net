package jp.takkjoga.air.net.FTP.commands
{

import jp.takkjoga.air.net.FTP;
import jp.takkjoga.air.net.FTPEvent;
import jp.takkjoga.air.net.FTP.*;

public class Retr extends AbstractCommand implements ICommand
{
    private var fileName:String;

    public function Retr(fileName:String):void
    {
        this.fileName = fileName;
    }

    public function execute():void
    {
        var command:String = "RETR " + fileName;
        _send(command);
    }

    public function response():Boolean
    {
        if (_receive() == 226) {
            return true;
        }
        return false;
    }
}
}

