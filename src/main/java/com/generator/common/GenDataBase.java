package com.generator.common;
import javax.servlet.http.HttpServletResponse;
import java.lang.*;
import java.io.*;
import java.sql.*;
import java.util.*;
public class GenDataBase {
    public final static String driver = "com.mysql.jdbc.Driver";
    public final static String url = "jdbc:mysql://182.61.48.227/ezs?useUnicode=true&characterEncoding=utf8";   //"jdbc:mysql://localhost/gridreport?user=root&password=&useUnicode=true&characterEncoding=utf8"
    public final static String user = "admin";
    public final static String password = "some_pass";
    public enum ResponseDataType
    {
        PlainText, //报表数据为XML或JSON文本，在调试时可以查看报表数据。数据未经压缩，大数据量报表采用此种方式不合适
        ZipBinary, //报表数据为XML或JSON文本经过压缩得到的二进制数据。此种方式数据量最小(约为原始数据的1/10)，但用Ajax方式加载报表数据时不能为此种方式
        ZipBase64, //报表数据为将 ZipBinary 方式得到的数据再进行 BASE64 编码的数据。此种方式适合用Ajax方式加载报表数据
    };
    public class ReportQueryItem
    {
        String QuerySQL;
        String RecordsetName;

        public ReportQueryItem(String AQuerySQL, String ARecordsetName)
        {
            QuerySQL = AQuerySQL;
            RecordsetName = ARecordsetName;
        }
    }

    /////////////////////////////////////////////////////////////////////////////////////////////////////////
//将产生的报表文本数据(XML文本 或 JSON文本)发送给客户端
    public static void ResponseText(HttpServletResponse response, String DataText, ResponseDataType DataType) throws Exception
    {
        response.resetBuffer();

        if (DataType == ResponseDataType.PlainText)
        {
            PrintWriter pw = response.getWriter();
            pw.print(DataText);
            pw.close();  //终止后续不必要内容输出
        }
        else
        {
            byte[] RawData = DataText.getBytes("UTF-8"); //byte[] RawData = DataText.getBytes();
            //写入特有的压缩头部信息，以便报表客户端插件能识别数据
            response.addHeader("gr_zip_type", "deflate");                           //指定压缩方法
            response.addIntHeader("gr_zip_size", RawData.length);                   //指定数据的原始长度
            response.addHeader("gr_zip_encode", response.getCharacterEncoding());   //指定数据的编码方式 utf-8 utf-16 ...
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                baos.close();
                PrintWriter pw = response.getWriter();
                pw.print( (new sun.misc.BASE64Encoder()).encode( baos.toByteArray() ) );
                //pw.print( encodeBASE64( baos.toByteArray() ) );
                pw.close();  //终止后续不必要内容输出

        }
    }
    public static void JSON_GenMultiRecordset(HttpServletResponse response, ArrayList<ReportQueryItem> QueryItems, ResponseDataType DataType)
    {
        try
        {
            Class.forName(driver); // Class.forName 装载驱动程序
            Connection con=DriverManager.getConnection(url,user,password); //用适当的驱动程序类与 DBMS 建立一个连接
            Statement stmt=con.createStatement(); //用于发送简单的SQL语句

            StringBuffer JsonText = new StringBuffer("{\n");
            int Count = 1;
            for (ReportQueryItem QueryItem : QueryItems)
            {
                DoGenOneRecordsetText(JsonText, QueryItem.QuerySQL, QueryItem.RecordsetName, stmt, (Count == QueryItems.size()));
                ++Count;
            }
            JsonText.append('}');

            stmt.close();
            con.close();

            ResponseText(response, JsonText.toString(), DataType);
        }
        catch(Exception e)
        {
            try
            {
                //output error message
                PrintWriter pw = response.getWriter();
                pw.print(e.toString());
            }
            catch(Exception e2) {}
        }
    }
    //产生一条记录
    public static void JSON_GenOneRecordset(HttpServletResponse response, String QuerySQL, ResponseDataType DataType)
    {
        try
        {
            Class.forName(driver); // Class.forName 装载驱动程序
            Connection con=DriverManager.getConnection(url,user,password); //用适当的驱动程序类与 DBMS 建立一个连接
            Statement stmt=con.createStatement(); //用于发送简单的SQL语句

            StringBuffer JsonText = new StringBuffer ("{\n");
            DoGenOneRecordsetText(JsonText, QuerySQL, "row", stmt, true);
            JsonText.append('}');

            stmt.close();
            con.close();

            ResponseText(response, JsonText.toString(), DataType);
        }
        catch(Exception e)
        {
            try
            {
                //output error message
                PrintWriter pw = response.getWriter();
                pw.print(e.toString());
            }
            catch(Exception e2) {}
        }
    }

