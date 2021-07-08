package com.gentlush.glufa;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
//import java.io.InputStream;
//import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.xml.XMLConstants;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
//import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
//import javax.xml.transform.TransformerFactoryConfigurationError;
//import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
/*
import org.apache.commons.io.FileUtils;
import org.apache.fop.apps.FOPException;
import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
*/
public class Glufa {
	byte[] data;
    
    public Glufa(String pop, String year){

    	String userDirectory = System.getProperty("user.dir");
		try {
			data = Files.readAllBytes(Paths.get(userDirectory+"\\src\\main\\resources\\glufot\\" + pop + "_" + year + ".png"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
    }
    
    public byte[] getData() {
    	return data;
    }
    
    public String toString() {
    	return data.toString();
    }

}
