package com.gentlush.glufa;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GlufaController {
	
	
	@Autowired
	GlufaService glufot;

	
	@RequestMapping("/glufa/{pop}/{year}")
	  public ResponseEntity<byte[]> tlush(@PathVariable String pop, @PathVariable String year) {
		  	byte[] data = glufot.get(pop, year).getData(); 
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_PNG);
			headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
			ResponseEntity<byte[]> response;
			if(data != null)
				response = new ResponseEntity<>(data, headers, HttpStatus.OK);
			else
				response = new ResponseEntity<>(data, headers, HttpStatus.NOT_FOUND);
			return response;
	  }
}
