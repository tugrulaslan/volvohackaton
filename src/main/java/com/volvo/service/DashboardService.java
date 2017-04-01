package com.volvo.service;

import com.volvo.entity.SafetyComponent;

/**
 * Created by a237771 on 2017-04-01.
 */
public interface DashboardService {

    SafetyComponent getSafetyComponent(Integer year, String plantName);
}
