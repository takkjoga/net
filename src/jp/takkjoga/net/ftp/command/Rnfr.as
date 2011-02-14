package jp.takkjoga.net.ftp.command
{

import jp.takkjoga.net.FTP;
import jp.takkjoga.net.ftp.FTPCommand;
import jp.takkjoga.net.ftp.IFTPCommand;
import jp.takkjoga.net.ftp.FTPReply;

/**
 * ファイル名を更新する際の
 * 更新ファイル指定コマンド
 * Rename From
 */
public class Rnfr extends FTPCommand implements IFTPCommand
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

    public function evaluateReply(reply:FTPReply):Boolean
    {
        if (reply.replyCode == 350) {
            return true;
        }
        return false;
    }
}
}

