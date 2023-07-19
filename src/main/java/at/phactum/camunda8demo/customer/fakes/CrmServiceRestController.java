package at.phactum.camunda8demo.customer.fakes;

import at.phactum.camunda8demo.customer.rest.CustomerOnboardingRestController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ServerWebExchange;

@RestController
public class CrmServiceRestController {

    private Logger logger = LoggerFactory.getLogger(CustomerOnboardingRestController.class);

    @PutMapping("/crm/customer")
    public ResponseEntity<String> addCustomerToCrmFake(ServerWebExchange exchange) {
        logger.info("CRM REST API called");
        return ResponseEntity.status(HttpStatus.OK).build();
    }

}
