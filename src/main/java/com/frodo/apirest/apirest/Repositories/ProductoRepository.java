package com.frodo.apirest.apirest.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import com.frodo.apirest.apirest.Entities.Producto;

public interface ProductoRepository extends 
JpaRepository <Producto, Long>{

}
