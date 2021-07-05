package com.gentlush.tlush;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.xml.transform.Result;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.TransformerFactoryConfigurationError;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.commons.io.FileUtils;
import org.apache.fop.apps.FOPException;
import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class Tlush {
	byte[] data;
	
	private void stub() {
    	String userDirectory = System.getProperty("user.dir");
		try {
			data = Files.readAllBytes(Paths.get(userDirectory+"\\src\\main\\resources\\pdf\\sample.pdf"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
    
    public Tlush(String id, String pop, String mon, String year){
    //	createPdf(id, pop, mon, year);
    	stub();
	
    }

	private void createPdf(String id, String pop, String mon, String year) throws TransformerFactoryConfigurationError {
		String userDirectory = System.getProperty("user.dir");
        File xsltFile = new File(userDirectory+"\\src\\main\\resources\\styles\\"+ pop + "_" + year + ".xsl");
        StreamSource xmlSource = new StreamSource(new File(userDirectory+"\\src\\main\\resources\\tlushim\\"+ id + "_" + pop + "_" + year + "_"+ mon + ".xml"));
        FopFactory fopFactory = FopFactory.newInstance(new File(".").toURI());
        FOUserAgent foUserAgent = fopFactory.newFOUserAgent();
        
        ByteArrayOutputStream out;
        out = new ByteArrayOutputStream();
        
        try {
            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);
            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer transformer = factory.newTransformer(new StreamSource(xsltFile));
            Result res = new SAXResult(fop.getDefaultHandler());
            transformer.transform(xmlSource, res);
            this.data = out.toByteArray();
        }catch (Exception e) {
			e.printStackTrace();
		} finally {
            try {
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
        }
	}
    
    public byte[] getData() {
    	return data;
    }
    
    public String toString() {
    	return data.toString();
    }

}
