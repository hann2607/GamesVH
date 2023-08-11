package com.gamevh.response;

import lombok.Data;

import java.util.List;

@Data
public class DataChartResponse {
    private List<RecordDataChart> products;
    private List<RecordDataChart> payments;
}
