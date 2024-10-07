package project3.gamja.jojandi.dto.user.my;

public class CartDTO {
	private int user_seq;
	private int book_code;
	private int cart_seq;
	private String book_name;
	private String li_book_info;
	private String book_author;
	private String book_pub;
	private String book_img;
	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	public int getBook_code() {
		return book_code;
	}
	public void setBook_code(int book_code) {
		this.book_code = book_code;
	}
	public int getCart_seq() {
		return cart_seq;
	}
	public void setCart_seq(int cart_seq) {
		this.cart_seq = cart_seq;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getLi_book_info() {
		return li_book_info;
	}
	public void setLi_book_info(String li_book_info) {
		this.li_book_info = li_book_info;
	}
	public String getBook_author() {
		return book_author;
	}
	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}
	public String getBook_pub() {
		return book_pub;
	}
	public void setBook_pub(String book_pub) {
		this.book_pub = book_pub;
	}
	public String getBook_img() {
		return book_img;
	}
	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}
	@Override
	public String toString() {
		return "CartDTO [user_seq=" + user_seq + ", book_code=" + book_code + ", cart_seq=" + cart_seq + ", book_name="
				+ book_name + ", li_book_info=" + li_book_info + ", book_author=" + book_author + ", book_pub="
				+ book_pub + ", book_img=" + book_img + "]";
	}
	
	
}
