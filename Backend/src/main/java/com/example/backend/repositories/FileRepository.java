package com.example.backend.repositories;

import com.example.backend.entities.File;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FileRepository extends JpaRepository<File, Integer> {

    boolean existsById(int id);
    File findById(int id);
    Page<File> findByNomeContainingAndEstensioneContaining(String nome, String estensione, Pageable paging);

}
