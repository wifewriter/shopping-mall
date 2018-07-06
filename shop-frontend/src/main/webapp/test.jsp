<%--
  Created by IntelliJ IDEA.
  User: 8poko
  Date: 2018/7/5
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试用</title>
    <%@include file="static/import.jsp" %>
</head>
<body>
<div class="panel-group" role="tablist">
    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="collapseListGroupHeading1">
            <h4 class="panel-title">
                <a href="#collapseListGroup1" class="" role="button" data-toggle="collapse" aria-expanded="true"
                   aria-controls="collapseListGroup1"> Collapsible list group </a>
            </h4>
        </div>
        <div class="panel-collapse collapse" role="tabpanel" id="collapseListGroup1"
             aria-labelledby="collapseListGroupHeading1" aria-expanded="true" style="">
            <ul class="list-group">
                <li class="list-group-item">Bootply</li>
                <li class="list-group-item">One itmus ac facilin</li>
                <li class="list-group-item">Second eros</li>
            </ul>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="collapseListGroupHeading2">
            <h4 class="panel-title">
                <a href="#collapseListGroup1" class="" role="button" data-toggle="collapse" aria-expanded="true"
                   aria-controls="collapseListGroup1"> Collapsible list group </a>
            </h4>
        </div>
        <div class="panel-collapse collapse" role="tabpanel" id="collapseListGroup2"
             aria-labelledby="collapseListGroupHeading1" aria-expanded="true" style="">
            <ul class="list-group">
                <li class="list-group-item">Bootply</li>
                <li class="list-group-item">One itmus ac facilin</li>
                <li class="list-group-item">Second eros</li>
            </ul>
        </div>
    </div>
</div>

<P>!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</P>


<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingOne">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                   aria-expanded="true" aria-controls="collapseOne">
                    Collapsible Group Item #1
                </a>
            </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                <ul class="list-group">
                    <li class="list-group-item">Bootply</li>
                    <li class="list-group-item">One itmus ac facilin</li>
                    <li class="list-group-item">Second eros</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingTwo">
            <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"
                   aria-expanded="false" aria-controls="collapseTwo">
                    Collapsible Group Item #2
                </a>
            </h4>
        </div>
        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
            <div class="panel-body">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
      </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingThree">
            <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree"
                   aria-expanded="false" aria-controls="collapseThree">
                    Collapsible Group Item #3
                </a>
            </h4>
        </div>
        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
            <div class="panel-body">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
      </div>
        </div>
    </div>
</div>


</body>
</html>
