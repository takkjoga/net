package jp.takkjoga.net.ftp.command
{

import jp.takkjoga.net.FTP;
import jp.takkjoga.net.ftp.FTPCommand;
import jp.takkjoga.net.ftp.IFTPCommand;
import jp.takkjoga.net.ftp.FTPReply;

public class Noop extends FTPCommand implements IFTPCommand
{
    public function Noop():void
    {
    }

    public function send():String
    {
        var command:String = "NOOP";
        _send(command);
    }

    public function evaluateReply(reply:FTPReply):Boolean
    {
        return true;
    }
}
}

