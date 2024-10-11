package project3.gamja.admin.dto;

public class NotiFileDTO {
	
	private int writeNum;
	private String title;
	private String content;
	private String regDate;
	private int hitNum;
	private String imgFile;
	private String writer;
	
	public int getWriteNum() {
		return writeNum;
	}
	public void setWriteNum(int writeNum) {
		this.writeNum = writeNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getHitNum() {
		return hitNum;
	}
	public void setHitNum(int hitNum) {
		this.hitNum = hitNum;
	}
	public String getImgFile() {
		return imgFile;
	}
	public void setImgFile(String imgFile) {
		this.imgFile = imgFile;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	@Override
	public String toString() {
		return "NotiFileDTO [writeNum=" + writeNum + ", title=" + title
				+ ", content=" + content + ", regDate=" + regDate + ", hitNum="
				+ hitNum + ", imgFile=" + imgFile + ", writer=" + writer
				+ ", getWriteNum()=" + getWriteNum() + ", getTitle()="
				+ getTitle() + ", getContent()=" + getContent()
				+ ", getRegDate()=" + getRegDate() + ", getHitNum()="
				+ getHitNum() + ", getImgFile()=" + getImgFile()
				+ ", getWriter()=" + getWriter() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}

	
}
