package jp.takkjoga.net.ftp.events
{

import flash.errors.*;
import flash.events.Event;
import jp.takkjoga.net.ftp.DataConnection;

public class FTPDataConnectionEvent extends Event
{
    public static const DATA_CONNECTION:String = "dataConnection";
    private var _dataConnection:DataConnection;

    public function FTPDataConnectionEvent(type:String, dataConnection:DataConnection):void
    {
        super(type);
        _dataConnection = dataConnection;
    }

    override public function clone():Event
    {
        return new FTPDataConnectionEvent(type, _dataConnection);
    }
}
}

