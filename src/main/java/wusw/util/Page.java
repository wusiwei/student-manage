package wusw.util;



/**
 * 本类应用于查询中分页参数包装
 * <br/>
 * 使用方法：
 * <br/>
 * 1.封一个本类对象到查询bean的属性中;
 * <br/>
 * class QueryBean{
 * 
 * 	Page page;
 * 
 * }
 * <br/>
 * <br/>
 * 2.在查询前，设置一下本类对象的total属性;
 * <br/>
 * page.setTotal(2333);
 * <br/>
 * <br/>
 * 3.可以在查询bean里面获得startRow和endRow进行分页查询.
 * @author cxm
 *
 */
public class Page{
	

	private static Integer DEFAULT_SIZE = 10;
	
	/**
	 * 当前页码
	 */
	private Integer startPage;
	
	/**
	 * 每页大小
	 */
	private Integer pageSize;
	
	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getStartPage() {
		return startPage;
	}

	public void setStartPage(Integer startPage) {
		this.startPage = startPage;
	}

	public void setTotal(Integer total) {

		Integer totalrows   = (total == null || total < 0 )? 0 : total;
		Integer pagesize    = (this.pageSize == null || this.pageSize < 1) ? DEFAULT_SIZE : this.pageSize;
		Integer pagecount   = totalrows / pagesize;
		if(this.startPage<=totalrows){
			return;
		}else{
			this.startPage=pagecount*pagesize;
		}
	}

	
	

}
