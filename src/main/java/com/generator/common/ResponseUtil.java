package com.generator.common;

import com.generator.pojo.Msg;
import net.sf.json.JSONObject;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;


public class ResponseUtil {

	public static void write(Object o, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(o.toString());
		out.flush();
		out.close();
	}

	public static void write(String o, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(o.toString());
		out.flush();
		out.close();
	}

	public static void writeJson(HttpServletResponse respone, String result) {
		//respone.setContentType("application/json;charset=utf-8");
		respone.setContentType("text/html;charset=utf-8");
		PrintWriter out;
		try {
			out = respone.getWriter();
			out.print(result);
			out.flush();
			out.close();
		} catch (Exception e) { 
			// //System.out.println("Comm_Util_writeJson---->" + e);
		}
	}

	/**
	 * 兼容IE消息工具
	 * @param respone
	 * @param o
	 */
	public static void writeJson(HttpServletResponse respone, Msg o) {
		//respone.setContentType("application/json;charset=utf-8");
		JSONObject resultJson = new JSONObject();
		resultJson.put("statusCode",o.getStatusCode());
		resultJson.put("title",o.getTitle());
		resultJson.put("message",o.getMessage());
		respone.setContentType("text/html;charset=utf-8");
		PrintWriter out;
		try {
			out = respone.getWriter();
			out.print(resultJson);
			out.flush();
			out.close();
		} catch (Exception e) {
			// //System.out.println("Comm_Util_writeJson---->" + e);
		}
	}


	/*public static void export(HttpServletResponse response, Workbook wb,
			String fileName) throws Exception {
		response.setHeader("Content-Disposition", "attachment;filename="
				+ new String(fileName.getBytes("utf-8"), "iso8859-1"));
		response.setContentType("application/ynd.ms-excel;charset=UTF-8");
		OutputStream out = response.getOutputStream();
		wb.write(out);
		out.flush();
		out.close();
	}*/
}
