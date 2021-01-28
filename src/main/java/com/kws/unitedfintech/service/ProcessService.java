package com.kws.unitedfintech.service;

import java.util.List;

import com.kws.unitedfintech.entities.Processbank;

public interface ProcessService {
 public void saveprocessbankdetails(Processbank processbank);
 
 public List<Processbank> getListbycountry(String country);
}
