package jp.takkjoga.net.ftp.events
{

import flash.errors.*;
import flash.events.Event;

public class FileListRecieveEvent extends Event
{
    public static const FILE_LIST_RECIEVED:String = "fileListRecieved";

    public var fileList:Array;

    public function FileListRecieveEvent(type:Stringf, fileList:Array = null):void
    {
        super(type);
        this.fileList = fileList;
    }
}
}

