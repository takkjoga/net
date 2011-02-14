package jp.takkjoga.net.ftp
{

import jp.takkjoga.net.ftp.*;
import jp.takkjoga.net.ftp.reply.DataConnectionDestination;

public class FTPReply
{
    private var _reply:String;

    public function FTPReply(reply:String):void
    {
        _reply = reply;
    }

    // lazy build
    public function get replyCode():int
    {
        return int(_reply.substr(0, 3));
    }

    public function get dataConnectionDestination():DataConnectionDestination
    {
        var destination:DataConnectionDestination;
        try {
            destination = new DataConnectionDestination(_reply);
        } catch (e:Error) {
        }
        return destination;
    }
}
}
