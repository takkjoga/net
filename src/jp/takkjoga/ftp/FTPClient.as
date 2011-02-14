package jp.takkjoga.ftp
{

import flash.errors.*;
import flash.events.*;
import flash.net.Socket;
import jp.takkjoga.net.FTP;
import jp.takkjoga.net.ftp.*;
import jp.takkjoga.net.ftp.command.*;

public class FTPClient extends EventDispatcher
{
    // 接続先ホスト
    private var connectHost:String = '';
    // 現在のディレクトリ
    private var currentDirectory:String = "/";
    // コントロール接続
    private var controlConnection:Socket;
    // データ接続
    private var dataConnection:Socket;

    // コマンドキュー
    private var commands:CommandManager;
    // 受信したファイルデータ
    private var fileData:FileData;

    public function FTPClient():void
    {
        // ファイルデータ取得用のインスタンスを設定
        fileData = FileData.instance;
        fileData.addEventListener(FTPEvent.FILE_DATA_RECIEVED, fileDataRecievedHandler);
        // コントロール接続用のソケットの作成
        controlConnection = new Socket();
        // コマンドリスト管理用インスタンスを設定
        commands = new CommandManager(controlConnection);
    }

    /**
     * 接続
     */
    public function connect(host:String, port:int = FTP.controlPort):Boolean
    {
        connectHost = host;
        controlPort = port;

        commands.send(new Connect(connectHost, controlPort));

        return true;
    }

    /**
     * ログイン
     */
    public function login(user:String, password:String):void
    {
        commands.send(new User(user));
        commands.send(new Pass(password));
        commands.send(new Pwd());
        commands.send(new Pasv());
        commands.send(new List());
    }

    public function parentDirectory():void
    {
        commands.send(new Cdup());
        commands.send(new Pasv());
        commands.send(new List());
    }

    /**
     * ディレクトリの変更
     */
    public function changeDirectory(directory:String):void
    {
        commands.send(new Cwd(directory));
        commands.send(new Pasv());
        commands.send(new List());
    }

    /**
     * ファイルデータの取得
     */
    public function getFile(fileName:String):void
    {
        commands.send(new Type(FTP.BINARY));
        commands.send(new Pasv());
        commands.send(new Retr(fileName));
    }

    /**
     * ファイル名の変更
     */
    public function rename(fileName:String):void
    {
        commands.send(new Rnfr(fileName));
        commands.send(new Rnto(fileName));
        commands.send(new Pasv());
        commands.send(new List());
    }

    /**
     * ファイルの削除
     */
    public function remove(fileName:String):void
    {
        commands.send(new Dele(fileName));
        commands.send(new Pasv());
        commands.send(new List());
    }

    /**
     * ログアウト
     */
    public function logout():void
    {
        commands.send(new Quit());
    }

    /**
     * ヘルプ
     */
    public function help():void
    {
        commands.send(new Help());
    }
}

}

