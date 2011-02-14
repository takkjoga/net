package jp.takkjoga.net.ftp
{

import jp.takkjoga.net.ftp.*;

public interface IFTPCommand
{
    function set controlConnection(controlConnection:ControlConnection):void;
    function execute():void;
    function evaluateResponse(responseCode:int):Boolean;
}
}
