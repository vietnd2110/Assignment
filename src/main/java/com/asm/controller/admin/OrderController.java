package com.asm.controller.admin;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.bean.OrderModel;
import com.asm.entities.Accounts;
import com.asm.entities.Orders;
import com.asm.repository.AccountRepository;
import com.asm.repository.OrderRepository;

@Controller
@RequestMapping("/admin/orders")
public class OrderController {

	@Autowired
	private OrderRepository orderRepo;

	@Autowired
	private AccountRepository accRepository;

	@GetMapping("create")
	public String create(@ModelAttribute("order") OrderModel order, Model mol) {

		List<Accounts> acc = this.accRepository.findAll();
		mol.addAttribute("data", acc);
		mol.addAttribute("view", "/views/admin/orders/create.jsp");
		return "layout";

	}

	@PostMapping("store")
	public String store(@Valid @ModelAttribute("order") OrderModel model, BindingResult result, Model mol) {

		if (result.hasErrors()) {
			System.out.println("form không hợp lệ");
			mol.addAttribute("view", "/views/admin/orders/create.jsp");
			return "layout";
		} else {
			System.out.println("form hợp lệ");
			Orders or = new Orders();
			or.setUserId(model.getUserId());
			or.setCreateDate(model.getCreateDate());
			or.setAddress(model.getAddress());
			this.orderRepo.save(or);
			return "redirect:/admin/orders/index";
		}
	}

	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") Orders order) {

		this.orderRepo.delete(order);

		return "redirect:/admin/orders/index";
	}

	@GetMapping("index")
	public String index(Model model, @RequestParam(name = "page", defaultValue = "0") int page,
			@RequestParam(name = "size", defaultValue = "10") int size) {

		Pageable pageable = PageRequest.of(page, size);

		Page<Orders> p = this.orderRepo.findAll(pageable);
		model.addAttribute("data", p);
		model.addAttribute("view", "/views/admin/orders/index.jsp");
		return "layout";
	}

	@GetMapping("edit/{id}")
	public String edit(@PathVariable("id") int id, Model mol) {

		Optional<Orders> ord = this.orderRepo.findById(id);
		mol.addAttribute("ord", ord.get());
		mol.addAttribute("view", "/views/admin/orders/edit.jsp");
		return "layout";
	}

	@PostMapping("update")
	public String update(Orders ord) {

		this.orderRepo.save(ord);

		return "redirect:/admin/orders/index";
	}
}
