package jp.takkjoga.net.ftp.command
{

import jp.takkjoga.net.FTP;
import jp.takkjoga.net.ftp.FTPCommand;
import jp.takkjoga.net.ftp.IFTPCommand;
import jp.takkjoga.net.ftp.FTPReply;

/**
 * ファイル名を更新する際の
 * 変更後ファイル名指定コマンド
 * Rename To
 */
public class Rnto extends FTPCommand implements IFTPCommand
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

    public function evaluateReply(reply:FTPReply):Boolean
    {
        if (reply.replyCode == 250) {
            return true;
        }
        return false;
    }
}
}

