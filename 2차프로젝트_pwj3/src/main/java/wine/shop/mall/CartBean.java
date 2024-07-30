package wine.shop.mall;

import java.util.Vector;

import wine.shop.ProductBean;
import wine.shop.ProductDao;



public class CartBean {
	//장바구니에는 상품이 여러개 담긴다.
	private Vector<ProductBean> clist; //clist라는 이름으로 관리하는 일종의 저장소를 arraylist로(상품이 여러개 들어오기 때문에) 표현. 여기서는 vector로 해보자
	//clist는 장바구니 역할!
	//장바구니는 하나만 만들어져야 한다. 상품을 담을 때 마다 계속 장바구니가 생성되면 안된다.
	//ProductBean에는 oqty라는 변수를 담을 공간이 없다. pqty라는 재고수량만 있기 때문에 ProductBean에 주문 수량을 담는 용도로 사용할 수 있도록 설정을 해주어야 한다.

	public CartBean() {
		clist = new Vector<ProductBean>();
		System.out.println("CartBean 생성자");
	}

	public void addProduct(String pnum,String oqty) { //상품번호, 주문수량
		ProductDao pdao = ProductDao.getInstance();
		ProductBean pb = pdao.getProductByPnum(pnum);
		pb.setPqty(Integer.parseInt(oqty)); // 주문수량

		int pnum_new = Integer.parseInt(pnum);
		int oqty_new = Integer.parseInt(oqty);


		System.out.println("clist 갯수:" + clist.size());

		int totalPrice = 0;
		int totalPoint = 0;
		int cPqty=0;

		//기존 장바구니에 이미 상품이 담겨있을 때
		for(int i=0;i<clist.size();i++) {
			if(clist.get(i).getPnum() == pnum_new) {
				cPqty = clist.get(i).getPqty(); //기존 주문수량
				clist.get(i).setPqty(cPqty+oqty_new);

				totalPrice += clist.get(i).getPrice() * (cPqty + oqty_new);
				totalPoint += clist.get(i).getPoint() * (cPqty + oqty_new);
				pb.setTotalPrice(totalPrice);
				pb.setTotalPoint(totalPoint);
				return;
			}
		}//for

		//새 상품이 장바구니에 추가 되었을 때
		totalPrice += pb.getPrice() * pb.getPqty();
		totalPoint += pb.getPoint() * pb.getPqty();
		pb.setTotalPrice(totalPrice);
		pb.setTotalPoint(totalPoint);
		clist.add(pb);
	}//addProduct

	public Vector<ProductBean> getAllProducts(){
		return clist; //상품 여러개 담은 벡터
	}

	public void setEdit(String pnum,String oqty) { //상품번호, 수정한 주문수량
		for(int i=0;i<clist.size();i++) {		
			if(Integer.parseInt(pnum) == clist.get(i).getPnum()) {//내가 넘긴 상품번호와 같은 번호가 이미 장바구니에 있는지
				clist.get(i).setPqty(Integer.parseInt(oqty));
				break;
			}
		}
	} //setEdit


	public void removeProduct(String pnum) {
		for(ProductBean pb : clist) {
			if(Integer.parseInt(pnum)== pb.getPnum()) { //같은 번호를 찾았으면 삭제작업
				clist.removeElement(pb);
				break;
			}
		}
	}//removeProduct
	
	public void removeAllProduct() {
		clist.removeAllElements();
	}
}



