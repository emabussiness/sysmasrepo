package com.example.sysmas.service;

import com.example.sysmas.model.UnidadMedida;
import com.example.sysmas.repository.UnidadMedidaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UnidadMedidaService {

    @Autowired
    private UnidadMedidaRepository unidadMedidaRepository;

    public List<UnidadMedida> findAll() {
        return unidadMedidaRepository.findAll();
    }

    public Optional<UnidadMedida> findById(Long id) {
        return unidadMedidaRepository.findById(id);
    }

    public UnidadMedida save(UnidadMedida unidadMedida) {
        return unidadMedidaRepository.save(unidadMedida);
    }

    public void deleteById(Long id) {
        unidadMedidaRepository.deleteById(id);
    }
}