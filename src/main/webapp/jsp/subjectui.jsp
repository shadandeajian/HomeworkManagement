<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    application.setAttribute("basePath", basePath);
%>
<div class="table-responsive">
    <table class="table table-hover">
        <tr>
            <td>课程名称</td>
            <td>名称名称</td>
            <td>当前状态</td>
            <td>管理教师</td>
            <td>上次操作时间</td>
            <td>截止时间</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${allOrderInfo }" var="allorderinfo">
            <tr  <c:if test="${!allorderinfo.ostate}">class='danger'</c:if> id="${allorderinfo.oid }">
                <td><p>${allorderinfo.osubject }</p></td>

<%--                check if this is a link, if so just use the right link--%>
                <td><p class="linkcheck">${allorderinfo.oname }</p></td>

                <td><p>${allorderinfo.ostate?"已启用":"已禁用" }</p></td>
                <td><p></p></td>
                <td><p><fmt:formatDate value="${allorderinfo.otime }" pattern="yyyy年MM月dd日 HH:mm:ss"/></p></td>
                <td><p><fmt:formatDate value="${allorderinfo.odeadline }" pattern="yyyy年MM月dd日 HH:mm:ss"/></p></td>
                <td>
                    <button type="button" class="btn btn-info btn-primary"
                            onclick="changeState(${allorderinfo.oid },${allorderinfo.ostate})">${allorderinfo.ostate?"禁用":"启用" }</button>


                    <c:url value="${basePath }jsp/editsubjectui.jsp" var="encodedUrl">
                        <c:param name="oid" value="${allorderinfo.oid}" />
                        <c:param name="osubject" value="${allorderinfo.osubject}"/>
                        <c:param name="oname" value="${allorderinfo.oname}"/>
                        <c:param name="odeadline" value="${allorderinfo.odeadline.time}"/>
                    </c:url>
                    <button type="button" id="upfilebutton_id" class="btn btn-info btn-warning runEditButtonClick"
                            data-toggle="modal"
                            data-target=".bs-modal-lg"
<%--                            data-remote="${basePath }jsp/editsubjectui.jsp?oid=${allorderinfo.oid}&osubject=${allorderinfo.osubject}&oname=${allorderinfo.oname}&odeadline=${allorderinfo.odeadline.time}"--%>
                            data-remote="${encodedUrl}"
                    >编辑 </button>

                    <button type="button" class="btn btn-info btn-danger" onclick="del(${allorderinfo.oid })">删除
                    </button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<script>
    // https://stackoverflow.com/a/21351871/921082
    $('.runEditButtonClick').on('click', function(ev){
        ev.preventDefault();
        console.log('upfilebutton run.');
        //https://github.com/twbs/bootstrap/pull/7935#issuecomment-21166069
        $('.bs-modal-lg').removeData('bs.modal');
    });



    $('.linkcheck').each(function () {
        var hstr = $(this).html();
        var rstr = checkSetURLGivenStr(hstr);
        if (rstr != null){
          $(this).html(rstr);
        }
    });

</script>
