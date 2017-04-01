package com.volvo.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
public class KPICategory {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer Id;

	@Column
	@NotNull
	String name;

	public KPICategory() {
	}

	public KPICategory(String name) {
		this.name = name;
	}

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "KPICategory{" + "Id=" + Id + ", name='" + name + '\'' + '}';
	}
}
