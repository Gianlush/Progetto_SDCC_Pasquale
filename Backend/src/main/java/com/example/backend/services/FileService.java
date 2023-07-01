package com.example.backend.services;

import com.example.backend.entities.File;
import com.example.backend.repositories.FileRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class FileService {
    @Autowired
    private FileRepository fileRepository;

    public List<File> showAllBook(String name, String listAges, String listGenres, String listAuthors) {
        return null;
    }
}
