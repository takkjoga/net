package jp.takkjoga.air.net.FTP.commands
{

import jp.takkjoga.air.net.FTP;
import jp.takkjoga.air.net.FTPEvent;
import jp.takkjoga.air.net.FTP.*;

public class Pwd extends AbstractCommand implements ICommand
{
    public function Pwd():void
    {
    }

    public function execute():void
    {
        var command:String = "PWD";
        _send(command);
    }

    public function response():Boolean
    {
        if (_receive() == 257) {
            return true;
        }
        return false;
    }
}
}

