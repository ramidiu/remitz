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
 *         &lt;element name="mfs_trans_id" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
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
    "mfsTransId"
})
@XmlRootElement(name = "airtime_trans_com")
public class AirtimeTransCom {

    @XmlElement(nillable = true)
    protected Credential login;
    @XmlElement(name = "mfs_trans_id", nillable = true)
    protected String mfsTransId;

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

}