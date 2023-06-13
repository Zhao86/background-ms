<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/6/12
  Time: 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/utils/tools.jsp" %>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
  <title>后台管理系统首页</title>
  <link rel="icon" href="favicon.ico" type="image/ico">
  <meta name="keywords" content="LightYear,光年,后台模板,后台管理系统,光年HTML模板">
  <meta name="description" content="LightYear是一个基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
  <meta name="author" content="yinqi">
  <link rel="stylesheet" href="https://www.jq22.com/jquery/bootstrap-3.3.4.css">
  <link href="${ctx}/static/bootstrap/css/materialdesignicons.min.css" rel="stylesheet">
  <link href="${ctx}/static/bootstrap/css/style.min.css" rel="stylesheet">
</head>

<body>
<div class="lyear-layout-web">
  <div class="lyear-layout-container">
    <!--左侧导航-->
    <aside class="lyear-layout-sidebar">

      <!-- logo -->
      <div id="logo" class="sidebar-header">
        <a href="index.html"><img src="${ctx}/static/bootstrap/images/logo-sidebar.png" title="LightYear"
                                  alt="LightYear"/></a>
      </div>
      <div class="lyear-layout-sidebar-scroll">

        <nav class="sidebar-main">
          <ul class="nav nav-drawer">

            <c:forEach var="menu" items="${menuList}">

              <li
                      <c:if test="${not empty menu.list}">
                        class="nav-item nav-item-has-subnav"
                      </c:if>
              ><a href="#!"><i class="${menu.icon}"></i>${menu.title}</a>
                <ul class=" nav nav-subnav">
                  <c:if test="${not empty menu.list}">
                    <c:forEach var="menuItem" items="${menu.list}">
                      <li><a href="#!">${menuItem.title}</a></li>
                    </c:forEach>
                  </c:if>
                </ul>
              </li>
            </c:forEach>


            <%--                        <c:forEach var="i" begin="1" end="5">--%>
            <%--                            <li class="nav-item nav-item-has-subnav--%>

            <%--                                <c:if test="${i==1}">--%>
            <%--                                         open--%>
            <%--                                </c:if>--%>
            <%--                                ">--%>
            <%--                                <a href="javascript:void(0)"><i class="mdi mdi-menu"></i> 多级菜单</a>--%>
            <%--                                <ul class="nav nav-subnav">--%>
            <%--                                    <li class="nav-item nav-item-has-subnav">--%>
            <%--                                        <a href="#!">一级菜单</a>--%>
            <%--                                        <ul class="nav nav-subnav">--%>
            <%--                                            <li> <a href="#!">二级菜单</a> </li>--%>
            <%--                                            <li class="nav-item nav-item-has-subnav">--%>
            <%--                                                <a href="#!">二级菜单</a>--%>
            <%--                                                <ul class="nav nav-subnav">--%>
            <%--                                                    <li> <a href="#!">三级菜单</a> </li>--%>
            <%--                                                    <li> <a href="#!">三级菜单</a> </li>--%>
            <%--                                                </ul>--%>
            <%--                                            </li>--%>
            <%--                                        </ul>--%>

            <%--                                    </li>--%>
            <%--                                    <li class="nav-item nav-item-has-subnav">--%>
            <%--                                        <a href="#!">一级菜单</a>--%>
            <%--                                        <ul class="nav nav-subnav">--%>
            <%--                                            <li> <a href="#!">二级菜单</a> </li>--%>
            <%--                                            <li class="nav-item nav-item-has-subnav">--%>
            <%--                                                <a href="#!">二级菜单</a>--%>
            <%--                                                <ul class="nav nav-subnav">--%>
            <%--                                                    <li> <a href="#!">三级菜单</a> </li>--%>
            <%--                                                    <li> <a href="#!">三级菜单</a> </li>--%>
            <%--                                                </ul>--%>
            <%--                                            </li>--%>
            <%--                                        </ul>--%>
            <%--                                    </li>--%>
            <%--                                    <li> <a href="#!">一级菜单</a> </li>--%>
            <%--                                </ul>--%>
            <%--                            </li>--%>
            <%--                        </c:forEach>--%>

            <li>111</li>

          </ul>
        </nav>

        <div class="sidebar-footer">
          <p class="copyright">Copyright &copy; 2019. All rights reserved. More Templates </p>
        </div>
      </div>

    </aside>
    <!--End 左侧导航-->

    <!--头部信息-->
    <header class="lyear-layout-header">

      <nav class="navbar navbar-default">
        <div class="topbar">

          <div class="topbar-left">
            <div class="lyear-aside-toggler">
              <span class="lyear-toggler-bar"></span>
              <span class="lyear-toggler-bar"></span>
              <span class="lyear-toggler-bar"></span>
            </div>
            <span class="navbar-page-title"> 后台首页 </span>
          </div>

          <ul class="topbar-right">
            <li class="dropdown dropdown-profile">
              <a href="javascript:void(0)" data-toggle="dropdown">
                <img class="img-avatar img-avatar-48 m-r-10"
                     src="${ctx}/static/bootstrap/images/users/avatar.jpg" alt="后台系统"/>
                <span>后台系统 <span class="caret"></span></span>
              </a>
              <ul class="dropdown-menu dropdown-menu-right">
                <li><a href="lyear_pages_profile.html"><i class="mdi mdi-account"></i> 个人信息</a></li>
                <li><a href="lyear_pages_edit_pwd.html"><i class="mdi mdi-lock-outline"></i>
                  修改密码</a></li>
                <li><a href="javascript:void(0)"><i class="mdi mdi-delete"></i> 清空缓存</a></li>
                <li class="divider"></li>
                <li><a href="lyear_pages_login.html"><i class="mdi mdi-logout-variant"></i> 退出登录</a>
                </li>
              </ul>
            </li>
            <!--切换主题配色-->
            <li class="dropdown dropdown-skin">
              <span data-toggle="dropdown" class="icon-palette"><i class="mdi mdi-palette"></i></span>
              <ul class="dropdown-menu dropdown-menu-right" data-stopPropagation="true">
                <li class="drop-title"><p>主题</p></li>
                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="site_theme" value="default" id="site_theme_1" checked>
                    <label for="site_theme_1"></label>
                  </span>
                  <span>
                    <input type="radio" name="site_theme" value="dark" id="site_theme_2">
                    <label for="site_theme_2"></label>
                  </span>
                  <span>
                    <input type="radio" name="site_theme" value="translucent" id="site_theme_3">
                    <label for="site_theme_3"></label>
                  </span>
                </li>
                <li class="drop-title"><p>LOGO</p></li>
                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="logo_bg" value="default" id="logo_bg_1" checked>
                    <label for="logo_bg_1"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_2" id="logo_bg_2">
                    <label for="logo_bg_2"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_3" id="logo_bg_3">
                    <label for="logo_bg_3"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_4" id="logo_bg_4">
                    <label for="logo_bg_4"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_5" id="logo_bg_5">
                    <label for="logo_bg_5"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_6" id="logo_bg_6">
                    <label for="logo_bg_6"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_7" id="logo_bg_7">
                    <label for="logo_bg_7"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_8" id="logo_bg_8">
                    <label for="logo_bg_8"></label>
                  </span>
                </li>
                <li class="drop-title"><p>头部</p></li>
                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="header_bg" value="default" id="header_bg_1" checked>
                    <label for="header_bg_1"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_2" id="header_bg_2">
                    <label for="header_bg_2"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_3" id="header_bg_3">
                    <label for="header_bg_3"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_4" id="header_bg_4">
                    <label for="header_bg_4"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_5" id="header_bg_5">
                    <label for="header_bg_5"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_6" id="header_bg_6">
                    <label for="header_bg_6"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_7" id="header_bg_7">
                    <label for="header_bg_7"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_8" id="header_bg_8">
                    <label for="header_bg_8"></label>
                  </span>
                </li>
                <li class="drop-title"><p>侧边栏</p></li>
                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="sidebar_bg" value="default" id="sidebar_bg_1" checked>
                    <label for="sidebar_bg_1"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_2" id="sidebar_bg_2">
                    <label for="sidebar_bg_2"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_3" id="sidebar_bg_3">
                    <label for="sidebar_bg_3"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_4" id="sidebar_bg_4">
                    <label for="sidebar_bg_4"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_5" id="sidebar_bg_5">
                    <label for="sidebar_bg_5"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_6" id="sidebar_bg_6">
                    <label for="sidebar_bg_6"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_7" id="sidebar_bg_7">
                    <label for="sidebar_bg_7"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_8" id="sidebar_bg_8">
                    <label for="sidebar_bg_8"></label>
                  </span>
                </li>
              </ul>
            </li>
            <!--切换主题配色-->
          </ul>

        </div>
      </nav>

    </header>
    <!--End 头部信息-->

    <!--页面主要内容-->
    <main class="lyear-layout-content">

      <div class="container-fluid">

        <div class="row">
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-primary">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">今日收入</p>
                  <p class="h3 text-white m-b-0">102,125.00</p>
                </div>
                <div class="pull-left"><span class="img-avatar img-avatar-48 bg-translucent"><i
                        class="mdi mdi-currency-cny fa-1-5x"></i></span></div>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-lg-3">
            <div class="card bg-danger">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">用户总数</p>
                  <p class="h3 text-white m-b-0">920,000</p>
                </div>
                <div class="pull-left"><span class="img-avatar img-avatar-48 bg-translucent"><i
                        class="mdi mdi-account fa-1-5x"></i></span></div>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-lg-3">
            <div class="card bg-success">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">下载总量</p>
                  <p class="h3 text-white m-b-0">34,005,000</p>
                </div>
                <div class="pull-left"><span class="img-avatar img-avatar-48 bg-translucent"><i
                        class="mdi mdi-arrow-down-bold fa-1-5x"></i></span></div>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-lg-3">
            <div class="card bg-purple">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">新增留言</p>
                  <p class="h3 text-white m-b-0">153 条</p>
                </div>
                <div class="pull-left"><span class="img-avatar img-avatar-48 bg-translucent"><i
                        class="mdi mdi-comment-outline fa-1-5x"></i></span></div>
              </div>
            </div>
          </div>
        </div>

        <div class="row">

          <div class="col-lg-6">
            <div class="card">
              <div class="card-header">
                <h4>每周用户</h4>
              </div>
              <div class="card-body">
                <canvas class="js-chartjs-bars"></canvas>
              </div>
            </div>
          </div>

          <div class="col-lg-6">
            <div class="card">
              <div class="card-header">
                <h4>交易历史记录</h4>
              </div>
              <div class="card-body">
                <canvas class="js-chartjs-lines"></canvas>
              </div>
            </div>
          </div>

        </div>

        <h5>基本实例</h5>
        <table class="table">
          <thead>
          <tr>
            <th>#</th>
            <th>书籍名称</th>
            <th>作者</th>
            <th>分类</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <th scope="row">1</th>
            <td>庄子</td>
            <td>庄子</td>
            <td>古文典籍</td>
          </tr>
          <tr>
            <th scope="row">2</th>
            <td>道德经</td>
            <td>老子</td>
            <td>古文典籍</td>
          </tr>
          <tr>
            <th scope="row">3</th>
            <td>能面杀人事件</td>
            <td>高木彬光</td>
            <td>悬疑小说</td>
          </tr>
          </tbody>
        </table>

      </div>

    </main>
    <!--End 页面主要内容-->
  </div>
