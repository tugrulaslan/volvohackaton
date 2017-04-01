package com.volvo.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
public class Target {

    @javax.persistence.Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer Id;

    @ManyToOne
    @NotNull
    private KPISubCategory kpiSubCategory;

    @Column
    @NotNull
    String Year;

    @Column
    @NotNull
    Double targetAmount;

    public Target() {
    }

    public Target(KPISubCategory kpiSubCategory, Double targetAmount) {
        this.kpiSubCategory = kpiSubCategory;
        this.targetAmount = targetAmount;
    }

    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
    }

    public KPISubCategory getKpiSubCategory() {
        return kpiSubCategory;
    }

    public void setKpiSubCategory(KPISubCategory kpiSubCategory) {
        this.kpiSubCategory = kpiSubCategory;
    }

    public Double getTargetAmount() {
        return targetAmount;
    }

    public void setTargetAmount(Double targetAmount) {
        this.targetAmount = targetAmount;
    }

    public String getYear() {
        return Year;
    }

    public void setYear(String year) {
        Year = year;
    }

    @Override
    public String toString() {
        return "Target{" +
                "Id=" + Id +
                ", kpiSubCategory=" + kpiSubCategory +
                ", targetAmount=" + targetAmount +
                '}';
    }
}
