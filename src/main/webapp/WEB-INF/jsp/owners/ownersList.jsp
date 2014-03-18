<!DOCTYPE html> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables" %>

<html lang="en">

<jsp:include page="../fragments/headTag.jsp"/>

<body>
<div class="container">
    <jsp:include page="../fragments/bodyHeader.jsp"/>
    <h2>Proprietários</h2>
    
    <datatables:table id="owners" data="${selections}" cdn="true" row="owner" theme="bootstrap2" 
                      cssClass="table table-striped" paginate="false" info="false" export="pdf">
        <datatables:column title="Name" cssStyle="width: 150px;" display="html">
            <spring:url value="/owners/{ownerId}.html" var="ownerUrl">
                <spring:param name="ownerId" value="${owner.id}"/>
            </spring:url>
            <a href="${fn:escapeXml(ownerUrl)}"><c:out value="${owner.firstName} ${owner.lastName}"/></a>
        </datatables:column>
        <datatables:column title="Nome" display="PDF">
            <c:out value="${owner.firstName} ${owner.lastName}"/>
        </datatables:column>
        <datatables:column title="Endereço" property="address" cssStyle="width: 200px;"/>
        <datatables:column title="Cidade" property="city"/>
        <datatables:column title="Telefone" property="telephone"/>
        <datatables:column title="Animais de Estimação" cssStyle="width: 100px;">
            <c:forEach var="pet" items="${owner.pets}">
                <c:out value="${pet.name}"/>
            </c:forEach>
        </datatables:column>
        <datatables:export type="pdf" cssClass="btn btn-small" />
    </datatables:table>
    
    <jsp:include page="../fragments/footer.jsp"/>

</div>
</body>

</html>
