package com.volvo.service;

import com.volvo.dao.KeyPerformanceIndicatorDAO;
import com.volvo.entity.KeyPerformanceIndicator;
import com.volvo.entity.SafetyComponent;
import com.volvo.entity.Target;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

@Service
@Transactional
public class DashboardServiceImpl implements DashboardService {


    @Autowired
    private
    KeyPerformanceIndicatorDAO keyPerformanceIndicatorDAO;

    @Override
    public SafetyComponent getSafetyComponent(Integer year, String plantName) {
        List<KeyPerformanceIndicator> keyPerformanceIndicators = keyPerformanceIndicatorDAO.getKeyPerformanceIndicator(year, plantName);
        SafetyComponent s = new SafetyComponent();
        if (keyPerformanceIndicators != null && keyPerformanceIndicators.size() > 0) {
            Double amount = 0.0;

            for (KeyPerformanceIndicator k : keyPerformanceIndicators) {
                amount += k.getAmount();
            }


            s.setCurrentValue(amount);
            KeyPerformanceIndicator keyPerformanceIndicator = keyPerformanceIndicators.get(0);
            s.setUnit(keyPerformanceIndicator.getKpiSubCategory().getMetric().getName());
            Set<Target> target = keyPerformanceIndicator.getKpiSubCategory().getTarget();
            for (Target t : target) {
                if (t.getYear().equals(year.toString())) {
                    s.setTargetThisYear(t.getTargetAmount());
                }
                Integer tmp = year - 1;
                if (t.getYear().equals(tmp.toString())) {
                    s.setTargetThisYearMinus1(t.getTargetAmount());
                }
                tmp--;
                if (t.getYear().equals(tmp.toString())) {
                    s.setTargetThisYearMinus2(t.getTargetAmount());
                }
            }
        }
        return s;
    }


}
