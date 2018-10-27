package profesorp.webflow.controller;

import java.security.Principal;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import profesorp.webflow.model.Clientes;
import profesorp.webflow.services.LogicaService;


@Controller
@RequestMapping("/")
public class MyController {

    @Autowired
    LogicaService logicaService;
    

    static Logger logger=LoggerFactory.getLogger(MyController.class);
    
    Clientes usu;
  
    @RequestMapping(value = {"/", "index"})
    public ModelAndView indice1(ModelAndView mod) {
        logger.info("request index");
        mod.addObject("usuario", usu);
        mod.setViewName("index");
        return mod;
    }

    @RequestMapping("user")
    public String privado(Model mod, Principal princ) {

        logger.info("request user");
        usu = logicaService.getUsuarioById(princ.getName());
        mod.addAttribute("usuario", usu);
        return "index";
    }

    @RequestMapping("login")
    public String login(ModelAndView mod) {
        logger.info("request login");
        return "login";
    }


}
