package up.shop;

public class UsedProdDTO {
	private int upnum;
	private String upname;
	private String upcategory;
	private int uprice;
	private String upimage;
	private String upcontents;
	private String uaddr;
	private String username;
	private String title;
	
	public void setUsername(String username) {
		this.username = username;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUsername() {
		return username;
	}
	public String getTitle() {
		return title;
	}
	public int getUpnum() {
		return upnum;
	}
	public String getUpname() {
		return upname;
	}
	public String getUpcategory() {
		return upcategory;
	}
	public int getUprice() {
		return uprice;
	}
	public String getUpimage() {
		return upimage;
	}
	public String getUpcontents() {
		return upcontents;
	}
	public String getUaddr() {
		return uaddr;
	}
	public void setUpnum(int upnum) {
		this.upnum = upnum;
	}
	public void setUpname(String upname) {
		this.upname = upname;
	}
	public void setUpcategory(String upcategory) {
		this.upcategory = upcategory;
	}
	public void setUprice(int uprice) {
		this.uprice = uprice;
	}
	public void setUpimage(String upimage) {
		this.upimage = upimage;
	}
	public void setUpcontents(String upcontents) {
		this.upcontents = upcontents;
	}
	public void setUaddr(String uaddr) {
		this.uaddr = uaddr;
	}
	public UsedProdDTO() {
		super();

	}
	
	
}
