package profesorp.webflow.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;
import profesorp.webflow.model.Clientes;
import profesorp.webflow.repository.CuentasRepository;
import profesorp.webflow.repository.UsuariosRepository;
import profesorp.webflow.exceptions.NotFoundException;
import profesorp.webflow.model.CuentaId;
import profesorp.webflow.model.CuentasClientes;
import profesorp.webflow.repository.CuentasClientesRepository;

@Service
@SessionScope
public class LogicaService {
    @Autowired
    CuentasRepository cuentasRepository;

    @Autowired
    UsuariosRepository usuariosRepository;
   
    @Autowired
    CuentasClientesRepository cuentasClientesRepository;
    
    Clientes cliente;
    
    public Clientes getUsuarioById(String usuario)
    {
        cliente= usuariosRepository.findById(usuario).orElseThrow(()-> new NotFoundException("Usuario: "+usuario+" No encontrado"));
        return cliente;
    }
    public Iterable<String> getCuentasByCliente()
    {
       return cuentasClientesRepository.findCuentasByCliente(cliente.getId());
    }
    public Clientes getCliente()
    {
        System.out.println("LLamado a getCliente:"+cliente.getNombre());
        return cliente;
    }
    
}
