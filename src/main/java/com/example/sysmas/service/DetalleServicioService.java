package com.example.sysmas.service;

import com.example.sysmas.model.DetalleServicio;
import com.example.sysmas.repository.DetalleServicioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DetalleServicioService {

    @Autowired
    private DetalleServicioRepository detalleServicioRepository;

    public List<DetalleServicio> findAll() {
        return detalleServicioRepository.findAll();
    }

    public Optional<DetalleServicio> findById(Long id) {
        return detalleServicioRepository.findById(id);
    }

    public DetalleServicio save(DetalleServicio detalleServicio) {
        return detalleServicioRepository.save(detalleServicio);
    }

    public void deleteById(Long id) {
        detalleServicioRepository.deleteById(id);
    }
}