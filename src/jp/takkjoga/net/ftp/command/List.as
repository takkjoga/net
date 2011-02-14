package jp.takkjoga.air.net.FTP.commands
{

import jp.takkjoga.air.net.FTP;
import jp.takkjoga.air.net.FTPEvent;
import jp.takkjoga.air.net.FTP.*;

public class List extends AbstractCommand implements ICommand
{
    public function List():void
    {
    }

    public function execute():void
    {
        var command:String = "LIST";
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

