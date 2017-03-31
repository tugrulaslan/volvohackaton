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


    public Metric() {
    }

    public Metric(String name) {
        this.name = name;
    }

    public Integer getId() {
        return Id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Metric{" +
                "Id=" + Id +
                ", name='" + name + '\'' +
                '}';
    }
}
