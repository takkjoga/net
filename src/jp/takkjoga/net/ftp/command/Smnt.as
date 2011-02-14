package jp.takkjoga.net.ftp.command
{

import jp.takkjoga.net.FTP;
import jp.takkjoga.net.ftp.FTPCommand;
import jp.takkjoga.net.ftp.IFTPCommand;
import jp.takkjoga.net.ftp.FTPReply;

/**
 * STRUCTURE MOUNT (SMNT)
 * no impletement
 */
public class Smnt extends FTPCommand implements IFTPCommand
{
    public function Smnt():void
    {
    }

    public function execute():void
    {
    }

    public function evaluateReply(reply:FTPReply):Boolean
    {
    }
}
}

