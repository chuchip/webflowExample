package profesorp.webflow.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableLoadTimeWeaving;

/**
 *
 * @author chuchip
 */
@Configuration
@EnableLoadTimeWeaving
@ComponentScan(basePackages={"profesorp.webflow"})
public class RootConfig 
{
 
}
