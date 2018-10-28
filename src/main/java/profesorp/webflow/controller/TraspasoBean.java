package profesorp.webflow.controller;

import java.io.Serializable;
import java.sql.Date;
import lombok.Data;

@Data
public class TraspasoBean implements Serializable
{
    String cuentaOrigen="";
    double importe=0;
    String cuentaFinal="";    
    Date fechaTraspaso ;
    Date fechaFinal ;
    boolean periodico=false;
    String msgImporte=null;
    private boolean puestoPeriodico=false;
    
    public TraspasoBean()
    {
        fechaTraspaso=new Date(System.currentTimeMillis());
        fechaFinal=new Date(System.currentTimeMillis());
    }
    public void setPeriodico(boolean periodico)
    {
        this.periodico=periodico;
        puestoPeriodico=periodico;
    }
}
