package jp.takkjoga.net.ftp.command
{

import jp.takkjoga.net.FTP;
import jp.takkjoga.net.ftp.FTPCommand;
import jp.takkjoga.net.ftp.IFTPCommand;
import jp.takkjoga.net.ftp.FTPReply;

/**
 * LOGOUT (QUIT)
 */
public class Quit extends FTPCommand implements IFTPCommand
{
    public function Quit():void
    {
    }

    public function execute():void
    {
        var command:String = "QUIT";
        _send(command);
    }

    public function evaluateReply(reply:FTPReply):Boolean
    {
        if (reply.replyCode == 221) {
            _socket.close();
            return true;
        }
        return false;
    }
}
}

