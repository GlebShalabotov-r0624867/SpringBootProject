package be.ucll.herexamen.controller;

import be.ucll.herexamen.model.MyService;
import be.ucll.herexamen.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin(origins = "http://localhost:4200")
public class RestControllerUsers {

    @Autowired
    MyService myService;


    @GetMapping("/users")
    public List<User> getAllUsers()
    {
        return myService.getAllUsers();
    }
}
