package jp.takkjoga.net.ftp.command
{

import jp.takkjoga.net.FTP;
import jp.takkjoga.net.ftp.FTPCommand;
import jp.takkjoga.net.ftp.IFTPCommand;
import jp.takkjoga.net.ftp.FTPReply;

/**
 * ディレクトリ作成
 * Make Directory
 */
public class Mkd extends FTPCommand implements IFTPCommand
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

    public function evaluateReply(reply:FTPReply):Boolean
    {
        if (reply.replyCode == 257) {
            return true;
        }
        return false;
    }
}
}

