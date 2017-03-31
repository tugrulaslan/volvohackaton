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


}
