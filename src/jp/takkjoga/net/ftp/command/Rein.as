package jp.takkjoga.net.ftp.command
{

import jp.takkjoga.net.FTP;
import jp.takkjoga.net.ftp.FTPCommand;
import jp.takkjoga.net.ftp.IFTPCommand;
import jp.takkjoga.net.ftp.FTPReply;

/**
 * REINITIALIZE (REIN)
 * no impletement
 */
public class Rein extends FTPCommand implements IFTPCommand
{
    public function Rein():void
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

