package com.volvo.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
public class Metric {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer Id;

    @Column
    @NotNull
    String name;
}
