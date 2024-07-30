package wine.member;

public class MemberDTO {
	private int no;
	private String name;
	private String id;
	private String password;
	private String rrn1;
	private String rrn2;
	private String email;
	private String hp1;
	private String hp2;
	private String hp3;
	private String joindate;
	private String card;
	private String addr;
	private String subaddr;
	
	public void setSubaddr(String subaddr) {
		this.subaddr = subaddr;
	}
	public String getSubaddr() {
		return subaddr;
	}
	public int getNo() {
		return no;
	}
	public String getName() {
		return name;
	}
	public String getId() {
		return id;
	}
	public String getPassword() {
		return password;
	}
	public String getRrn1() {
		return rrn1;
	}
	public String getRrn2() {
		return rrn2;
	}
	public String getEmail() {
		return email;
	}
	public String getHp1() {
		return hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public String getJoindate() {
		return joindate;
	}
	public String getCard() {
		return card;
	}
	public String getAddr() {
		return addr;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setRrn1(String rrn1) {
		this.rrn1 = rrn1;
	}
	public void setRrn2(String rrn2) {
		this.rrn2 = rrn2;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public void setCard(String card) {
		this.card = card;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public MemberDTO() {
		super();
	}
	
}
