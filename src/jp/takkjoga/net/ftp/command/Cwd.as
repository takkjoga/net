package jp.takkjoga.net.ftp.command
{

import jp.takkjoga.net.FTP;
import jp.takkjoga.net.ftp.FTPCommand;
import jp.takkjoga.net.ftp.IFTPCommand;
import jp.takkjoga.net.ftp.FTPReply;

/**
 * CHANGE WORKING DIRECTORY (CWD)
 */
public class Cwd extends FTPCommand implements IFTPCommand
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

    public function evaluateReply(reply:FTPReply):Boolean
    {
        if (reply.replyCode == 250) {
            dispatchEvent(new FTPEvent(FTPEvent.DIRECTORY_CHANGED));
            return true;
        }
        return false;
    }
}
}

