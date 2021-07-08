
package com.gentlush.glufa;

import java.io.IOException;

import javax.xml.transform.TransformerException;

//import org.apache.fop.apps.FOPException;
import org.springframework.stereotype.Service;

@Service
public class GlufaService {
	
	private Glufa tlush;


	public GlufaService() throws /*FOPException,*/ IOException, TransformerException {
	}

	
    public Glufa get(String pop, String year){
    	return new Glufa(pop, year);
    }
}
