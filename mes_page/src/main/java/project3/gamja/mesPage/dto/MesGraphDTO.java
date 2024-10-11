package project3.gamja.mesPage.dto;

import java.sql.Date;

public class MesGraphDTO {
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
				+ ", dm_id=" + dm_id + ", year=" + year + ", month=" + month + ", total=" + total + "]";
	}
	
	
	
	
}
