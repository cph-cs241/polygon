<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<nav class="w3-sidenav w3-light-grey" style="width:120px">
    <a href="#">View exterior</a> 
    <a href="#">View conclusion</a> 
    <c:forEach items="${sessionScope.report.reportFloors}" var="floor" varStatus="count">

        <c:if test="${!empty floor.reportRooms}">
            <div class="w3-accordion">

                <a onclick="myAccFunc(<c:out value="${count.count}"/>)" href="#">Floor: ${floor.floorNumber}</a>

                <div id="room${count.count}" class="w3-accordion-content w3-white w3-card-4">

                    <c:forEach items="${floor.reportRooms}" var="room">
                        <a href="getreport?action=reportroom&viewroom=${room.repRoomId}">${room.roomName}</a>
                    </c:forEach>

                </div>
            </div>
        </c:if>

    </c:forEach>

</nav>
<script>
    function myAccFunc(i) {
        var x = document.getElementById("room" + i);
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
            x.previousElementSibling.className += " w3-green";
        } else {
            x.className = x.className.replace(" w3-show", "");
            x.previousElementSibling.className =
                    x.previousElementSibling.className.replace(" w3-green", "");
        }
    }
</script>
