/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Domain;

import java.util.ArrayList;

/**
 *
 * @author CJS
 */
public class ReportRoom {
    private int repRoomId;
    private String roomName;
    private int reportId;
    private String roomFloor;
    private int buildingRoomId;
    private ReportRoomMoist moist;
    private ArrayList<ReportRoomDamage> listOfDamages = new ArrayList<>();
    private ArrayList<ReportRoomInterior> listOfInt  = new ArrayList<>();;
    private ArrayList<ReportRoomRecommendation> listOfRec  = new ArrayList<>();

    /**
     *
     * @param repRoomId  report room ID
     * @param roomName   report room Name
     * @param reportId   report ID
     */
    public ReportRoom(int repRoomId, String roomName, int reportId) {
        this.repRoomId = repRoomId;
        this.roomName = roomName;
        this.reportId = reportId;
    }

    /**
     * This one is to be used in the setUpForRoomInspection
     * @param roomName
     * @param reportId
     * @param buildingRoomId
     */
    public ReportRoom(String roomName, int reportId, int buildingRoomId) {
        this.roomName = roomName;
        this.reportId = reportId;
        this.buildingRoomId = buildingRoomId;
    }
    
    

    public ReportRoom( String roomName, int roomNumber) {
        this.roomName = roomName;
        this.buildingRoomId = roomNumber;
    }

    public ReportRoom(String roomName) {
        this.roomName = roomName;
    }
    
    public void setRepRoomId(int repRoomId) {
        this.repRoomId = repRoomId;
    }

    
    public int getRepRoomId() {
        return repRoomId;
    }

    public String getRoomName() {
        return roomName;
    }

    public int getReportId() {
        return reportId;
    }

    public ArrayList<ReportRoomDamage> getListOfDamages() {
        return listOfDamages;
    }

    public void setListOfDamages(ArrayList<ReportRoomDamage> listOfDamages) {
        this.listOfDamages = listOfDamages;
    }

    public ArrayList<ReportRoomInterior> getListOfInt() {
        return listOfInt;
    }
    
        public void setListOfInt(ArrayList<ReportRoomInterior> listOfInt) {
        this.listOfInt = listOfInt;
    }

    public ArrayList<ReportRoomRecommendation> getListOfRec() {
        return listOfRec;
    }

    public void setListOfRec(ArrayList<ReportRoomRecommendation> listOfRec) {
        this.listOfRec = listOfRec;
    }

    public int getBuildingRoomId() {
        return buildingRoomId;
    }

    public void setBuildingRoomId(int buildingRoomId) {
        this.buildingRoomId = buildingRoomId;
    }

    /**
     * @return the moist
     */
    public ReportRoomMoist getMoist() {
        return moist;
    }

    /**
     * @param moist the moist to set
     */
    public void setMoist(ReportRoomMoist moist) {
        this.moist = moist;
    }

    public String getRoomFloor() {
        return roomFloor;
    }

    public void setRoomFloor(String roomFloor) {
        this.roomFloor = roomFloor;
    }
}
