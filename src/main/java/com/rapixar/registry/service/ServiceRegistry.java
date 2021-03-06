package com.rapixar.registry.service;

import com.rapixar.registry.database.DBClient;
import com.rapixar.registry.models.Registration;
import com.rapixar.registry.models.ServiceNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ServiceRegistry {
    private final DBClient dbClient;

    @Autowired
    public ServiceRegistry(final DBClient dbClient) {
        this.dbClient = dbClient;
    }

    @GetMapping("/getNodes")
    public List<ServiceNode> getHandlers(@RequestParam final String methodName) {
        return dbClient.getServiceNodes(methodName).join();
    }

    @PutMapping("/node")
    public void addNode(@RequestBody final ServiceNode serviceNode) {
        dbClient.addNode(serviceNode);
    }

    @PostMapping("/service/register")
    public void register(@RequestBody final Registration registration) {
        dbClient.register(registration.getServiceName(), registration.getMethodNames());
    }

    @DeleteMapping("/node")
    public void deleteNode(@RequestParam final String id) {
        dbClient.removeNode(id);
    }
}
