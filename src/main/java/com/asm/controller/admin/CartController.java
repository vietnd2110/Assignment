package com.asm.controller.admin;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.entities.OrderDetails;
import com.asm.entities.Orders;
import com.asm.entities.Products;
import com.asm.repository.ProductRepository;

@Controller
@RequestMapping(value = "/Assignment1/cart")
public class CartController {

	@Autowired
	private ProductRepository productRepository;

	@GetMapping(params = "p")
	public String addToCart(@ModelAttribute(name = "order") Orders order ,Model model,
			@RequestParam(name = "p") int id, HttpSession session) {
		HashMap<Integer, OrderDetails> cart = (HashMap<Integer, OrderDetails>) session.getAttribute("cart");
		if (cart == null) {
			cart = new HashMap<Integer, OrderDetails>();
		}
		Products product = productRepository.findById(id).get();
		if (cart.containsKey(product.getId())) {
			OrderDetails od = cart.get(product.getId());
			od.setQuantity(od.getQuantity() + 1);
		} else {
			OrderDetails o = new OrderDetails();
			o.setProductId(id);
			o.setQuantity(1);
			cart.put(product.getId(), o);
		}
		session.setAttribute("cart", cart);
		model.addAttribute("view", "/views/users/cart.jsp");
		return "home";
	}

	@GetMapping("cart")
	public String goCart(Model model) {
		model.addAttribute("view", "/views/users/cart.jsp");
		return "home";
	}

	@GetMapping(value = "/remove", params = "p")
	public String removeProductFromCart(@ModelAttribute(name = "order") Orders order ,@RequestParam(name = "p") int id, HttpSession session, Model model) {
		HashMap<Integer, OrderDetails> cart = (HashMap<Integer, OrderDetails>) session.getAttribute("cart");
		cart.remove(id);
		session.setAttribute("cart", cart);
		model.addAttribute("view", "/views/users/cart.jsp");
		return "home";
	}

}
