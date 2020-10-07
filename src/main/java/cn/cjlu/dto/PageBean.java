package cn.cjlu.dto;

import java.util.List;

/**
 * @create: 2020-10-05 15:01
 */
public class PageBean<T> {
    private List<T> beanList;//当前页显示的数据，数据查询
    private int pageSize;//页大小,业务规则
    private int pageIndex;//当前页索引，用户请求
    private int totalRecord;//数据总条数，数据查询
    private int totalPage;//总页数
    private int pageBegin;//显示的开始页码
    private int pageEnd;//显示的结束页码
    private String url; //在哪赋值：Servlet

    public PageBean() {
        super();
    }

    public List<T> getBeanList() {
        return beanList;
    }

    public void setBeanList(List<T> beanList) {
        this.beanList = beanList;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getPageBegin() {
        return pageBegin;
    }

    public void setPageBegin(int pageBegin) {
        this.pageBegin = pageBegin;
    }

    public int getPageEnd() {
        return pageEnd;
    }

    public void setPageEnd(int pageEnd) {
        this.pageEnd = pageEnd;
    }

    //计算开始页和结束页
    public void setPageBeginAndPageEnd() {
        //总页数小于10
        if (getTotalPage() < 10) {
            pageBegin = 1;
            pageEnd = getTotalPage();
        } else {
            pageBegin = pageIndex - 5;
            pageEnd = pageIndex + 4;
            //上标越界
            if (pageBegin < 1) {
                pageBegin = 1;
                pageEnd = 10;
            }
            //下标越界
            if (pageEnd > getTotalPage()) {
                pageBegin = getTotalPage() - 9;
                pageEnd = getTotalPage();
            }
        }
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "PageBean [beanList=" + beanList + ", pageSize=" + pageSize + ", pageIndex=" + pageIndex
                + ", totalRecord=" + totalRecord + ", totalPage=" + getTotalPage() + ", pageBegin=" + pageBegin
                + ", pageEnd=" + pageEnd + "]";
    }
}