</div>

<script src="https://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="https://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
<script type="text/javascript" src="${ctx}/static/bootstrap/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${ctx}/static/bootstrap/js/main.min.js"></script>

<!--图表插件-->
<script type="text/javascript" src="https://s3.pstatp.com/cdn/expire-1-M/Chart.js/2.7.0/Chart.min.js"></script>
<script type="text/javascript">
  $(document).ready(function (e) {
    var $dashChartBarsCnt = jQuery('.js-chartjs-bars')[0].getContext('2d'),
            $dashChartLinesCnt = jQuery('.js-chartjs-lines')[0].getContext('2d');

    var $dashChartBarsData = {
      labels: ['周一', '周二', '周三', '周四', '周五', '周六', '周日'],
      datasets: [
        {
          label: '注册用户',
          borderWidth: 1,
          borderColor: 'rgba(0,0,0,0)',
          backgroundColor: 'rgba(51,202,185,0.5)',
          hoverBackgroundColor: "rgba(51,202,185,0.7)",
          hoverBorderColor: "rgba(0,0,0,0)",
          data: [2500, 1500, 1200, 3200, 4800, 3500, 1500]
        }
      ]
    };
    var $dashChartLinesData = {
      labels: ['2003', '2004', '2005', '2006', '2007', '2008', '2009', '2010', '2011', '2012', '2013', '2014'],
      datasets: [
        {
          label: '交易资金',
          data: [20, 25, 40, 30, 45, 40, 55, 40, 48, 40, 42, 50],
          borderColor: '#358ed7',
          backgroundColor: 'rgba(53, 142, 215, 0.175)',
          borderWidth: 1,
          fill: false,
          lineTension: 0.5
        }
      ]
    };

    new Chart($dashChartBarsCnt, {
      type: 'bar',
      data: $dashChartBarsData
    });

    var myLineChart = new Chart($dashChartLinesCnt, {
      type: 'line',
      data: $dashChartLinesData,
    });
  });
</script>
</body>
</html>
