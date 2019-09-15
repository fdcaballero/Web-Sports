package edu.unimagdalena.sports.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.unimagdalena.sports.entities.Partida;
import edu.unimagdalena.sports.entities.Usuario;
import edu.unimagdalena.sports.repositories.PartidaRepository;

@Service
public class PartidaServiceImp implements PartidaService {

	@Autowired private PartidaRepository partidaRepository;
	@Override
	public List<Partida> buscarPartidasPorUsuario(Usuario usuario) {
		// TODO Auto-generated method stub
		String creador = usuario.getUsername();
		return partidaRepository.findPartidasByCreador(creador);
	}

	@Override
	public void save(Partida partida) {
		partidaRepository.save(partida);

	}

}