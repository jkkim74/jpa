package com.jk.ktMembership;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProductController {
	
	@Autowired
	ProductRepository productRepository;
	
	@GetMapping("/products/{product}")
	public Optional<Product> getProduct(@PathVariable Product product) {
		Product prod = new Product();
		prod.setName("smart phone");
		Product savedProduct = productRepository.save(prod);
		
		
		Optional<Product> resultProduc = productRepository.findById(savedProduct.getId());//savedProduct.getId()
		return resultProduc;
	}

}
