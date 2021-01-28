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
 * <p>Java class for TransactionWallet complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="TransactionWallet"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="fx_rate" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/&gt;
 *         &lt;element name="mfs_trans_id" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="name_match" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="partner_code" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="receive_amount" type="{http://mfs/xsd}Money" minOccurs="0"/&gt;
 *         &lt;element name="sanction_list_recipient" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="sanction_list_sender" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="send_amount" type="{http://mfs/xsd}Money" minOccurs="0"/&gt;
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
@XmlType(name = "TransactionWallet", namespace = "http://mfs/xsd", propOrder = {
    "fxRate",
    "mfsTransId",
    "nameMatch",
    "partnerCode",
    "receiveAmount",
    "sanctionListRecipient",
    "sanctionListSender",
    "sendAmount",
    "thirdPartyTransId"
})
public class TransactionWallet {

    @XmlElement(name = "fx_rate")
    protected Double fxRate;
    @XmlElement(name = "mfs_trans_id", nillable = true)
    protected String mfsTransId;
    @XmlElement(name = "name_match", nillable = true)
    protected String nameMatch;
    @XmlElement(name = "partner_code", nillable = true)
    protected String partnerCode;
    @XmlElement(name = "receive_amount", nillable = true)
    protected Money receiveAmount;
    @XmlElement(name = "sanction_list_recipient", nillable = true)
    protected String sanctionListRecipient;
    @XmlElement(name = "sanction_list_sender", nillable = true)
    protected String sanctionListSender;
    @XmlElement(name = "send_amount", nillable = true)
    protected Money sendAmount;
    @XmlElement(name = "third_party_trans_id", nillable = true)
    protected String thirdPartyTransId;

    /**
     * Gets the value of the fxRate property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getFxRate() {
        return fxRate;
    }

    /**
     * Sets the value of the fxRate property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setFxRate(Double value) {
        this.fxRate = value;
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
     * Gets the value of the nameMatch property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNameMatch() {
        return nameMatch;
    }

    /**
     * Sets the value of the nameMatch property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNameMatch(String value) {
        this.nameMatch = value;
    }

    /**
     * Gets the value of the partnerCode property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPartnerCode() {
        return partnerCode;
    }

    /**
     * Sets the value of the partnerCode property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPartnerCode(String value) {
        this.partnerCode = value;
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
     * Gets the value of the sanctionListRecipient property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSanctionListRecipient() {
        return sanctionListRecipient;
    }

    /**
     * Sets the value of the sanctionListRecipient property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSanctionListRecipient(String value) {
        this.sanctionListRecipient = value;
    }

    /**
     * Gets the value of the sanctionListSender property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSanctionListSender() {
        return sanctionListSender;
    }

    /**
     * Sets the value of the sanctionListSender property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSanctionListSender(String value) {
        this.sanctionListSender = value;
    }

    /**
     * Gets the value of the sendAmount property.
     * 
     * @return
     *     possible object is
     *     {@link Money }
     *     
     */
    public Money getSendAmount() {
        return sendAmount;
    }

    /**
     * Sets the value of the sendAmount property.
     * 
     * @param value
     *     allowed object is
     *     {@link Money }
     *     
     */
    public void setSendAmount(Money value) {
        this.sendAmount = value;
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
