package kr.co.dong.board;

public class ProductDTO {

	private String b_p_code;
	private String b_p_category;
	private String b_product;
	private int b_price;
	private int b_sale;
	private String b_pcontent;
	private int b_spoint;
	private int b_num;
	private int b_discount;
	private String u_p_id;
	private String keyWord;
	
	public String getB_p_code() {
		return b_p_code;
	}
	public void setB_p_code(String b_p_code) {
		this.b_p_code = b_p_code;
	}
	public String getB_p_category() {
		return b_p_category;
	}
	public void setB_p_category(String b_p_category) {
		this.b_p_category = b_p_category;
	}
	public String getB_product() {
		return b_product;
	}
	public void setB_product(String b_product) {
		this.b_product = b_product;
	}
	public int getB_price() {
		return b_price;
	}
	public void setB_price(int b_price) {
		this.b_price = b_price;
	}
	public int getB_sale() {
		return b_sale;
	}
	public void setB_sale(int b_sale) {
		this.b_sale = b_sale;
	}
	public String getB_pcontent() {
		return b_pcontent;
	}
	public void setB_pcontent(String b_pcontent) {
		this.b_pcontent = b_pcontent;
	}
	public int getB_spoint() {
		return b_spoint;
	}
	public void setB_spoint(int b_spoint) {
		this.b_spoint = b_spoint;
	}
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public int getB_discount() {
		return b_discount;
	}
	public void setB_discount(int b_discount) {
		this.b_discount = b_discount;
	}
	public String getU_p_id() {
		return u_p_id;
	}
	public void setU_p_id(String u_p_id) {
		this.u_p_id = u_p_id;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	
	@Override
	public String toString() {
		return "ProductDTO [b_p_code=" + b_p_code + ", b_p_category=" + b_p_category + ", b_product=" + b_product
				+ ", b_price=" + b_price + ", b_sale=" + b_sale + ", b_pcontent=" + b_pcontent + ", b_spoint="
				+ b_spoint + ", b_num=" + b_num + ", b_discount=" + b_discount + ", u_p_id=" + u_p_id + ", keyWord="
				+ keyWord + "]";
	}
	
}
