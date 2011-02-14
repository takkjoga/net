package jp.takkjoga.net.ftp
{

public interface IIterator
{
    function get next():IFTPCommand;
    function hasNext():Boolean;
}
}

