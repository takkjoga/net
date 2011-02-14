package jp.takkjoga.net.ftp.command
{

import jp.takkjoga.net.FTP;
import jp.takkjoga.net.ftp.FTPCommand;
import jp.takkjoga.net.ftp.IFTPCommand;
import jp.takkjoga.net.ftp.FTPReply;

public class Type extends FTPCommand implements IFTPCommand
{
    private var type:String;

    public function Type(type:String):void
    {
        this.type = type;
    }

    public function execute():void
    {
        var command:String = "TYPE " + type;
        _send(command);
    }

    public function evaluateReply(reply:FTPReply):Boolean
    {
        if (reply.replyCode == 200) {
            return true;
        }
        return false;
    }
}
}

