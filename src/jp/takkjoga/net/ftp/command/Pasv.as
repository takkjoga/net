package jp.takkjoga.net.ftp.command
{

import jp.takkjoga.net.FTP;
import jp.takkjoga.net.ftp.FTPCommand;
import jp.takkjoga.net.ftp.IFTPCommand;
import jp.takkjoga.net.ftp.FTPReply;

public class Pasv extends FTPCommand implements IFTPCommand
{
    public function Pasv():void
    {
    }

    public function execute():void
    {
        var command:String = "PASV";
        _send(command);
    }

    public function evaluateReply(reply:FTPReply):Boolean
    {
        if (reply.replyCode == 227) {
            var event:FTPDataConnectionEvent = new FTPDataConnectionEvent(FTPDataConnectionEvent.DATA_CONNECTION, dataConnection);
            dispatchEvent(event);
            return false;
        }
        return false;
    }
}
}

