package project3.talking.gamja.dto.user;

public class NotiDTO {
    private int ann_Seq;  //번호 
    private int class_Id;  // 공지, 안내
    private String ann_Title;  // 제목
    private String ann_Regi;  // 등록일
    private String class_name;  //
    private int ann_Check; // 조회수 
    private String ann_Detail; // 공지사항 내용
    private int lib_id;
    private String lib_name;
    private int viewCount; // 조회수 증가 
    private String ann_attach;// 첨부파일
    private String searchTerm;  
    
    public int getViewCount() {
		return viewCount;
	}
	public String getAnn_attach() {
		return ann_attach;
	}
	public void setAnn_attach(String ann_attach) {
		this.ann_attach = ann_attach;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
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
	private int count;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	private int start;
	private int end;

    public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	
    
    public String getAnn_Detail() {
		return ann_Detail;
	}
	public void setAnn_Detail(String ann_Detail) {
		this.ann_Detail = ann_Detail;
	}
	public int getAnn_Seq() {
		return ann_Seq;
	}
	public void setAnn_Seq(int ann_Seq) {
		this.ann_Seq = ann_Seq;
	}
	public int getClass_Id() {
		return class_Id;
	}
	public void setClass_Id(int class_Id) {
		this.class_Id = class_Id;
	}
	public String getAnn_Title() {
		return ann_Title;
	}
	public void setAnn_Title(String ann_Title) {
		this.ann_Title = ann_Title;
	}
	public String getAnn_Regi() {
		return ann_Regi;
	}
	public void setAnn_Regi(String ann_Regi) {
		this.ann_Regi = ann_Regi;
	}
	
	public int getAnn_Check() {
		return ann_Check;
	}
	public void setAnn_Check(int ann_Check) {
		this.ann_Check = ann_Check;
	}
	@Override
	public String toString() {
		return "NotiDTO [ann_Seq=" + ann_Seq + ", class_Id=" + class_Id
				+ ", ann_Title=" + ann_Title + ", ann_Regi=" + ann_Regi
				+ ", class_name=" + class_name + ", ann_Check=" + ann_Check
				+ ", ann_Detail=" + ann_Detail + ", lib_id=" + lib_id
				+ ", lib_name=" + lib_name + ", viewCount=" + viewCount
				+ ", ann_attach=" + ann_attach + ", count=" + count + ", start="
				+ start + ", end=" + end + "]";
	}
	public String getSearchTerm() {
		return searchTerm;
	}
	public void setSearchTerm(String searchTerm) {
		this.searchTerm = searchTerm;
	}
  
    
   
}