<%-- 
    Document   : jsptemplate
    Created on : 
    Author     : 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<title>Custom Title</title>
<%@include file="/Style/Header.jsp" %>

<script>
    function showDiv(){
            document.getElementById("roomForm").style.display = 'inline';
            document.getElementById("button").style.display = 'none';
    }
</script>

<main>
    
    <h1> Report Choose Room</h1>
    
    
    Report for Buidling: ${sessionScope.reportBuilding.buildingName} <br>
    With Address: ${sessionScope.reportBuilding.streetAddress}
    
    <br>
    
    Choose an already existing room:
    <form name="floorselect" action="frontpage" method="POST">
     <input type="hidden" name="page" value="inspectRoom" />    
        
    Room 
    <select name="RoomSelected">
        <c:forEach items = "${sessionScope.reportBuilding.listOfFloors}" var = "floor">
            <c:forEach items="${floor.listOfRooms}" var = "Room">
                
        <option value="${Room.roomId}">${floor.floorNumber} - ${Room.roomName}</option>
            </c:forEach>   
        </c:forEach>
    </select>
    <input type="submit" value="Inspect Room" name="RoomButton" />
    </form>
    
    <br>
    
    <div id="button">
    <input type="button" onclick="javascript:showDiv();"  value="Add New Room" name="Room" />
    </div>
    
    <div id="roomForm" style="display: none">
        
        Add a room:
        
        <br>
        <form name="floorselect" action="frontpage" method="POST">
             <input type="hidden" name="page" value="inspectRoomjustCreated" />  
         OnFloor:    
            <select name="Floorselect2">
        <c:forEach items = "${sessionScope.reportBuilding.listOfFloors}" var = "floor">
            <option value="${floor.floorId}">${floor.floorNumber}</option>
        </c:forEach> 
                
            </select>
            Name of new Room: <input type="text" name="RoomName" value="" />
             
        
            <input type="submit" value="Add Room" />
        </form>
        
        
    </div>
    
    <br>
    <br>
    
    <%-- This can just be a link be cant get it to work--%>
    <form name="floorselect" action="frontpage" method="POST">
        <input type="hidden" name="page" value="toFinishReport" />  
        <input type="submit" value="Finish Report" name="Report Finish" />
    </form>
    
    
    
    
</main>


<%@include file="/Style/Footer.jsp" %>
