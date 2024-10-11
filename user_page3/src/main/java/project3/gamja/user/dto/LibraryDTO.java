package project3.gamja.user.dto;

public class LibraryDTO {

	private Integer lib_id;
	private String lib_name;
	private String lib_add;
	private String lib_parking;
	private String lib_seat;
	private String lib_open;
	private String lib_facil;
	private Integer lib_call;
	private String lib_pic;
	public Integer getLib_id() {
		return lib_id;
	}
	public void setLib_id(Integer lib_id) {
		this.lib_id = lib_id;
	}
	public String getLib_name() {
		return lib_name;
	}
	public void setLib_name(String lib_name) {
		this.lib_name = lib_name;
	}
	public String getLib_add() {
		return lib_add;
	}
	public void setLib_add(String lib_add) {
		this.lib_add = lib_add;
	}
	public String getLib_parking() {
		return lib_parking;
	}
	public void setLib_parking(String lib_parking) {
		this.lib_parking = lib_parking;
	}
	public String getLib_seat() {
		return lib_seat;
	}
	public void setLib_seat(String lib_seat) {
		this.lib_seat = lib_seat;
	}
	public String getLib_open() {
		return lib_open;
	}
	public void setLib_open(String lib_open) {
		this.lib_open = lib_open;
	}
	public String getLib_facil() {
		return lib_facil;
	}
	public void setLib_facil(String lib_facil) {
		this.lib_facil = lib_facil;
	}
	public Integer getLib_call() {
		return lib_call;
	}
	public void setLib_call(Integer lib_call) {
		this.lib_call = lib_call;
	}
	public String getLib_pic() {
		return lib_pic;
	}
	public void setLib_pic(String lib_pic) {
		this.lib_pic = lib_pic;
	}
	@Override
	public String toString() {
		return "LibraryDTO [lib_id=" + lib_id + ", lib_name=" + lib_name + ", lib_add=" + lib_add + ", lib_parking="
				+ lib_parking + ", lib_seat=" + lib_seat + ", lib_open=" + lib_open + ", lib_facil=" + lib_facil
				+ ", lib_call=" + lib_call + ", lib_pic=" + lib_pic + "]";
	}
	
}
