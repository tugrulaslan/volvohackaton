package com.volvo.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;

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

    @Column
    @NotNull
    Double amount;

    public KeyPerformanceIndicator() {
    }

    public KeyPerformanceIndicator(Date date, String plantName, String kpiType, KPICategory kpiCategory, KPISubCategory kpiSubCategory, Double amount) {
        this.date = date;
        this.plantName = plantName;
        this.kpiType = kpiType;
        this.kpiCategory = kpiCategory;
        this.kpiSubCategory = kpiSubCategory;
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "KeyPerformanceIndicator{" +
                "Id=" + Id +
                ", date=" + date +
                ", plantName='" + plantName + '\'' +
                ", kpiType='" + kpiType + '\'' +
                ", kpiCategory=" + kpiCategory +
                ", kpiSubCategory=" + kpiSubCategory +
                ", amount=" + amount +
                '}';
    }
}
