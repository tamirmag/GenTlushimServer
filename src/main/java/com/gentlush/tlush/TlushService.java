
package com.gentlush.tlush;

import java.io.IOException;

import javax.xml.transform.TransformerException;

//import org.apache.fop.apps.FOPException;
import org.springframework.stereotype.Service;

@Service
public class TlushService {
	
	private Tlush tlush;


	public TlushService() throws /*FOPException,*/ IOException, TransformerException {
	}

	
    public Tlush get(String id, String pop, String mon, String year){
    	return new Tlush(id,pop,year,mon);
    }
}
