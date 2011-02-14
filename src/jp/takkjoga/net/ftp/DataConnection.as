package jp.takkjoga.net.ftp
{

import flash.net.Socket;
import flash.events.Event;
import flash.events.ProgressEvent;
import jp.takkjoga.net.ftp.reply.DataConnectionDestination;

public class DataConnection extends Socket
{
    private var _dataConnection:Socket; 

    public function DataConnection(destination:DataConnectionDestination):void
    {
        super(destination.host, destination.port);
    }
}
}
