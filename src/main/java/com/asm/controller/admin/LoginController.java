package com.asm.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.entities.Accounts;
import com.asm.repository.AccountRepository;

@Controller
public class LoginController {
	@Autowired
	AccountRepository accountRepo;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	HttpSession httpSession;

	@GetMapping("/login")
	public String getLoginForm(Model model, @ModelAttribute("account") Accounts account) {
		model.addAttribute("view", "/views/login.jsp");
		return "layout";
	}

	@PostMapping("/login")
	public String login(Accounts account) {
		Accounts accounts = this.accountRepo.findByUser(account.getUsername());
		if (accounts == null) {
			httpSession.setAttribute("error", "Tài khoản hoặc Password không tồn tại");
			return "redirect:/login";
		} else {
			BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
			boolean CheckPwd = bCryptPasswordEncoder.matches(account.getPassword(), accounts.getPassword());
			if (!CheckPwd) {
				httpSession.setAttribute("error", "Tài khoản hoặc Password không tồn tại");
				return "redirect:/login";
			} else {
				httpSession.setAttribute("user", accounts);
				return "redirect:/home";
			}
		}
	}
	
	@RequestMapping("logout")
	public String logout() {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return "redirect:/home";
	}
}
