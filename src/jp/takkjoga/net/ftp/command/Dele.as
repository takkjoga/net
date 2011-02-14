package jp.takkjoga.air.net.FTP.commands
{

import jp.takkjoga.air.net.FTP;
import jp.takkjoga.air.net.FTPEvent;
import jp.takkjoga.air.net.FTP.*;

/**
 * ファイル削除
 * Delete
 */
public class Dele extends AbstractCommand implements ICommand
{
    private var fileName:String;

    public function Dele(fileName:String):void
    {
        this.fileName = fileName;
    }

    public function execute():void
    {
        var command:String = "DELE " + fileName;
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

