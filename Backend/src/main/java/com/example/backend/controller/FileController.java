package com.example.backend.controller;

import com.example.backend.entities.File;
import com.example.backend.services.FileService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/file", produces = "application/json;charset=UTF-8")
public class FileController {

    @Autowired
    private FileService fileService;

    @GetMapping()
    public List<File> getByNomeAndEstensione(@RequestParam String nome, @RequestParam String estensione,
                                             @RequestParam int pageNumber, @RequestParam int pageSize,
                                             @RequestParam String sortBy, @RequestParam int sortDirection){
        return fileService.showAllFiles(nome, estensione, pageNumber, pageSize, sortBy, sortDirection);
    }

    @GetMapping("/id")
    public File getById(@RequestParam int id){
        return fileService.findById(id);
    }

    @GetMapping("/bytes")
    public String getFileBytes(@RequestParam int id){
        return fileService.getBytes(id);
    }

    @PostMapping("/create")
    public File createFile(@RequestParam String jsonFile, @RequestBody String jsonBytes){
        try {
            return fileService.createFile(jsonFile, jsonBytes);
        } catch (JsonProcessingException e) {
            System.out.println("Errore conversione json File");
            throw new RuntimeException(e);
        }
    }


    /*
    @GetMapping("/prova")
    public void scarica(@RequestParam int idFile) throws IOException {

        File file = fileService.findById(idFile);
        //System.out.println(Arrays.toString(file.getBytes()));
        System.out.print("[");
        System.out.print(file.getBytes()[0]+",");
        System.out.print(file.getBytes()[1]+",");
        System.out.print(file.getBytes()[2]+",");
        System.out.print(file.getBytes()[3]+",");
        System.out.println("]");
        FileOutputStream fos;
        fos = new FileOutputStream("C:\\Users\\gianl\\Documents\\" + file.getNome()+"."+file.getEstensione());
        fos.write(file.getBytes());
        fos.close();
    }*/

}
