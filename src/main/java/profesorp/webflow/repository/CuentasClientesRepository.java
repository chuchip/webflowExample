/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package profesorp.webflow.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import profesorp.webflow.model.CuentasClientes;
import profesorp.webflow.model.CuentaId;

public interface CuentasClientesRepository extends CrudRepository<CuentasClientes, CuentaId> {
//        @Query("SELECT l FROM CuentasClientes l where l.id.id = ?1 ")
//	public Iterable<CuentasClientes>  findCuentasByCliente(Integer cliente);
        
        @Query("SELECT l.id.cuenta FROM CuentasClientes l where l.id.id = ?1 ")
	public Iterable<String>  findCuentasByCliente(Integer cliente);
}
