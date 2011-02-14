package jp.takkjoga.net.ftp.command
{

import jp.takkjoga.net.FTP;
import jp.takkjoga.net.ftp.FTPCommand;
import jp.takkjoga.net.ftp.IFTPCommand;
import jp.takkjoga.net.ftp.FTPReply;

public class List extends FTPCommand implements IFTPCommand
{
    public function List():void
    {
    }

    public function execute():void
    {
        var command:String = "LIST";
        _send(command);
    }

    public function evaluateReply(reply:FTPReply):Boolean
    {
        if (reply.replyCode == 226) {
            return true;
        }
        return false;
    }
}
}

