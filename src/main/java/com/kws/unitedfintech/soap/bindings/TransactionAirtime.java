//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.11 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2021.01.27 at 06:26:36 PM IST 
//


package com.kws.unitedfintech.soap.bindings;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for TransactionAirtime complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="TransactionAirtime"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="airtime_fx_rate" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/&gt;
 *         &lt;element name="fee" type="{http://mfs/xsd}Money" minOccurs="0"/&gt;
 *         &lt;element name="mfs_trans_id" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="receive_amount" type="{http://mfs/xsd}Money" minOccurs="0"/&gt;
 *         &lt;element name="reference" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="third_party_trans_id" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "TransactionAirtime", namespace = "http://mfs/xsd", propOrder = {
    "airtimeFxRate",
    "fee",
    "mfsTransId",
    "receiveAmount",
    "reference",
    "thirdPartyTransId"
})
public class TransactionAirtime {

    @XmlElement(name = "airtime_fx_rate")
    protected Double airtimeFxRate;
    @XmlElement(nillable = true)
    protected Money fee;
    @XmlElement(name = "mfs_trans_id", nillable = true)
    protected String mfsTransId;
    @XmlElement(name = "receive_amount", nillable = true)
    protected Money receiveAmount;
    @XmlElement(nillable = true)
    protected String reference;
    @XmlElement(name = "third_party_trans_id", nillable = true)
    protected String thirdPartyTransId;

    /**
     * Gets the value of the airtimeFxRate property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getAirtimeFxRate() {
        return airtimeFxRate;
    }

    /**
     * Sets the value of the airtimeFxRate property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setAirtimeFxRate(Double value) {
        this.airtimeFxRate = value;
    }

    /**
     * Gets the value of the fee property.
     * 
     * @return
     *     possible object is
     *     {@link Money }
     *     
     */
    public Money getFee() {
        return fee;
    }

    /**
     * Sets the value of the fee property.
     * 
     * @param value
     *     allowed object is
     *     {@link Money }
     *     
     */
    public void setFee(Money value) {
        this.fee = value;
    }

    /**
     * Gets the value of the mfsTransId property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getMfsTransId() {
        return mfsTransId;
    }

    /**
     * Sets the value of the mfsTransId property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setMfsTransId(String value) {
        this.mfsTransId = value;
    }

    /**
     * Gets the value of the receiveAmount property.
     * 
     * @return
     *     possible object is
     *     {@link Money }
     *     
     */
    public Money getReceiveAmount() {
        return receiveAmount;
    }

    /**
     * Sets the value of the receiveAmount property.
     * 
     * @param value
     *     allowed object is
     *     {@link Money }
     *     
     */
    public void setReceiveAmount(Money value) {
        this.receiveAmount = value;
    }

    /**
     * Gets the value of the reference property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getReference() {
        return reference;
    }

    /**
     * Sets the value of the reference property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setReference(String value) {
        this.reference = value;
    }

    /**
     * Gets the value of the thirdPartyTransId property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getThirdPartyTransId() {
        return thirdPartyTransId;
    }

    /**
     * Sets the value of the thirdPartyTransId property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setThirdPartyTransId(String value) {
        this.thirdPartyTransId = value;
    }

}
