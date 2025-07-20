package com.example.sysmas.service;

import com.example.sysmas.model.TipoDocumento;
import com.example.sysmas.repository.TipoDocumentoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TipoDocumentoService {

    @Autowired
    private TipoDocumentoRepository tipoDocumentoRepository;

    public List<TipoDocumento> findAll() {
        return tipoDocumentoRepository.findAll();
    }

    public Optional<TipoDocumento> findById(Long id) {
        return tipoDocumentoRepository.findById(id);
    }

    public TipoDocumento save(TipoDocumento tipoDocumento) {
        return tipoDocumentoRepository.save(tipoDocumento);
    }

    public void deleteById(Long id) {
        tipoDocumentoRepository.deleteById(id);
    }
}