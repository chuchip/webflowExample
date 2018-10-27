
package profesorp.webflow.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import lombok.Data;

/**
 *
 * @author chuchip
 */
@Entity
@Data
        
public class Clientes implements Serializable{
    int id;
    @Id
    private String login;
    private String nombre;
    private String dni;

}
