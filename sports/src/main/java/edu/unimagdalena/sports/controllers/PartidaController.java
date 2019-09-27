package edu.unimagdalena.sports.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.unimagdalena.sports.entities.Partida;
import edu.unimagdalena.sports.entities.Usuario;
import edu.unimagdalena.sports.services.PartidaService;
import edu.unimagdalena.sports.services.UsuarioService;

@Controller
public class PartidaController {
	@Autowired
	private UsuarioService usuarioService;
	@Autowired
	private PartidaService partidaService;

	@GetMapping("/crear-partida")
	public String mostrarFormCrearPartida(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Usuario us = usuarioService.findUsuarioByUsername(auth.getName());

		Partida partida = new Partida();
		partida.setCreador(us.getUsername());

		model.addAttribute("partida", partida);
		return "crearpartida";
	}

	@PostMapping("/crear-partida")
	public String crearPartida(@Valid Partida partida, Model model) {

		partidaService.save(partida);

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Usuario us = usuarioService.findUsuarioByUsername(auth.getName());

		List<Partida> partidas = partidaService.buscarPartidasPorUsuario(us);

		model.addAttribute("mispartidas", partidas);
		model.addAttribute("PartidasU", us.getPartidas());
		return "mispartidas";

	}

	@GetMapping("/mis-partidas")
	public String listarPartidas(Model model) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		Usuario us = usuarioService.findUsuarioByUsername(auth.getName());
		List<Partida> partidas = partidaService.buscarPartidasPorUsuario(us);
		model.addAttribute("partidasU", us.getPartidas());
		model.addAttribute("mispartidas", partidas);
		return "mispartidas";
	}

	@GetMapping("/eliminar-partida/{id}")
	public String eliminarPartida(@PathVariable("id") Long id, Model model) {

		Partida partida = partidaService.buscarPartidaPorId(id);
		partidaService.delete(partida);

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Usuario us = usuarioService.findUsuarioByUsername(auth.getName());
		List<Partida> partidas = partidaService.buscarPartidasPorUsuario(us);
		model.addAttribute("mispartidas", partidas);
		model.addAttribute("partidasU", us.getPartidas());

		return "mispartidas";
	}

	@GetMapping("/buscar-partidas")
	public String buscarPartidaForm() {
		Partida p = new Partida();

		return "buscarpartida";

	}

	@PostMapping("/buscar-partidas")
	public String buscarPartida(@RequestParam("deporte") String deporte,
					@RequestParam("ciudad") String ciudad,
					@RequestParam("dpto") String departamento, Model modelo) {
		List<Partida> partidas = partidaService.buscarPartidaPorDeporteCiudadDepto(deporte, ciudad, departamento);
		modelo.addAttribute("partidas", partidas);
		return "buscarpartida";
	}
	
	@GetMapping("/unirse-partida/{id}")
	public String unirsePartida(@PathVariable("id") Long id,Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Usuario us = usuarioService.findUsuarioByUsername(auth.getName());
		
		Partida partida = partidaService.buscarPartidaPorId(id);
		us.getPartidas().add(partida);
		
		usuarioService.actualizarPartida(us);
		
		
		model.addAttribute("mispartidas", partida);
		model.addAttribute("partidasU ", us.getPartidas());
		
		return "mispartidas";
		
	}
	
	@GetMapping("/abandonar-partida/{id}")
	public String abandonarPartida(@PathVariable("id") Long id, Model model) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		Usuario us = usuarioService.findUsuarioByUsername(auth.getName());
		Partida partida = partidaService.buscarPartidaPorId(id);
		us.getPartidas().remove(partida);
		
		usuarioService.actualizarPartida(us);
		
		model.addAttribute("partidasU ", us.getPartidas());
		model.addAttribute("mispartidas", partida);
		
		return "mispartidas";
	}
	
	@GetMapping("/info-partida/{id}")
	public String infopartida(@PathVariable("id") Long id , Model model) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Usuario us = usuarioService.findUsuarioByUsername(auth.getName());
		
		Partida partida = partidaService.buscarPartidaPorId(id);
		
		model.addAttribute("infoPartida", partida);
		
		return ("info-partida");
	}

}
