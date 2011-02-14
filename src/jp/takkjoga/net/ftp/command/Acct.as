package jp.takkjoga.net.ftp.command
{

import jp.takkjoga.net.FTP;
import jp.takkjoga.net.ftp.FTPCommand;
import jp.takkjoga.net.ftp.IFTPCommand;
import jp.takkjoga.net.ftp.FTPReply;

/**
 * ACCOUNT (ACCT)
 * no impletement
 */
public class Acct extends FTPCommand implements IFTPCommand
{
    public function Acct():void
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

