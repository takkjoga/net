package jp.takkjoga.net.ftp.command
{

import jp.takkjoga.air.net.FTP;
import jp.takkjoga.air.net.FTPEvent;
import jp.takkjoga.air.net.FTP.*;

/**
 * CHANGE TO PARENT DIRECTORY (CDUP)
 */
public class Cdup extends AbstractCommand implements ICommand
{
    public function Cdup():void
    {
    }

    public function execute():void
    {
        var command:String = "CDUP";
        _send(command);
    }

    public function response():Boolean
    {
        if (_receive() == 250) {
            return true;
        }
        return false;
    }
}
}

