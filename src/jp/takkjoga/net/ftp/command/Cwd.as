package jp.takkjoga.net.ftp.command
{

import jp.takkjoga.air.net.FTP;
import jp.takkjoga.air.net.FTPEvent;
import jp.takkjoga.air.net.FTP.*;

/**
 * CHANGE WORKING DIRECTORY (CWD)
 */
public class Cwd extends AbstractCommand implements ICommand
{
    private var directory:String;

    public function Cwd(directory:String):void
    {
        this.directory = directory;
    }

    public function execute():void
    {
        var command:String = "CWD " + directory;
        _send(command);
    }

    public function response():Boolean
    {
        if (_receive() == 250) {
            dispatchEvent(new FTPEvent(FTPEvent.DIRECTORY_CHANGED));
            return true;
        }
        return false;
    }
}
}

