package com.volvo.entity;



public class SafetyComponent {

    private Double currentValue = 0.0;
    private String unit = "accidents/hrs worked x 200 000";
    private Double targetThisYear = 0.0;
    private Double targetThisYearMinus1 = 0.0;
    private Double targetThisYearMinus2 = 0.0;

    public Double getCurrentValue() {
        return currentValue;
    }

    public void setCurrentValue(Double currentValue) {
        this.currentValue = currentValue;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public Double getTargetThisYear() {
        return targetThisYear;
    }

    public void setTargetThisYear(Double targetThisYear) {
        this.targetThisYear = targetThisYear;
    }

    public Double getTargetThisYearMinus1() {
        return targetThisYearMinus1;
    }

    public void setTargetThisYearMinus1(Double targetThisYearMinus1) {
        this.targetThisYearMinus1 = targetThisYearMinus1;
    }

    public Double getTargetThisYearMinus2() {
        return targetThisYearMinus2;
    }

    public void setTargetThisYearMinus2(Double targetThisYearMinus2) {
        this.targetThisYearMinus2 = targetThisYearMinus2;
    }
}
