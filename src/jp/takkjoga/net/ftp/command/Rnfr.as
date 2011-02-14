package jp.takkjoga.air.net.FTP.commands
{

import jp.takkjoga.air.net.FTP;
import jp.takkjoga.air.net.FTPEvent;
import jp.takkjoga.air.net.FTP.*;

/**
 * ファイル名を更新する際の
 * 更新ファイル指定コマンド
 * Rename From
 */
public class Rnfr extends AbstractCommand implements ICommand
{
    private var fileName:String;

    public function Rnfr(fileName:String):void
    {
        this.fileName = fileName;
    }

    public function execute():void
    {
        var command:String = "RNFR " + fileName;
        _send(command);
    }

    public function response():Boolean
    {
        if (_receive() == 350) {
            return true;
        }
        return false;
    }
}
}

