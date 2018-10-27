/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package profesorp.webflow.model;

import java.io.Serializable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

/**
 *
 * @author chuchip
 */
@Entity
@Table(name="cuentas_clientes")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CuentasClientes implements Serializable {
    @EmbeddedId
    private CuentaId id;    
}
 

