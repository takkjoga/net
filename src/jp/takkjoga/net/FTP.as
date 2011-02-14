package jp.takkjoga.net
{

public class FTP
{
    // 改行コード
    public static const CRLF:String = "\r\n";
    
    // 転送形式
    public static const ASCII:String = "A";
    public static const BINARY:String = "I";
    public static const IMAGE:String = "I";
    public static const EBCDIC:String = "E";

    // コントロール接続用ポート番号
    public var controlPort:int = 21;
    // データ接続用ポート番号のデフォルト値
    public var dataPort:int = 20;
}

}

