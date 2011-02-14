package jp.takkjoga.net.ftp.events
{

import flash.errors.*;
import flash.events.Event;

public class FileDataRecieveEvent extends Event
{
    public static const FILE_DATA_RECIEVED:String = "fileDataRecieved";

    public var fileData:String;

    public function FileDataRecieveEvent(type:String, fileData:String = null):void
    {
        super(type);
        this.fileData = fileData;
    }
}
}