    private static void DoGenOneRecordsetText(StringBuffer JsonText, String QuerySQL, String RecordsetName, Statement stmt, boolean LastRecordset)
    {
        try
        {
            ResultSet rs=stmt.executeQuery(QuerySQL);

            ResultSetMetaData rsmd = rs.getMetaData();
            int ColCount = rsmd.getColumnCount();

            //StringBuffer JsonText = new StringBuffer("{\"Recordset\":[\n");
            JsonText.append('"');
            JsonText.append(RecordsetName);
            JsonText.append("\":[\n");
            boolean First = true;
            while( rs.next() )
            {
                if (First)
                    First = false;
                else
                    JsonText.append(",\n");
                JsonText.append('{');
                for (int i=1; i<=ColCount; i++)
                {
                    JsonText.append('"');
                    JsonText.append(rsmd.getColumnLabel(i));
                    JsonText.append("\":\"");

                    int ColType = rsmd.getColumnType(i);
                    if (ColType == Types.LONGVARBINARY || ColType == Types.VARBINARY || ColType == Types.BINARY || ColType == Types.BLOB)
                    {
                        byte[] BinData = rs.getBytes(i);
                        if ( !rs.wasNull() )
                            JsonText.append( (new sun.misc.BASE64Encoder()).encode( BinData ) );
                    }
                    else
                    {
                        String Val = rs.getString(i);
                        if ( !rs.wasNull() )
                        {
                            if ( JSON_HasSpecialChar(Val) )
                                JsonText.append( JSON_Encode(Val) );
                            else
                                JsonText.append(Val);
                        }
                    }

                    JsonText.append('"');
                    if (i < ColCount)
                        JsonText.append(',');
                }
                JsonText.append('}');
            }
            JsonText.append("\n]");
            if ( !LastRecordset )
                JsonText.append(',');
            JsonText.append('\n');

            rs.close();
        }
        catch(Exception e)
        {
        }
    }

    //判断是否包含JSON特殊字符
    public static boolean JSON_HasSpecialChar(String text)
    {
        if (text == null)
            return false;

        boolean ret = false;
        int len = text.length();
        for (int i = 0; i < len; ++i)
        {
            char ch = text.charAt(i);
            if (ch == '"' || ch == '\\' || ch == '\r' || ch == '\n' || ch == '\t')
            {
                ret = true;
                break;
            }
        }

        return ret;
    }

    //判断是否包含JSON特殊字符
    public static String JSON_Encode(String text)
    {
        int len = text.length();
        StringBuffer results = new StringBuffer(len + 20);

        for (int i = 0; i < len; ++i)
        {
            char ch = text.charAt(i);
            if (ch == '"' || ch == '\\' || ch == '\r' || ch == '\n' || ch == '\t')
            {
                results.append( '\\');
                if (ch == '"' || ch == '\\')
                    results.append( ch  );
                else if (ch == '\r')
                    results.append( 'r' );
                else if (ch == '\n')
                    results.append( 'n' );
                else if (ch == '\t')
                    results.append( 't' );
            }
            else
            {
                results.append( ch  );
            }
        }

        return results.toString();
    }

}
