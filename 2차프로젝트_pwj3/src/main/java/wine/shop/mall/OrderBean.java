package wine.shop.mall;

public class OrderBean {
	private int orderid;
	private String mid;
	private int memno;
	private String mname;
	private String memcard;
	private String pname;
	private int oqty;
	private int amount;
	public OrderBean() {
		super();
	}
	public int getOrderid() {
		return orderid;
	}
	public String getMid() {
		return mid;
	}
	public int getMemno() {
		return memno;
	}
	public String getMemcard() {
		return memcard;
	}
	public String getPname() {
		return pname;
	}
	public int getOqty() {
		return oqty;
	}
	public int getAmount() {
		return amount;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public void setMemno(int memno) {
		this.memno = memno;
	}
	public void setMemcard(String memcard) {
		this.memcard = memcard;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public void setOqty(int oqty) {
		this.oqty = oqty;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMname() {
		return mname;
	}
}
