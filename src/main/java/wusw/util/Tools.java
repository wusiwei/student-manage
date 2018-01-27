package wusw.util;

import java.util.List;

import org.apache.commons.collections4.ListUtils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

public class Tools {

	/**
	 * 封装返回 TableData JSON数据，包含执行结果
	 * @param total 结果说明，结果数量
	 * @param pageList 结果列表，执行失败时该结果可设置为null
	 * @return String  JSON
	 */
	public static String toTableDataGrid(Integer total, List<?> result) {
		try {
			List<?> r = ListUtils.emptyIfNull(result);
			
			ObjectMapper mapper = new ObjectMapper();
			
			ObjectNode list = mapper.createObjectNode();
			list.put("total", r.isEmpty() ? 0 : (total > 0 ? total : 0));
			list.putPOJO("rows", r);
			
			ObjectNode node = mapper.createObjectNode(); 
			node.put("result", true);
			node.putAll(list);
			return mapper.writeValueAsString(node);
		}
		catch (JsonProcessingException e) {
			throw new IllegalStateException(e);
		}
	}
	
	
	/**
	 * 包装返回一个消息
	 * @param result
	 * @param message
	 * @return
	 */
	public static  String ToResult(Boolean result, String message){
		try {
			ObjectMapper mapper = new ObjectMapper();
			
			ObjectNode node = mapper.createObjectNode();
			node.put("result", result);
			node.put("message", message);
			return  mapper.writeValueAsString(node);
		}
		catch (JsonProcessingException e) {
			throw new IllegalStateException(e);
		}
		
	}
	
	/**
	 * 包装返回一个对象
	 * @param result
	 * @param data
	 * @return
	 */
	public static  String ToObjectResult(Boolean result, Object data){
		try {
			ObjectMapper mapper = new ObjectMapper();
			
			ObjectNode node = mapper.createObjectNode();
			node.put("result", result);
			node.putPOJO("data", data);
			return  mapper.writeValueAsString(node);
		}
		catch (JsonProcessingException e) {
			throw new IllegalStateException(e);
		}
		
	}
}
