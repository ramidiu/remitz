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
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for anonymous complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="login" type="{http://mfs/xsd}Credential" minOccurs="0"/&gt;
 *         &lt;element name="send_amount" type="{http://mfs/xsd}Money" minOccurs="0"/&gt;
 *         &lt;element name="fee" type="{http://mfs/xsd}Money" minOccurs="0"/&gt;
 *         &lt;element name="sender" type="{http://mfs/xsd}Sender" minOccurs="0"/&gt;
 *         &lt;element name="recipient" type="{http://mfs/xsd}Recipient" minOccurs="0"/&gt;
 *         &lt;element name="third_party_trans_id" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="reference" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "login",
    "sendAmount",
    "fee",
    "sender",
    "recipient",
    "thirdPartyTransId",
    "reference"
})
@XmlRootElement(name = "mm_trans_log")
public class MmTransLog {

    @XmlElement(nillable = true)
    protected Credential login;
    @XmlElement(name = "send_amount", nillable = true)
    protected Money sendAmount;
    @XmlElement(nillable = true)
    protected Money fee;
    @XmlElement(nillable = true)
    protected Sender sender;
    @XmlElement(nillable = true)
    protected Recipient recipient;
    @XmlElement(name = "third_party_trans_id", nillable = true)
    protected String thirdPartyTransId;
    @XmlElement(nillable = true)
    protected String reference;

    /**
     * Gets the value of the login property.
     * 
     * @return
     *     possible object is
     *     {@link Credential }
     *     
     */
    public Credential getLogin() {
        return login;
    }

    /**
     * Sets the value of the login property.
     * 
     * @param value
     *     allowed object is
     *     {@link Credential }
     *     
     */
    public void setLogin(Credential value) {
        this.login = value;
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
     * Gets the value of the sender property.
     * 
     * @return
     *     possible object is
     *     {@link Sender }
     *     
     */
    public Sender getSender() {
        return sender;
    }

    /**
     * Sets the value of the sender property.
     * 
     * @param value
     *     allowed object is
     *     {@link Sender }
     *     
     */
    public void setSender(Sender value) {
        this.sender = value;
    }

    /**
     * Gets the value of the recipient property.
     * 
     * @return
     *     possible object is
     *     {@link Recipient }
     *     
     */
    public Recipient getRecipient() {
        return recipient;
    }

    /**
     * Sets the value of the recipient property.
     * 
     * @param value
     *     allowed object is
     *     {@link Recipient }
     *     
     */
    public void setRecipient(Recipient value) {
        this.recipient = value;
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

}
