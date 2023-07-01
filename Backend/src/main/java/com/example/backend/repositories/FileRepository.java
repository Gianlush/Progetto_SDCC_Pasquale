package com.example.backend.repositories;
import com.example.backend.entities.File;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FileRepository extends JpaRepository<File, Integer> {

    boolean existsById(int id);
    File findById(int id);
    List<File> findByNomeContainingAndEstensioneContaining(String nome, String estensione);

}
