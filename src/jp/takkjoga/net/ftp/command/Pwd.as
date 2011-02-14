package jp.takkjoga.net.ftp.command
{

import jp.takkjoga.net.FTP;
import jp.takkjoga.net.ftp.FTPCommand;
import jp.takkjoga.net.ftp.IFTPCommand;
import jp.takkjoga.net.ftp.FTPReply;

public class Pwd extends FTPCommand implements IFTPCommand
{
    public function Pwd():void
    {
    }

    public function execute():void
    {
        var command:String = "PWD";
        _send(command);
    }

    public function evaluateReply(reply:FTPReply):Boolean
    {
        if (reply.replyCode == 257) {
            return true;
        }
        return false;
    }
}
}

