package com.example.backend.services;

import com.example.backend.entities.File;
import com.example.backend.repositories.FileRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class FileService {
    @Autowired
    private FileRepository fileRepository;

    public boolean existsById(int id){
        return fileRepository.existsById(id);
    }
    public File findById(int id){
        return fileRepository.findById(id);
    }

    public String getBytes(int id){
        File file = fileRepository.findById(id);
        return Arrays.toString(file.getBytes());
    }
    public List<File> showAllFiles(String nome, String estensione, int pageNumber, int pageSize, String sortBy, int sortDirection) {
        Pageable paging = PageRequest.of(pageNumber,pageSize, Sort.by(sortDirection==1 ? Sort.Direction.DESC : Sort.Direction.ASC, sortBy));
        Page<File> pagedResult = fileRepository.findByNomeContainingAndEstensioneContaining(nome, estensione, paging);
        if (pagedResult.hasContent()) {
            return pagedResult.getContent();
        }
        else {
            return new ArrayList<>();
        }
    }
    @Transactional
    public File createFile(String jsonFile, String jsonBytes) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        File file = mapper.readValue(jsonFile, File.class);
        byte[] bytes = mapper.readValue(jsonBytes, byte[].class);
        file.setBytes(bytes);
        return fileRepository.save(file);
    }
}
