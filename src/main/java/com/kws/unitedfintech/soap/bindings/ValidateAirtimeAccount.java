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
 *         &lt;element name="from_country" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="send_currency_code" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="to_country" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="msisdn" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
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
    "fromCountry",
    "sendCurrencyCode",
    "toCountry",
    "msisdn"
})
@XmlRootElement(name = "validate_airtime_account")
public class ValidateAirtimeAccount {

    @XmlElement(nillable = true)
    protected Credential login;
    @XmlElement(name = "from_country", nillable = true)
    protected String fromCountry;
    @XmlElement(name = "send_currency_code", nillable = true)
    protected String sendCurrencyCode;
    @XmlElement(name = "to_country", nillable = true)
    protected String toCountry;
    @XmlElement(nillable = true)
    protected String msisdn;

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
     * Gets the value of the fromCountry property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getFromCountry() {
        return fromCountry;
    }

    /**
     * Sets the value of the fromCountry property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setFromCountry(String value) {
        this.fromCountry = value;
    }

    /**
     * Gets the value of the sendCurrencyCode property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSendCurrencyCode() {
        return sendCurrencyCode;
    }

    /**
     * Sets the value of the sendCurrencyCode property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSendCurrencyCode(String value) {
        this.sendCurrencyCode = value;
    }

    /**
     * Gets the value of the toCountry property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getToCountry() {
        return toCountry;
    }

    /**
     * Sets the value of the toCountry property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setToCountry(String value) {
        this.toCountry = value;
    }

    /**
     * Gets the value of the msisdn property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getMsisdn() {
        return msisdn;
    }

    /**
     * Sets the value of the msisdn property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setMsisdn(String value) {
        this.msisdn = value;
    }

}