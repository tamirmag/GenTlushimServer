package com.gentlush.tlush;

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
public class TlushController {
	
	
	@Autowired
	TlushService tlushim;

	
	@RequestMapping("/tlush/{id}/{pop}/{year}/{month}")
	  public ResponseEntity<byte[]> tlush(@PathVariable String id, @PathVariable String pop, @PathVariable String year, @PathVariable String month) {
		  	byte[] data = tlushim.get(id, pop, year, month).getData(); 
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_PDF);
			headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
			ResponseEntity<byte[]> response;
			if(data != null)
				response = new ResponseEntity<>(data, headers, HttpStatus.OK);
			else
				response = new ResponseEntity<>(data, headers, HttpStatus.NOT_FOUND);
			return response;
	  }
}
