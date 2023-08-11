package com.gamevh.service;

import com.gamevh.dto.mapping.IRecordCountTotal;
import com.gamevh.dto.mapping.IRecordDataChart;
import com.gamevh.repository.CategoryRepository;
import com.gamevh.response.DataChartResponse;
import com.gamevh.response.RecordCountTotal;
import com.gamevh.response.RecordDataChart;
import jakarta.annotation.Resource;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CommonService {
    @Resource
    private CategoryRepository categoryRepository;

    public RecordCountTotal getAllTotalRecord() {
        RecordCountTotal response = new RecordCountTotal();
        IRecordCountTotal record = categoryRepository.findRecordCountTotal();
        BeanUtils.copyProperties(record,response);
        return response;
    }

    public DataChartResponse getAllDataChart() {
        DataChartResponse response = new DataChartResponse();
        List<RecordDataChart> products = new ArrayList<>();
        List<RecordDataChart> payments = new ArrayList<>();
        List<IRecordDataChart> record = categoryRepository.findRecordDataChart();
        record.forEach(s->{
            RecordDataChart bean = new RecordDataChart();
            BeanUtils.copyProperties(s,bean);
            if("product".equals(s.getType())){
                products.add(bean);
            }else{
                payments.add(bean);
            }
        });
        response.setPayments(payments);
        response.setProducts(products);
        return response;
    }
}
