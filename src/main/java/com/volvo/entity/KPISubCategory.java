package com.volvo.entity;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Set;

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

    @OneToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "target", joinColumns = { @JoinColumn(name = "kpiSubCategory_Id") }, inverseJoinColumns = { @JoinColumn(name = "id") })
    @Fetch(FetchMode.SELECT)
    Set<Target> target;

    public KPISubCategory() {
    }



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public KPICategory getKpiCategory() {
        return kpiCategory;
    }

    public void setKpiCategory(KPICategory kpiCategory) {
        this.kpiCategory = kpiCategory;
    }

    public Metric getMetric() {
        return metric;
    }

    public void setMetric(Metric metric) {
        this.metric = metric;
    }

    public Set<Target> getTarget() {
        return target;
    }

    public void setTarget(Set<Target> target) {
        this.target = target;
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
