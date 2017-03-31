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
    Double targetAmount;
}
