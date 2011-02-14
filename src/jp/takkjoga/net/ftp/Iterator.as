package jp.takkjoga.net.ftp
{

public class Iterator implements IIterator
{
    private var commands:Vector.<IFTPCommand> = new Vector.<IFTPCommand>;
    private var index:int = 0;
    public var length:int = 0;

    public function Iterator():void
    {
    }

    public function get next():IFTPCommand
    {
        return commands[index ++];
    }

    public function get current():IFTPCommand
    {
        return commands[index];
    }

    public function hasNext():Boolean
    {
        return index < commands.length;
    }

    public function push(command:IFTPCommand):void
    {
        commands.push(command);
        length ++;
    }

    public function shift():IFTPCommand
    {
        length --;
        return commands.shift();
    }

    public function unshift(command:IFTPCommand):uint
    {
        length ++;
        return commands.unshift(command);
    }

    public function clean():void
    {
        commands = new Vector.<IFTPCommand>;

        length = 0;
        index = 0;
    }
}
}

