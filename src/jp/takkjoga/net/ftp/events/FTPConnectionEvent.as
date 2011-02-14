package jp.takkjoga.net.ftp.events
{

import flash.errors.*;
import flash.events.Event;

public class FTPConnectionEvent extends Event
{
    public static const UNKNOWN_HOST:String = "unknownHost";
    public static const CONNECT:String = "connect";
    public static const RECEIVE_REPLY:String = "receiveReply";

    public function FTPConnectionEvent(type:String):void
    {
        super(type);
    }
}
}

