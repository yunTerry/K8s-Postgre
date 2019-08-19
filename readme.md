
## Delpoy PostgreSQL on Kubernetes

```yaml
# 创建PersistentVolume
kubectl apply -f pg-volume.yml

# 部署PostgreSQL
kubectl apply -f pg-statefulset.yml

# 创建service
kubectl apply -f pg-service.yml
```

## 查看应用部署情况

```sh
# 查看PersistentVolumeClaim
$ kubectl get pvc
NAME           STATUS   VOLUME        CAPACITY   ACCESS MODES   STORAGECLASS   AGE
postgres-pvc   Bound    postgres-pv   1Gi        RWX            standard       32m

# 查看Pod和Service
$ kubectl get po,svc -o wide
NAME             READY   STATUS    RESTARTS   AGE   IP            NODE         NOMINATED NODE   READINESS GATES
pod/postgres-0   1/1     Running   0          28m   10.244.1.53   k8s-node-1   <none>           <none>
pod/postgres-1   1/1     Running   1          28m   10.244.1.54   k8s-node-1   <none>           <none>

NAME                 TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE    SELECTOR
service/postgres     ClusterIP   10.111.235.207   <none>        5432/TCP   28m    service=postgres

```
