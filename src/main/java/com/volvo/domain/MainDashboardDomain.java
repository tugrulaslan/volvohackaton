package com.volvo.domain;

public class MainDashboardDomain {

	private String year;
	private String month;
	private String valueType;
	private String plantRegion;
	private String orgLevel;

	public MainDashboardDomain() {

	}

	public MainDashboardDomain(String year, String month, String valueType, String plantRegion, String orgLevel) {
		super();
		this.year = year;
		this.month = month;
		this.valueType = valueType;
		this.plantRegion = plantRegion;
		this.orgLevel = orgLevel;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getValueType() {
		return valueType;
	}

	public void setValueType(String valueType) {
		this.valueType = valueType;
	}

	public String getPlantRegion() {
		return plantRegion;
	}

	public void setPlantRegion(String plantRegion) {
		this.plantRegion = plantRegion;
	}

	public String getOrgLevel() {
		return orgLevel;
	}

	public void setOrgLevel(String orgLevel) {
		this.orgLevel = orgLevel;
	}

	@Override
	public String toString() {
		return "MainDashboardDomain [year=" + year + ", month=" + month + ", valueType=" + valueType + ", plantRegion="
				+ plantRegion + ", orgLevel=" + orgLevel + "]";
	}

}