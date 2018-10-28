package profesorp.webflow.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;
import profesorp.webflow.controller.TraspasoBean;
import profesorp.webflow.model.Clientes;
import profesorp.webflow.repository.CuentasRepository;
import profesorp.webflow.repository.UsuariosRepository;
import profesorp.webflow.exceptions.NotFoundException;
import profesorp.webflow.model.Cuentas;
import profesorp.webflow.repository.CuentasClientesRepository;

@Service
@SessionScope
public class LogicaService {
    Logger logger=LoggerFactory.getLogger(LogicaService.class);
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
        logger.info("LLamado a getCliente:"+cliente.getNombre());
        return cliente;
    }
    /**
     * Devuelve true si el cliente podria retirar este dinero de la cuenta.
     * @param traspasoBean Datos del traspaso     
     * @return 
     */
    public boolean hasCredit(TraspasoBean traspasoBean)
    {       
        traspasoBean.setPeriodico(traspasoBean.isPuestoPeriodico()); // Desactiva periodo si no se ha marcado el checkbos en la vista
        if (traspasoBean.getCuentaFinal().length()<3)
        {
           traspasoBean.setMsgImporte("Cuenta final debe tener mas de 3 digitos");   
           return false;
        }
        Cuentas cuentas= cuentasRepository.findById(traspasoBean.getCuentaOrigen()).orElseThrow(()-> new NotFoundException("Cuenta: "+traspasoBean.getCuentaOrigen()+" No encontrada"));
        if ( cuentas.getImporte()>=traspasoBean.getImporte())
        {
             traspasoBean.setMsgImporte(null);
             return true;
        }         
        traspasoBean.setMsgImporte("No tiene suficiente dinero en la cuenta origen");
        return false;
    }
    public boolean checkImporte(TraspasoBean traspasoBean)
    {
         if ( traspasoBean.getImporte()>=1)
         {
             traspasoBean.setMsgImporte(null);
             return true;
         }         
         traspasoBean.setMsgImporte("Importe a transferir debe ser superior o igual a 1 €");
         return false;
    }
    public boolean isPeriodico(TraspasoBean traspasoBean)
    {
        return traspasoBean.isPeriodico();
    }
}
