/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package profesorp.webflow.repository;

import org.springframework.data.repository.CrudRepository;
import profesorp.webflow.model.Clientes;

/**
 *
 * @author chuchip
 */
public interface UsuariosRepository extends CrudRepository<Clientes, String> {
    
}
