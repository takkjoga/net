package jp.takkjoga.net.ftp.command
{

import jp.takkjoga.air.net.FTP;
import jp.takkjoga.air.net.FTPEvent;
import jp.takkjoga.air.net.FTP.*;

/**
 * PASSWORD (PASS)
 */
public class Pass extends AbstractCommand implements ICommand
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

    public function response():Boolean
    {
        if (_receive() == 230) {
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

