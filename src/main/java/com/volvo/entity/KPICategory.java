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


}
