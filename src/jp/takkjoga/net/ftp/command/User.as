package jp.takkjoga.net.ftp.command
{

import jp.takkjoga.net.ftp.*;

/**
 * USER NAME (USER)
 */
public class User extends FTPCommand implements IFTPCommand
{
    private var userName:String;

    public function User(userName:String):void
    {
        this.userName = userName;
    }

    public function execute():void
    {
        var command:String = "USER " + userName;
        _send(command);
    }

    public function evaluateReply(reply:FTPReply):Boolean
    {
        if (reply.replyCode == 331) {
            return true;
        }
        return false;
    }
}
}

