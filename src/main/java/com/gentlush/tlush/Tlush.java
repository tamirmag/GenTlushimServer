package com.gentlush.tlush;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import javax.xml.XMLConstants;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import org.xhtmlrenderer.pdf.ITextRenderer;

import com.lowagie.text.pdf.BaseFont;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class Tlush {
	byte[] data;
	
	private void stub() {
    	String userDirectory = System.getProperty("user.dir");
		try {
			data = Files.readAllBytes(Paths.get(userDirectory+"\\src\\main\\resources\\pdf\\sample.pdf"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
    
    public Tlush(String id, String pop, String mon, String year){
   // 	stub();
    	transform(id, pop, mon, year);
	
    }
    
    private static String htmlToXhtml(String html) {
        Document document = Jsoup.parse(html);
        String enc = "<meta charset=\"UTF-8\">\r\n";
  /*      String css =  "		<style>\r\n"
    				+ "			html, body {\r\n"
    				+ " 			margin: 0;\r\n"
    				+ " 			padding: 0;\r\n"
    				+ " 			font-family: Arial, Arial Bold;\r\n"
    				+ " 			font-size: 10px;\r\n"
    				+ " 			line-height: 14px;\r\n"
    				+ "				direction: rtl;\r\n"
    				+ "        		unicode-bidi: bidi-override;\r\n"
    				+ "			}\r\n"
    				+ "		</style>\r\n";
  */
        String oldCss = "		<style>\r\n"
        		+ "			html, body {\r\n"
				+ " 			font-family: Arial, Arial Bold;\r\n"
				+ "				direction: RTL;\r\n"
				+ "        		unicode-bidi: bidi-override;\r\n"
				+ " 			}"
        		+ ".sectionTitle\r\n"
        		+ "{\r\n"
        		+ "	color:#3737b4;\r\n"
        		+ "font-weight:bold;\r\n"
        		+ "}\r\n"
        		+ ".itemTitle\r\n"
        		+ "{\r\n"
        		+ "background-color:#3737b4;\r\n"
        		+ "color: White;\r\n"
        		+ "}\r\n"
        		+ ".colHeader\r\n"
        		+ "{\r\n"
        		+ "	background-color:3737b4;\r\n"
        		+ "color:White;\r\n"
        		+ "font-weight:bold;\r\n"
        		+ "}\r\n"
        		+ ".itemText\r\n"
        		+ "{\r\n"
        		+ "	font-style:normal;\r\n"
        		+ "	HEIGHT: 15px;\r\n"
        		+ "}\r\n"
        		+ ".itemNum\r\n"
        		+ "{\r\n"
        		+ "	font: 11px Arial normal;\r\n"
        		+ "	HEIGHT: 15px;\r\n"
        		+ "}\r\n"
        		+ ".golmiNew\r\n"
        		+ "{\r\n"
        		+ "	background-color: cornflowerblue;\r\n"
        		+ "	font-weight:bold;\r\n"
        		+ "font-style:normal;\r\n"
        		+ "HEIGHT: 15px;\r\n"
        		+ "}\r\n"
        		+ ".totalText\r\n"
        		+ "{\r\n"
        		+ "	font-weight:bold;\r\n"
        		+ "}\r\n"
        		+ ".odaotTd\r\n"
        		+ "{\r\n"
        		+ "font: 9px Arial\r\n"
        		+ "	HEIGHT: 10px\r\n"
        		+ "}\r\n"
        		+ ".tlushTd\r\n"
        		+ "{\r\n"
        		+ "font: 11px Arial\r\n"
        		+ "	HEIGHT: 15px\r\n"
        		+ "}\r\n"
        		+ ".t161SmallTd\r\n"
        		+ "{\r\n"
        		+ "font: 9px Arial\r\n"
        		+ "	HEIGHT: 15px\r\n"
        		+ "}\r\n"
        		+ ".tKizurSmallTd\r\n"
        		+ "{\r\n"
        		+ "font: 9px Arial\r\n"
        		+ "	HEIGHT: 15px\r\n"
        		+ "}\r\n"
        		+ "		</style>\r\n";
        document.selectFirst("head").append(enc+oldCss);
        document.outputSettings().syntax(Document.OutputSettings.Syntax.xml);
        return document.html();
    }

	private void transform(String id, String pop, String mon, String year) {
		String userDirectory = System.getProperty("user.dir");
        Source xslt = new StreamSource(new File(userDirectory+"\\src\\main\\resources\\styles\\"+ pop + "_" + year + ".xsl"));
        Source xml  = new StreamSource(new File(userDirectory+"\\src\\main\\resources\\tlushim\\"+ id + "_" + pop + "_" + year + "_"+ mon + ".xml"));
        ByteArrayOutputStream outdata;
        outdata = new ByteArrayOutputStream();
        Result out  = new StreamResult(outdata);

        TransformerFactory factory = TransformerFactory.newInstance();
        factory.setAttribute(XMLConstants.ACCESS_EXTERNAL_DTD, "");
        factory.setAttribute(XMLConstants.ACCESS_EXTERNAL_STYLESHEET, "");


        Transformer transformer;
		try {
			transformer = factory.newTransformer(xslt);
			transformer.transform(xml, out);
			String html = outdata.toString("UTF-8");
		    String xhtml = htmlToXhtml(html);
		    System.out.println(xhtml);
			    ITextRenderer iTextRenderer = new ITextRenderer();
			    iTextRenderer.getFontResolver().addFont("C:/Windows/fonts/Arial.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
			    iTextRenderer.setDocumentFromString(xhtml);
			    iTextRenderer.layout();
			    ByteArrayOutputStream os = new ByteArrayOutputStream();
			    iTextRenderer.createPDF(os);
			    iTextRenderer.finishPDF();
			    this.data = os.toByteArray();
			    os.close();
			    
			    try (FileOutputStream fos = new FileOutputStream(userDirectory+"\\src\\main\\resources\\shit.html")) {
			    	   fos.write(xhtml.getBytes());
			    	   //fos.close(); There is no more need for this line since you had created the instance of "fos" inside the try. And this will automatically close the OutputStream
			    	}
			    try (FileOutputStream fos = new FileOutputStream(userDirectory+"\\src\\main\\resources\\shit.pdf")) {
			    	   fos.write(this.data);
			    	   //fos.close(); There is no more need for this line since you had created the instance of "fos" inside the try. And this will automatically close the OutputStream
			    	}
			
	
		} catch (TransformerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        
	}
    
    public byte[] getData() {
    	return data;
    }
    
    public String toString() {
    	return data.toString();
    }

}
