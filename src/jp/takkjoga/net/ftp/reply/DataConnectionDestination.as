package jp.takkjoga.net.ftp.reply
{

import jpt.takkjoga.net.ftp.*;
import jpt.takkjoga.net.ftp.reply.DataConnectionDestination;

public class DataConnectionDestination
{
    private var _host:String;
    private var _port:int;

    public function DataConnectionDestination(reply:String):void
    {
        _analyze(reply);
    }

    private function _analyze(reply:String):void
    {
        // IP アドレスとポート番号を取得
        var start:int = _reply.indexOf('(') + 1;
        var end:int = _reply.indexOf(')');
        /**
         * IP アドレスとポートが見つからなかったら
         * exception
         */
        var ipAddressAndPort:String = _reply.substring(start, end);
        var ipAddressAndPortArray:Array = ipAddressAndPort.split(',');
        _port = parseInt(ipAddressAndPortArray.pop()) + (parseInt(ipAddressAndPortArray.pop()) << 8);
        _host = ipAddressAndPortArray.join(".");
    }

    public function get host():String
    {
        return _host;
    }

    public function get port():int
    {
        return _port;
    }
}
}
