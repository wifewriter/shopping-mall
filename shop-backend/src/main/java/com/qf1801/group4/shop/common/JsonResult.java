package com.qf1801.group4.shop.common;

/**
 * JSON结果响应
 *
 */
public class JsonResult {

    private static final String SUCCESS = "成功";
    private static final String ERROR = "失败";

    /**
     * 返回是否成功
     */
    private Boolean result = false;
    /**
     * 返回信息
     */
    private String msg = "";
    /**
     * 返回其他对象信息
     */
    private Object data;

    /**
     * 成功的响应
     * 
     * @return
     */
    public static JsonResult success() {
        return result(true, SUCCESS, null);
    }

    public static JsonResult success(String msg) {
        return result(true, msg, null);
    }

    public static JsonResult success(Object data) {
        return result(true, SUCCESS, data);
    }

    public static JsonResult success(String msg, Object data) {
        return result(true, msg, data);
    }

    /**
     * 失败的响应
     * 
     * @return
     */
    public static JsonResult error() {
        return result(false, ERROR, null);
    }

    public static JsonResult error(String msg) {
        return result(false, msg, null);
    }

    public static JsonResult error(Object data) {
        return result(false, ERROR, data);
    }

    public static JsonResult error(String msg, Object data) {
        return result(false, msg, data);
    }

    public static JsonResult result(Boolean result, String msg, Object data) {
        JsonResult jsonResult = new JsonResult();
        jsonResult.setResult(result);
        jsonResult.setMsg(msg);
        jsonResult.setData(data);
        return jsonResult;
    }

    public Boolean getResult() {
        return result;
    }

    public void setResult(Boolean result) {
        this.result = result;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

}