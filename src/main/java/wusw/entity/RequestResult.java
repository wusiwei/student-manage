package wusw.entity;

/**
 * 实体类，请求结果
 * @author wusiwei
 *
 */
public class RequestResult {
	private int status;
	
	private String msg;
	
	private Object data;

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
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
