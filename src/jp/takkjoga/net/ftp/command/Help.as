package jp.takkjoga.air.net.FTP.commands
{

import jp.takkjoga.air.net.FTP;
import jp.takkjoga.air.net.FTPEvent;
import jp.takkjoga.air.net.FTP.*;

public class Help extends AbstractCommand implements ICommand
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

    public function response():Boolean
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

        Message.instance.text = response;

        if (response.search("214") > -1) {
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

