package jp.takkjoga.air.net.FTP.commands
{

import jp.takkjoga.air.net.FTP;
import jp.takkjoga.air.net.FTPEvent;
import jp.takkjoga.air.net.FTP.*;

/**
 * ディレクトリ作成
 * Make Directory
 */
public class Mkd extends AbstractCommand implements ICommand
{
    private var directoryName:String;

    public function Mkd(directoryName:String):void
    {
        this.directoryName = directoryName;
    }

    public function execute():void
    {
        var command:String = "MKD " + directoryName;
        _send(command);
    }

    public function response():Boolean
    {
        if (_receive() == 257) {
            return true;
        }
        return false;
    }
}
}

