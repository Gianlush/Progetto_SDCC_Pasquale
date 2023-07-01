package com.example.backend.controller;

import com.example.backend.entities.File;
import com.example.backend.services.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/file", produces = "application/json;charset=UTF-8")
public class FileController {

    @Autowired
    private FileService fileService;


    @PostMapping()
    public List<File> getByName(@RequestParam String name, String listAges, String listGenres, String listAuthors){
        return null;
    }

}
