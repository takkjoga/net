package jp.takkjoga.air.net.FTP.commands
{

import jp.takkjoga.air.net.FTP;
import jp.takkjoga.air.net.FTPEvent;
import jp.takkjoga.air.net.FTP.*;

/**
 * ディレクトリ削除
 * Remove Directory
 */
public class Rmd extends AbstractCommand implements ICommand
{
    private var directoryName:String;

    public function Rmd(directoryName:String):void
    {
        this.directoryName = directoryName;
    }

    public function execute():void
    {
        var command:String = "RMD " + directoryName;
        _send(command);
    }

    public function response():Boolean
    {
        if (_receive() == 250) {
            return true;
        }
        return false;
    }
}
}

