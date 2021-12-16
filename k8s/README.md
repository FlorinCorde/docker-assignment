### Base resources

To create:
```
    kubectl -n cxp-team-y create -f deployment.yaml

    kubectl -n cxp-team-y create -f networkpolicy.yaml
```

To update:
```
    kubectl -n cxp-team-y apply -f networkpolicy.yaml
```

### Advanced
- To generate load:

```ab -c 4 -n 10000 http://localhost:38000/home```

with concurrency=2 and nr of requests=1000

NOTE: install the apache benchmark tool with: ``` sudo apt install apache2-utils```

- To monitor resources of the running docker container:
``` docker stats <conainter id>```

## Install with helm
On the aks cluster:
 ``` helm upgrade y-app --install -n cxp-team-y ./k8s/y-app ```

On the local cluster:
``` helm upgrade y-app --install -n cxp-team-y ./k8s/y-app -f ./k8s/y-app/values-minikube.yaml```

To uninstall:
 ``` helm uninstall y-app -n cxp-team-y  ```
