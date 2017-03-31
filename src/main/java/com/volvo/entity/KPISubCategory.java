package com.volvo.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
public class KPISubCategory {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer Id;

    @Column
    @NotNull
    String name;

    @ManyToOne
    @NotNull
    KPICategory kpiCategory;

    @ManyToOne
    @NotNull
    Metric metric;

    public KPISubCategory() {
    }

    public KPISubCategory(String name, KPICategory kpiCategory, Metric metric) {
        this.name = name;
        this.kpiCategory = kpiCategory;
        this.metric = metric;
    }

    @Override
    public String toString() {
        return "KPISubCategory{" +
                "Id=" + Id +
                ", name='" + name + '\'' +
                ", kpiCategory=" + kpiCategory +
                ", metric=" + metric +
                '}';
    }
}
