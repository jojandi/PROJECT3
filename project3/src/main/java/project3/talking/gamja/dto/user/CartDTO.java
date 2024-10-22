package project3.talking.gamja.dto.user;

public class CartDTO {
	private int user_seq;
	private int book_code;
	private int cart_seq;
	private String book_name;
	private String li_book_info;
	private String book_author;
	private String book_pub;
	private String book_img;
	private String[] book_codes;
	private String[] cart_seqs;
	private int lib_id;
	private long book_ISBN;
	private String lib_name;
	private int count;
	private int book_loan_seq;
	private boolean book_loan;
	private boolean book_res;
	private String lib_add;
	private Integer lib_call;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getBook_loan_seq() {
		return book_loan_seq;
	}
	public void setBook_loan_seq(int book_loan_seq) {
		this.book_loan_seq = book_loan_seq;
	}
	public boolean isBook_loan() {
		return book_loan;
	}
	public void setBook_loan(boolean book_loan) {
		this.book_loan = book_loan;
	}
	public boolean isBook_res() {
		return book_res;
	}
	public void setBook_res(boolean book_res) {
		this.book_res = book_res;
	}
	public String getLib_add() {
		return lib_add;
	}
	public void setLib_add(String lib_add) {
		this.lib_add = lib_add;
	}
	public Integer getLib_call() {
		return lib_call;
	}
	public void setLib_call(Integer lib_call) {
		this.lib_call = lib_call;
	}
	public long getBook_ISBN() {
		return book_ISBN;
	}
	public void setBook_ISBN(long book_ISBN) {
		this.book_ISBN = book_ISBN;
	}
	public int getLib_id() {
		return lib_id;
	}
	public void setLib_id(int lib_id) {
		this.lib_id = lib_id;
	}
	public String getLib_name() {
		return lib_name;
	}
	public void setLib_name(String lib_name) {
		this.lib_name = lib_name;
	}
	public String[] getBook_codes() {
		return book_codes;
	}
	public void setBook_codes(String[] book_codes) {
		this.book_codes = book_codes;
	}
	public String[] getCart_seqs() {
		return cart_seqs;
	}
	public void setCart_seqs(String[] cart_seqs) {
		this.cart_seqs = cart_seqs;
	}
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
