package jp.takkjoga.net.ftp.command
{

import jp.takkjoga.net.FTP;
import jp.takkjoga.net.ftp.FTPCommand;
import jp.takkjoga.net.ftp.IFTPCommand;
import jp.takkjoga.net.ftp.FTPReply;

/**
 * PASSWORD (PASS)
 */
public class Pass extends FTPCommand implements IFTPCommand
{
    private var password:String;

    public function Pass(password:String):void
    {
        this.password = password;
    }

    public function execute():void
    {
        var command:String = "PASS " + password;
        _send(command);
    }

    public function evaluateReply(reply:FTPReply):Boolean
    {
        if (reply.replyCode == 230) {
            // ログイン成功
            _socket.dispatchEvent(new FTPEvent(FTPEvent.LOGIN));
            return true;
        } else {
            // ログイン失敗
            _socket.dispatchEvent(new FTPEvent(FTPEvent.LOGIN_ERROR));
            return false;
        }
    }
}
}

