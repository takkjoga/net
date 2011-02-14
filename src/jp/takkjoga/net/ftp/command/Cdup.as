package jp.takkjoga.net.ftp.command
{

import jp.takkjoga.net.FTP;
import jp.takkjoga.net.ftp.FTPCommand;
import jp.takkjoga.net.ftp.IFTPCommand;
import jp.takkjoga.net.ftp.FTPReply;

/**
 * CHANGE TO PARENT DIRECTORY (CDUP)
 */
public class Cdup extends FTPCommand implements IFTPCommand
{
    public function Cdup():void
    {
    }

    public function execute():void
    {
        var command:String = "CDUP";
        _send(command);
    }

    public function evaluateReply(reply:FTPReply):Boolean
    {
        if (reply.replyCode == 250) {
            return true;
        }
        return false;
    }
}
}

