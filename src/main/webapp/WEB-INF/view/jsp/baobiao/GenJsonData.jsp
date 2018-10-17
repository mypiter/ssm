<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file = "GenDataBase.jsp" %>
<%!


/////////////////////////////////////////////////////////////////////////////////////////
//方法简要说明
//1. JSON_GenMultiRecordset：产生多个记录集的 JSON 数据
//2. JSON_GenOneRecordset：产生一个记录集的  JSON 数据

public static void JSON_GenMultiRecordset(HttpServletResponse response, ArrayList<ReportQueryItem> QueryItems, ResponseDataType DataType)
{
    try
{
    Class.forName(mysql_jdbc_param.driver); // Class.forName 装载驱动程序
    Connection con=DriverManager.getConnection(mysql_jdbc_param.url, mysql_jdbc_param.user, mysql_jdbc_param.password); //用适当的驱动程序类与 DBMS 建立一个连接
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
public static void JSON_GenMultiRecordset(HttpServletResponse response, ArrayList<ReportQueryItem> QueryItems)
{
    JSON_GenMultiRecordset(response, QueryItems, DefaultReportDataType);
}
//产生一条记录
public static void JSON_GenOneRecordset(HttpServletResponse response, String QuerySQL, ResponseDataType DataType)
{
    try
    {
        Class.forName(mysql_jdbc_param.driver); // Class.forName 装载驱动程序
        Connection con=DriverManager.getConnection(mysql_jdbc_param.url, mysql_jdbc_param.user, mysql_jdbc_param.password); //用适当的驱动程序类与 DBMS 建立一个连接
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
public static void JSON_GenOneRecordset(HttpServletResponse response, String QuerySQL)
{
    JSON_GenOneRecordset(response, QuerySQL, DefaultReportDataType);
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











            
/////////////////////////////////////////////////////////////////////////////////////////
//特别提示：以下函数为兼容以前版本而保留，请勿再用之，无须兼容考虑可删除之
//<<保留前面版本的函数，兼容以前版本所写程序
//方法简要说明
//1. JSON_GenDetailData：产生报表明细记录数据，数据将被加载到明细网格的记录集中
//3. JSON_GenParameterData：产生报表参数数据，数据将加载到报表参数、非明细网格中的部件框中 
//2. JSON_GenEntireData：同时产生报表明细记录数据与报表参数数据
         
//产生报表明细记录数据，数据将被加载到明细网格的记录集中
public static void JSON_GenDetailData(HttpServletResponse response, String QuerySQL, ResponseDataType DataType)
{
    JSON_GenOneRecordset(response, QuerySQL, DataType);
}
public static void JSON_GenDetailData(HttpServletResponse response, String QuerySQL)
{
    JSON_GenOneRecordset(response, QuerySQL, DefaultReportDataType);
}

//根据RecordsetQuerySQL获取报表明细数据，对应数据加载到报表的明细网格的记录集中
//并同时将ParameterPart中的报表参数数据一起打包，对应数据加载到报表参数、非明细网格中的部件框中
public static void JSON_GenEntireData(HttpServletResponse response, String QuerySQL, String ParameterPart, ResponseDataType DataType)
{
    try
    {
        try
        {
            Class.forName(mysql_jdbc_param.driver); // Class.forName 装载驱动程序
            Connection con=DriverManager.getConnection(mysql_jdbc_param.url, mysql_jdbc_param.user, mysql_jdbc_param.password); //用适当的驱动程序类与 DBMS 建立一个连接
            Statement stmt=con.createStatement();                         //用于发送简单的SQL语句
            ResultSet rs=stmt.executeQuery(QuerySQL);
            ResultSetMetaData rsmd = rs.getMetaData();
            int ColCount = rsmd.getColumnCount();
            
            boolean First = true;
            StringBuffer JsonText = new StringBuffer("{\"Recordset\":[\n");
            while( rs.next() ) 
            {
                if (First)
                    First = false;
                else
                    JsonText.append(',');
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
            JsonText.append("],\n");
		    
            rs.close();
            stmt.close();
            con.close();
            
            JsonText.append(ParameterPart);
            JsonText.append("\n}");
            
            ResponseText(response, JsonText.toString(), DataType);
        }
        catch(Exception e)
        {
            //output error message
            PrintWriter pw = response.getWriter();
            pw.print(e.toString());
        }
    }
    catch(Exception e)
    {
    }
}
public static void JSON_GenEntireData(HttpServletResponse response, String QuerySQL, String ParameterPart)
{
    JSON_GenEntireData(response, QuerySQL, ParameterPart, DefaultReportDataType);
}

//这里只产生报表参数数据，数据将加载到报表参数、非明细网格中的部件框中
//当报表没有明细时，调用本方法生成数据，查询SQL应该只能查询出一条记录
public static void JSON_GenParameterData(HttpServletResponse response, String QuerySQL, ResponseDataType DataType)
{
    try
    {
        StringBuffer JsonText = new StringBuffer("{");
  		String ParameterPart = JSON_GenParameterText(QuerySQL);
        JsonText.append(ParameterPart);
        JsonText.append("}");
		
        ResponseText(response, JsonText.toString(), DataType);
    }
    catch(Exception e)
    {
    }
}
public static void JSON_GenParameterData(HttpServletResponse response, String QuerySQL)
{
    JSON_GenParameterData(response, QuerySQL, DefaultReportDataType);
}


//根据ParameterQuerySQL获取的报表参数数据一起打包
public static String JSON_GenParameterText(String ParameterQuerySQL)
{
    StringBuffer JsonText = new StringBuffer();
    
    try
    {
        Class.forName(mysql_jdbc_param.driver); // Class.forName 装载驱动程序
        Connection con=DriverManager.getConnection(mysql_jdbc_param.url, mysql_jdbc_param.user, mysql_jdbc_param.password); //用适当的驱动程序类与 DBMS 建立一个连接
        Statement stmt=con.createStatement();                         //用于发送简单的SQL语句
        ResultSet rs=stmt.executeQuery(ParameterQuerySQL);
        ResultSetMetaData rsmd = rs.getMetaData();
        rs.next();
        
        int ColCount = rsmd.getColumnCount();
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
            
        rs.close();
        stmt.close();
        con.close();
    }
    catch(Exception e)
    {
        //output error message
        JsonText.append(e.toString());
    }
    
    return JsonText.toString();
}
//>>保留前面版本的函数，兼容以前版本所写程序

%> 