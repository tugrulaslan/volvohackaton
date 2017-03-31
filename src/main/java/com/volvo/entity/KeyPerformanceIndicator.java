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


}
