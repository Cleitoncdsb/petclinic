<!DOCTYPE html> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>

<html lang="en">

<jsp:include page="../fragments/headTag.jsp"/>

<body>
<div class="container">
    <jsp:include page="../fragments/bodyHeader.jsp"/>

    <h2>Informações dos Proprietários</h2>

    <table class="table table-striped" style="width:600px;">
        <tr>
            <th>Nome</th>
            <td><b><c:out value="${owner.firstName} ${owner.lastName}"/></b></td>
        </tr>
        <tr>
            <th>Endereço</th>
            <td><c:out value="${owner.address}"/></td>
        </tr>
        <tr>
            <th>Cidade</th>
            <td><c:out value="${owner.city}"/></td>
        </tr>
        <tr>
            <th>Telefone</th>
            <td><c:out value="${owner.telephone}"/></td>
        </tr>
         <tr>
            <td> 
            	<spring:url value="{ownerId}/edit.html" var="editUrl">
                    <spring:param name="ownerId" value="${owner.id}"/>
                </spring:url>
                <a href="${fn:escapeXml(editUrl)}" class="btn btn-info">Editar Proprietários</a></td>
            <td>
            	<spring:url value="{ownerId}/pets/new.html" var="addUrl">
                    <spring:param name="ownerId" value="${owner.id}"/>
                </spring:url>
                <a href="${fn:escapeXml(addUrl)}"  class="btn btn-success">Adicionar novo animal de estimação</a></td>
        </tr>
    </table>

    <h2>Animais de estimação e Proprietários</h2>

    <c:forEach var="pet" items="${owner.pets}">
        <table class="table" style="width:600px;">
            <tr>
                <td valign="top" style="width: 120px;">
                    <dl class="dl-horizontal">
                        <dt>Nome</dt>
                        <dd><c:out value="${pet.name}"/></dd>
                        <dt>Aniversário</dt>
                        <dd><joda:format value="${pet.birthDate}" pattern="yyyy-MM-dd"/></dd>
                        <dt>Tipo</dt>
                        <dd><c:out value="${pet.type.name}"/></dd>
                    </dl>
                </td>
                <td valign="top">
                    <table class="table-condensed">
                        <thead>
                        <tr>
                            <th>Data de Visita</th>
                            <th>Descrição</th>
                        </tr>
                        </thead>
                        <c:forEach var="visit" items="${pet.visits}">
                            <tr>
                                <td><joda:format value="${visit.date}" pattern="yyyy-MM-dd"/></td>
                                <td><c:out value="${visit.description}"/></td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td> 
                            	<spring:url value="/owners/{ownerId}/pets/{petId}/edit" var="petUrl">
			                        <spring:param name="ownerId" value="${owner.id}"/>
			                        <spring:param name="petId" value="${pet.id}"/>
			                    </spring:url>
			                    <a href="${fn:escapeXml(petUrl)}">Editar Animal de estimação</a>
			                </td>
                            <td>
			                    <spring:url value="/owners/{ownerId}/pets/{petId}/visits/new" var="visitUrl">
			                        <spring:param name="ownerId" value="${owner.id}"/>
			                        <spring:param name="petId" value="${pet.id}"/>
			                    </spring:url>
			                    <a href="${fn:escapeXml(visitUrl)}">Adicionar Visitante</a>
                            </td>
                       	</tr>
                    </table>
                </td>
            </tr>
        </table>
    </c:forEach>

    <jsp:include page="../fragments/footer.jsp"/>

</div>

</body>

</html>
