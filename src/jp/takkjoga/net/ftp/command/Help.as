package jp.takkjoga.net.ftp.command
{

import jp.takkjoga.net.FTP;
import jp.takkjoga.net.ftp.FTPCommand;
import jp.takkjoga.net.ftp.IFTPCommand;
import jp.takkjoga.net.ftp.FTPReply;

public class Help extends FTPCommand implements IFTPCommand
{
    private var count:int = 0;

    public function Help():void
    {
    }

    public function execute():void
    {
        var command:String = "HELP";
        _send(command);
    }

    public function evaluateReply(reply:FTPReply):Boolean
    {
        /*
        if (_receive().search(214) > -1) {
            if (count == 0) {
                count ++;
                return false;
            } else {
                return true;
            }
        }
        return false;
        */
        var response:String = _socket.readUTFBytes(_socket.bytesAvailable);

        if (response.search("214") > -1) {
        //if (reply.replyCode == 214) {
            if (count == 0) {
                count ++;
                return false;
            } else {
                return true;
            }
        }
        return false;
    }
}
}

