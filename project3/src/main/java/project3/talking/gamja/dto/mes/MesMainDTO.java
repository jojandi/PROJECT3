package project3.talking.gamja.dto.mes;

import java.sql.Date;

public class MesMainDTO {
	private Integer ds_id;	
	private Integer bom_code;	
	private Integer total_sales;	
	private Integer date_id;
	 private String genre;  // bom_name
	 private int demand;        // 추가: 수요량
	 private double expectedDemand; // 예측된 수요량
	    private double actualSales;    // 실제 출고량
	    private double accuracyRate;   // 정확도 (예측과 실제 출고량 비교)
	    private int forecastDate;  
	    private int dm_id;            // 도서 ID
	    // 새로운 필드 추가
	    private int orderCount;  // 월별 주문 수량
	    private int deliveryCount;  // 월별 출고 수량
	    
	    public int getOrderCount() {
			return orderCount;
		}
		public void setOrderCount(int orderCount) {
			this.orderCount = orderCount;
		}
		public int getDeliveryCount() {
			return deliveryCount;
		}
		public void setDeliveryCount(int deliveryCount) {
			this.deliveryCount = deliveryCount;
		}

		private Integer notice_id;
		
		private String notice_name;
		
		private java.sql.Date notice_date;
		
		private String notice_contents;
		
		private Integer emp_id;
		
		private String emp_name;
	    

	 public Integer getNotice_id() {
			return notice_id;
		}
		public void setNotice_id(Integer notice_id) {
			this.notice_id = notice_id;
		}
		public String getNotice_name() {
			return notice_name;
		}
		public void setNotice_name(String notice_name) {
			this.notice_name = notice_name;
		}
		public java.sql.Date getNotice_date() {
			return notice_date;
		}
		public void setNotice_date(java.sql.Date notice_date) {
			this.notice_date = notice_date;
		}
		public String getNotice_contents() {
			return notice_contents;
		}
		public void setNotice_contents(String notice_contents) {
			this.notice_contents = notice_contents;
		}
		public Integer getEmp_id() {
			return emp_id;
		}
		public void setEmp_id(Integer emp_id) {
			this.emp_id = emp_id;
		}
		public String getEmp_name() {
			return emp_name;
		}
		public void setEmp_name(String emp_name) {
			this.emp_name = emp_name;
		}
	public int getDm_id() {
			return dm_id;
		}
		public void setDm_id(int dm_id) {
			this.dm_id = dm_id;
		}
	public double getExpectedDemand() {
			return expectedDemand;
		}
		public void setExpectedDemand(double expectedDemand) {
			this.expectedDemand = expectedDemand;
		}
		public double getActualSales() {
			return actualSales;
		}
		public void setActualSales(double actualSales) {
			this.actualSales = actualSales;
		}
		public double getAccuracyRate() {
			return accuracyRate;
		}
		public void setAccuracyRate(double accuracyRate) {
			this.accuracyRate = accuracyRate;
		}
		public int getForecastDate() {
			return forecastDate;
		}
		public void setForecastDate(int forecastDate) {
			this.forecastDate = forecastDate;
		}
	public int getDemand() {
		return demand;
	}
	public void setDemand(int demand) {
		this.demand = demand;
	}

	  public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public Integer getDate_id() {
		return date_id;
		
	}
	public void setDate_id(Integer date_id) {
		this.date_id = date_id;
	}

	private int year;
	    private int month;
	    private int total;

	
	
	public int getYear() {
			return year;
		}
		public void setYear(int year) {
			this.year = year;
		}
		public int getMonth() {
			return month;
		}
		public void setMonth(int month) {
			this.month = month;
		}
		public int getTotal() {
			return total;
		}
		public void setTotal(int total) {
			this.total = total;
		}
	public Integer getDs_id() {
		return ds_id;
	}
	public void setDs_id(Integer ds_id) {
		this.ds_id = ds_id;
	}
	public Integer getBom_code() {
		return bom_code;
	}
	public void setBom_code(Integer bom_code) {
		this.bom_code = bom_code;
	}
	public Integer getTotal_sales() {
		return total_sales;
	}
	public void setTotal_sales(Integer total_sales) {
		this.total_sales = total_sales;
	}
	@Override
	public String toString() {
		return "MesMainDTO [ds_id=" + ds_id + ", bom_code=" + bom_code + ", total_sales=" + total_sales + ", date_id="
				+ date_id + ", genre=" + genre + ", demand=" + demand + ", expectedDemand=" + expectedDemand
				+ ", actualSales=" + actualSales + ", accuracyRate=" + accuracyRate + ", forecastDate=" + forecastDate
				+ ", dm_id=" + dm_id + ", orderCount=" + orderCount + ", deliveryCount=" + deliveryCount
				+ ", notice_id=" + notice_id + ", notice_name=" + notice_name + ", notice_date=" + notice_date
				+ ", notice_contents=" + notice_contents + ", emp_id=" + emp_id + ", emp_name=" + emp_name + ", year="
				+ year + ", month=" + month + ", total=" + total + ", getOrderCount()=" + getOrderCount()
				+ ", getDeliveryCount()=" + getDeliveryCount() + ", getNotice_id()=" + getNotice_id()
				+ ", getNotice_name()=" + getNotice_name() + ", getNotice_date()=" + getNotice_date()
				+ ", getNotice_contents()=" + getNotice_contents() + ", getEmp_id()=" + getEmp_id() + ", getEmp_name()="
				+ getEmp_name() + ", getDm_id()=" + getDm_id() + ", getExpectedDemand()=" + getExpectedDemand()
				+ ", getActualSales()=" + getActualSales() + ", getAccuracyRate()=" + getAccuracyRate()
				+ ", getForecastDate()=" + getForecastDate() + ", getDemand()=" + getDemand() + ", getGenre()="
				+ getGenre() + ", getDate_id()=" + getDate_id() + ", getYear()=" + getYear() + ", getMonth()="
				+ getMonth() + ", getTotal()=" + getTotal() + ", getDs_id()=" + getDs_id() + ", getBom_code()="
				+ getBom_code() + ", getTotal_sales()=" + getTotal_sales() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
	
	
}
