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

    @Override
    public String toString() {
        return "KPICategory{" +
                "Id=" + Id +
                ", name='" + name + '\'' +
                '}';
    }
}
