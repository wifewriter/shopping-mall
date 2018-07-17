package com.qf1801.group4.shop.common;

import java.io.Serializable;
import java.util.List;

public class EasyUIPageInfo<T> implements Serializable {

    private static final long serialVersionUID = -2597639198614826426L;

    private long total;
    private List<T> rows;

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

}
