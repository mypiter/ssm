package com.generator.pojo;

/**
 * 用户操作结果消息实体
 * QT001
 */
public class Msg {
    private String statusCode;//请求状态值200表示成功
    private String title;//消息标题
    private String message;//消息内容
    private String filePath;//文件路径（上传成功消息返回）


    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(String statusCode) {
        this.statusCode = statusCode;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
