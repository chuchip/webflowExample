package profesorp.webflow.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import lombok.Data;

@Entity
@Data
public class Cuentas implements Serializable{   
  
    @Id
    String cuenta;
    String importe;
  
    
}
