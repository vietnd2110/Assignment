package com.asm.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import com.asm.entities.Categories;
import com.asm.entities.Products;
import com.asm.repository.CategoryRepository;
import com.asm.repository.ProductRepository;

@Controller
public class HomeController {
	@Autowired
	CategoryRepository cateRepo;

	@Autowired
	ProductRepository proRepo;

	@RequestMapping("/home")
	public String home(Model model, @RequestParam(name = "page", defaultValue = "0") int page,
			@RequestParam(name = "size", defaultValue = "10") int size) {
		List<Categories> cate = cateRepo.findAll();
		model.addAttribute("cate", cate);
		Pageable pageable = PageRequest.of(page, size);

		Page<Products> p = this.proRepo.findAll(pageable);
		model.addAttribute("data", p);

		model.addAttribute("view", "/views/home.jsp");
		return "layout";
	}

}
