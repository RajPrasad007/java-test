package org.apache.struts.loginstruts;

import java.io.Serializable;

public class Packages implements Serializable {
    private String id;
    private String placeName;
    private String noOfAdults;
    private String noOfChildren;
    private String description;
    private String stayAmount;
    private String otherAmount;
    private String noOfDays;
    private String noOfNights;

    public Packages(String id, String placeName, String noOfAdults, String noOfChildren, String description, String stayAmount, String otherAmount, String noOfDays, String noOfNights) {
        this.id = id;
        this.placeName = placeName;
        this.noOfAdults = noOfAdults;
        this.noOfChildren = noOfChildren;
        this.description = description;
        this.stayAmount = stayAmount;
        this.otherAmount = otherAmount;
        this.noOfDays = noOfDays;
        this.noOfNights = noOfNights;
    }

    public String getId() {
        return id;
    }

    public String getPlaceName() {
        return placeName;
    }

    public String getNoOfAdults() {
        return noOfAdults;
    }

    public String getNoOfChildren() {
        return noOfChildren;
    }

    public String getDescription() {
        return description;
    }

    public String getStayAmount() {
        return stayAmount;
    }

    public String getOtherAmount() {
        return otherAmount;
    }

    public String getNoOfDays() {
        return noOfDays;
    }

    public String getNoOfNights() {
        return noOfNights;
    }
}
