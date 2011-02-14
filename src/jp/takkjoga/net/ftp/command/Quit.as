package jp.takkjoga.net.ftp.command
{

import jp.takkjoga.air.net.FTP;
import jp.takkjoga.air.net.FTPEvent;
import jp.takkjoga.air.net.FTP.*;

/**
 * LOGOUT (QUIT)
 */
public class Quit extends AbstractCommand implements ICommand
{
    public function Quit():void
    {
    }

    public function execute():void
    {
        var command:String = "QUIT";
        _send(command);
    }

    public function response():Boolean
    {
        if (_receive() == 221) {
            _socket.close();
            return true;
        }
        return false;
    }
}
}

