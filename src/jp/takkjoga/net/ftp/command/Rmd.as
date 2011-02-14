package jp.takkjoga.net.ftp.command
{

import jp.takkjoga.net.FTP;
import jp.takkjoga.net.ftp.FTPCommand;
import jp.takkjoga.net.ftp.IFTPCommand;
import jp.takkjoga.net.ftp.FTPReply;

/**
 * ディレクトリ削除
 * Remove Directory
 */
public class Rmd extends FTPCommand implements IFTPCommand
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

    public function evaluateReply(reply:FTPReply):Boolean
    {
        if (reply.replyCode == 250) {
            return true;
        }
        return false;
    }
}
}

