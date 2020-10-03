<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>jqGrid - Ace Admin</title>

    <meta name="description" content="Dynamic tables and grids using jqGrid plugin"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="/font-awesome/4.5.0/css/font-awesome.min.css"/>

    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="/css/jquery/jquery-ui.min.css"/>
    <link rel="stylesheet" href="/css/bootstrap/bootstrap-datepicker3.min.css"/>
    <link rel="stylesheet" href="/css/ui/ui.jqgrid.min.css"/>

    <!-- text fonts -->
    <link rel="stylesheet" href="/css/ui/fonts.googleapis.com.css"/>

    <!-- ace styles -->
    <link rel="stylesheet" href="/css/ace/ace.min.css" class="ace-main-stylesheet" id="main-ace-style"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="/css/ace/ace-part2.min.css"
          class="ace-main-stylesheet"/>
    <![endif]-->
    <link rel="stylesheet" href="/css/ace/ace-skins.min.css"/>
    <link rel="stylesheet" href="/css/ace/ace-rtl.min.css"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="/css/ace/ace-ie.min.css"/>
    <![endif]-->

    <!-- ace settings handler -->
    <script src="/js/ace/ace-extra.min.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
    <script src="/js/ui/html5shiv.min.js"></script>
    <script src="/js/ui/respond.min.js"></script>
    <![endif]-->


</head>

<body class="no-skin">

<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.loadState('main-container')
        } catch (e) {
        }
    </script>

    <div id="sidebar" class="sidebar                  responsive                    ace-save-state">
        <script type="text/javascript">
            try {
                ace.settings.loadState('sidebar')
            } catch (e) {
            }
        </script>

        <div class="sidebar-shortcuts" id="sidebar-shortcuts">
            <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                超市管理系统（SMS）
            </div>

            <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                超市管理系统（SMS）
            </div>
        </div><!-- /.sidebar-shortcuts -->

        <ul class="nav nav-list">

            <li class="active open">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-list"></i>
                    <span class="menu-text"> 数据操作 </span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="active">
                        <a href="">
                            <i class="menu-icon fa fa-caret-right"></i>
                            商品详情
                        </a>

                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>
        </ul><!-- /.nav-list -->

        <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
            <i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state"
               data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
        </div>
    </div>

    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">超市管理系统（SMS）</a>
                    </li>

                    <li>
                        <a href="#">数据操作</a>
                    </li>
                    <li class="active">商品详情</li>
                </ul><!-- /.breadcrumb -->
            </div>

            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <form class="form-inline col-md-8" style="margin: 10px" action="${pageContext.request.contextPath}/FindByPageServlet?goTo=culturePage.jsp&type=Culture" method="post">
                            <div class="form-group col-md-5">
                                <label for="id">编号</label>
                                <input type="text" class="form-control" id="id" placeholder="编号" name="id" value="${condition.id[0]}">
                            </div>
                            <div class="form-group col-md-5">
                                <label for="name">风景名</label>
                                <input type="text" class="form-control" id="name" placeholder="文化名" name="name" value="${condition.name[0]}">
                            </div>
                            <button type="submit" class="btn btn-default">查询</button>
                        </form>

                        <a class="btn btn-primary col-md-1 pull-right" style="margin-right: 5px" href="${pageContext.request.contextPath}/back/cultureForm.jsp">添加</a>
                        <a class="btn btn-primary col-md-1 pull-right" id="delSelected">删除选中</a>

                        <form id="form" action="${pageContext.request.contextPath}/DelSelectedServlet?type=Culture" method="post">
                            <table class="table table-hover col-xs-12 " id="grid-table"
                                   style="text-align: center;font-size: 15px; table-layout: fixed;">
                                <tr class="info">
                                    <td width="5%"><input type="checkbox" id="firstCb"></td>
                                    <td width="10%">操作</td>
                                    <td width="5%">编号</td>
                                    <td width="10%">文化名称</td>
                                    <td width="50%">介绍</td>
                                    <td width="20%">时间</td>
                                </tr>
                                <c:forEach items="${pageBean.list}" var="view">
                                    <tr>
                                        <td><input type="checkbox" name="uid" value="${view.id}"></td>
                                        <td>
                                            <a class="ace-icon fa fa-pencil  light-blue bigger-110" title="修改" href="${pageContext.request.contextPath}/FindOnlyServlet?id=${view.id}&type=Culture"></a>
                                            <a class="ace-icon fa fa-trash  light-blue bigger-110" title="删除" href="javascript:deleteOnly(${view.id});"></a>
                                        </td>
                                        <td>${view.id}</td>
                                        <td>${view.name}</td>
                                        <td style="overflow: hidden;text-overflow: ellipsis;
                                            white-space: nowrap;">${view.introduce}</td>
                                        <td style="overflow: hidden;text-overflow: ellipsis;
                                            white-space: nowrap;">${view.time}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </form>
                        <div class="col-md-5"></div>
                        <nav class="col-md-5" aria-label="Page navigation">
                            <ul class="pagination">
                                <c:if test="${pageBean.currentPage == 1}">
                                    <li class="disabled">
                                        <a href="#"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:if test="${pageBean.currentPage != 1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/FindByPageServlet?currentPage=${pageBean.currentPage-1}&rows=5&goTo=culturePage.jsp&type=Culture&id=${condition.id[0]}&name=${condition.name[0]}"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
                                    <c:if test="${pageBean.currentPage==i}">
                                        <li class="active"><a href="${pageContext.request.contextPath}/FindByPageServlet?currentPage=${i}&rows=5&goTo=culturePage.jsp&type=Culture&id=${condition.id[0]}&name=${condition.name[0]}">${i}</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${pageBean.currentPage!=i}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/FindByPageServlet?currentPage=${i}&rows=5&goTo=culturePage.jsp&type=Culture&id=${condition.id[0]}&name=${condition.name[0]}">${i}</a>
                                        </li>
                                    </c:if>
                                </c:forEach>


                                <c:if test="${pageBean.currentPage == pageBean.totalPage}">
                                    <li class="disabled">
                                        <a href="#"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:if test="${pageBean.currentPage != pageBean.totalPage}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/FindByPageServlet?currentPage=${pageBean.currentPage+1}&rows=5&goTo=culturePage.jsp&type=Culture&id=${condition.id[0]}&name=${condition.name[0]}"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <span style="font-size: 20px; margin-left: 5px">
                                    共有${pageBean.totalCount}条记录,分为${pageBean.totalPage}页.
                                </span>
                            </ul>
                        </nav>

                        <!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->

    <div class="footer">
        <div class="footer-inner">
            <div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">超市管理系统（SMS）</span>
                            Copyright &copy; 2020 &mdash; CJLU
						</span>

                &nbsp; &nbsp;
                <span class="action-buttons">
							<a href="#">
								<i class="ace-icon fa fa-qq light-blue bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-weibo text-primary bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-weixin orange bigger-150"></i>
							</a>
						</span>
            </div>
        </div>
    </div>

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

<script src="/js/detail.js"></script>
<!-- basic scripts -->

<!--[if !IE]> -->
<script src="/js/jquery/jquery-2.1.4.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="/js/jquery/jquery-1.11.3.min.js"></script>
<![endif]-->
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='/js/jquery/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="/js/bootstrap/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->
<script src="/js/bootstrap/bootstrap-datepicker.min.js"></script>
<script src="/js/jquery/jquery.jqGrid.min.js"></script>
<script src="/js/ui/grid.locale-en.js"></script>

<!-- ace scripts -->
<script src="/js/ace/ace-elements.min.js"></script>
<script src="/js/ace/ace.min.js"></script>
</body>
</html>
