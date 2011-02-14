package jp.takkjoga.net.ftp.command
{

import jp.takkjoga.net.FTP;
import jp.takkjoga.net.ftp.FTPCommand;
import jp.takkjoga.net.ftp.IFTPCommand;
import jp.takkjoga.net.ftp.FTPReply;

public class Retr extends FTPCommand implements IFTPCommand
{
    private var fileName:String;

    public function Retr(fileName:String):void
    {
        this.fileName = fileName;
    }

    public function execute():void
    {
        var command:String = "RETR " + fileName;
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

