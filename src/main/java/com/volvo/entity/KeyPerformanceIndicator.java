package com.volvo.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

@Entity
public class KeyPerformanceIndicator extends AbstractEntity {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer Id;

	@Column
	@NotNull
	private Date date;

	@Column
	private String plantName;

	@Column
	private String kpiType;

	@ManyToOne
	@NotNull
	private KPICategory kpiCategory;

	@ManyToOne
	@NotNull
	private KPISubCategory kpiSubCategory;

	@Transient
	private Map<String, String> orgLevelData = new TreeMap<String, String>();

	public Map<String, String> getOrgLevelData() {
		Map<String, String> data = new HashMap<>();
		data.put("WROCLAW", "WROCLAW");
		data.put("MEXICO", "MEXICO");
		data.put("ST. CLAIRE", "ST. CLAIRE");
		return data;
	}

	@Column
	@NotNull
	Double amount;

	public KeyPerformanceIndicator() {
	}

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public KeyPerformanceIndicator(Date date, String plantName, String kpiType, KPICategory kpiCategory,
			KPISubCategory kpiSubCategory, Double amount) {
		this.date = date;
		this.plantName = plantName;
		this.kpiType = kpiType;
		this.kpiCategory = kpiCategory;
		this.kpiSubCategory = kpiSubCategory;
		this.amount = amount;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getPlantName() {
		return plantName;
	}

	public void setPlantName(String plantName) {
		this.plantName = plantName;
	}

	public String getKpiType() {
		return kpiType;
	}

	public void setKpiType(String kpiType) {
		this.kpiType = kpiType;
	}

	public KPICategory getKpiCategory() {
		return kpiCategory;
	}

	public void setKpiCategory(KPICategory kpiCategory) {
		this.kpiCategory = kpiCategory;
	}

	public KPISubCategory getKpiSubCategory() {
		return kpiSubCategory;
	}

	public void setKpiSubCategory(KPISubCategory kpiSubCategory) {
		this.kpiSubCategory = kpiSubCategory;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "KeyPerformanceIndicator{" + "Id=" + Id + ", date=" + date + ", plantName='" + plantName + '\''
				+ ", kpiType='" + kpiType + '\'' + ", kpiCategory=" + kpiCategory + ", kpiSubCategory=" + kpiSubCategory
				+ ", amount=" + amount + '}';
	}
}
