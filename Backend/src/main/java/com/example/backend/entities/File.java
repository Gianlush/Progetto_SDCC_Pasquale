package com.example.backend.entities;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
@Table(name = "file", schema = "filesystem")
public class File {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "nome")
    private String nome;

    @Basic
    @Column(name = "estensione")
    private String estensione;

    @Basic
    @Column(name = "descrizione")
    private String descrizione;

    @Basic
    @Column(name = "data")
    private byte[] data;
}
