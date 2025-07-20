package com.example.sysmas.service;

import com.example.sysmas.model.TipoIVA;
import com.example.sysmas.repository.TipoIVARepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TipoIVAService {

    @Autowired
    private TipoIVARepository tipoIVARepository;

    public List<TipoIVA> findAll() {
        return tipoIVARepository.findAll();
    }

    public Optional<TipoIVA> findById(Long id) {
        return tipoIVARepository.findById(id);
    }

    public TipoIVA save(TipoIVA tipoIVA) {
        return tipoIVARepository.save(tipoIVA);
    }

    public void deleteById(Long id) {
        tipoIVARepository.deleteById(id);
    }
}