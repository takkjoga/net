package jp.takkjoga.air.net.FTP.commands
{

import jp.takkjoga.air.net.FTP;
import jp.takkjoga.air.net.FTPEvent;
import jp.takkjoga.air.net.FTP.*;

public class Noop extends AbstractCommand implements ICommand
{
    public function Noop():void
    {
    }

    public function send():String
    {
        var command:String = "NOOP";
        _send(command);
    }

    public function response():Boolean
    {
        return true;
    }
}
}

