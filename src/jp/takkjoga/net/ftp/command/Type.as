package jp.takkjoga.air.net.FTP.commands
{

import jp.takkjoga.air.net.FTP;
import jp.takkjoga.air.net.FTPEvent;
import jp.takkjoga.air.net.FTP.*;

public class Type extends AbstractCommand implements ICommand
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

    public function response():Boolean
    {
        if (_receive() == 200) {
            return true;
        }
        return false;
    }
}
}

