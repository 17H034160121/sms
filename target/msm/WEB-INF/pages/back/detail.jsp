<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>SMS商品详情管理</title>

    <meta name="description" content="Dynamic tables and grids using jqGrid plugin"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <!-- bootstrap & fontawesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/font-awesome.min.css"/>

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
                        <form id="commoditySearchForm" class="form-inline col-md-10" style="margin: 10px" action="/commodity/search" method="post">
                            <div class="form-group col-md-3">
                                <label for="name">商品名</label>
                                <input type="text" class="form-control" id="name" placeholder="编号" name="name" value="">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="qrCode">二维编码</label>
                                <input type="text" class="form-control" id="qrCode" placeholder="二维编码" name="qrCode" value="">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="description">描述</label>
                                <input type="text" class="form-control" id="description" placeholder="描述" name="description" value="">
                            </div>
                            <button type="submit" class="btn btn-default pull-right">查询</button>
                        </form>

                        <a class="btn btn-primary col-md-1 pull-right" id="addButton" onclick="addModal()" >添加</a>
                        <a class="btn btn-primary col-md-1 pull-right" id="delSelected">删除选中</a>

                        <form id="selectForm" action="/commodity/delete" method="post">
                            <table class="table table-hover col-xs-12 " id="grid-table"
                                   style="text-align: center;font-size: 15px; table-layout: fixed;">
                                <tr class="info">
                                    <td width="5%"><input type="checkbox" id="firstCb"></td>
                                    <td width="5%">编号</td>
                                    <td width="10%">商品名</td>
                                    <td width="10%">二维编码</td>
                                    <td width="40%">描述</td>
                                    <td width="10%">价格</td>
                                    <td width="10%">数量</td>
                                    <td width="10%">操作</td>
                                </tr>
                                <c:forEach items="${page.beanList}" var="commodity">
                                    <tr>
                                        <td><input type="checkbox" name="uid" value="${commodity.id}"></td>
                                        <td>${commodity.id}</td>
                                        <td>${commodity.name}</td>
                                        <td style="overflow: hidden;text-overflow: ellipsis;
                                            white-space: nowrap;">${commodity.qrCode}</td>
                                        <td style="overflow: hidden;text-overflow: ellipsis;
                                            white-space: nowrap;">${commodity.description}</td>
                                        <td style="overflow: hidden;text-overflow: ellipsis;
                                            white-space: nowrap;">${commodity.price}</td>
                                        <td>${commodity.num}</td>
                                        <td>
                                            <a class="ace-icon fa fa-pencil  light-blue bigger-110" title="修改" id="updateButton" onclick="editOnly(${commodity.id})"></a>
                                            <a class="ace-icon fa fa-trash  light-blue bigger-110" title="删除" id="deleteButton" onclick="deleteOnly(${commodity.id})"></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </form>
                        <div class="col-md-5"></div>
                        <nav class="col-md-5" aria-label="Page navigation">
                            <ul class="pagination">
                                <c:if test="${page.pageIndex == 1}">
                                    <li class="disabled">
                                        <a href="#"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:if test="${page.pageIndex != 1}">
                                    <li>
                                        <a onclick="movePrevious(${page.pageIndex})"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:forEach begin="1" end="${page.totalPage}" var="i">
                                    <c:if test="${page.pageIndex==i}">
                                        <li class="active"><a id="target">${i}</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${page.pageIndex!=i}">
                                        <li>
                                            <a onclick="moveTarget(${i})">${i}</a>
                                        </li>
                                    </c:if>
                                </c:forEach>


                                <c:if test="${page.pageIndex == page.totalPage}">
                                    <li class="disabled">
                                        <a href="#"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:if test="${page.pageIndex != page.totalPage}">
                                    <li>
                                        <a onclick="moveAfter(${page.pageIndex})"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <span style="font-size: 20px; margin-left: 5px">
                                    共有${page.totalPage}页.
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
            </div>
        </div>
    </div>

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
    <!-- 提示框 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title pull-left" id="myModalLabel">提示</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body" id="message"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">确认</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <div class="modal fade" id="commodityModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">商品详情</h4>
                </div>
                <form action="" method="post" id="commodityForm">
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="control-label" for="id1">编号</label>
                            <input type="text" class="form-control" name="id" value="" id="id1" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="name1">商品名</label>
                            <input type="text" class="form-control" name="name" value="" id="name1">
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="qrCode1">二维编码</label>
                            <input type="text" class="form-control" name="qrCode" value="" id="qrCode1">
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="num">数量</label>
                            <input type="text" class="form-control" name="num" value="" id="num">
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="description1">描述</label>
                            <input type="text" class="form-control" name="description" value="" id="description1">
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="price">价格</label>
                            <input type="text" class="form-control" name="price" value="" id="price">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">确认</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div><!-- /.main-container -->


<!--[if !IE]> -->
<script src="/js/jquery/jquery-2.1.4.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="/js/jquery/jquery-1.11.3.min.js"></script>
<![endif]-->
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='/js/jquery/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->
<script src="/js/bootstrap/bootstrap-datepicker.min.js"></script>
<script src="/js/jquery/jquery.jqGrid.min.js"></script>
<script src="/js/ui/grid.locale-en.js"></script>

<!-- ace scripts -->
<script src="/js/ace/ace-elements.min.js"></script>
<script src="/js/ace/ace.min.js"></script>
<script src="/js/detail.js"></script>

</body>
</html>
