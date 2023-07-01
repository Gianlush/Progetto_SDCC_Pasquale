package com.example.backend.controller;
import com.example.backend.entities.User;
import com.example.backend.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/user", produces = "application/json;charset=UTF-8")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public User loginUser(String email, String password){
        return userService.showUserByPassword(email, password);
    }

    @PostMapping("/register")
    public User registerUser(@RequestBody User user) {
        return userService.registerUser(user);
    }
}
