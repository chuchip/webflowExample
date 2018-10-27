/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package profesorp.webflow.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author chuchip
 */
@Embeddable
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CuentaId implements Serializable {

    @Column(nullable = false)
    int id;
    @Column(nullable = false)
    String cuenta;
}
