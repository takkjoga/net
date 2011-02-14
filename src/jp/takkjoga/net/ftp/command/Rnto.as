package jp.takkjoga.air.net.FTP.commands
{

import jp.takkjoga.air.net.FTP;
import jp.takkjoga.air.net.FTPEvent;
import jp.takkjoga.air.net.FTP.*;

/**
 * ファイル名を更新する際の
 * 変更後ファイル名指定コマンド
 * Rename To
 */
public class Rnto extends AbstractCommand implements ICommand
{
    private var fileName:String;

    public function Rnto(fileName:String):void
    {
        this.fileName = fileName;
    }

    public function execute():void
    {
        var command:String = "RNTO " + fileName;
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

