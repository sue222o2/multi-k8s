docker build -t sue222o2/multi-client:latest -t sue222o2/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t sue222o2/multi-server:latest -t sue222o2/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t sue222o2/multi-worker:latest -t sue222o2/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push sue222/multi-client:latest
docker push sue222/multi-server:latest
docker push sue222/multi-worker:latest
docker push sue222/multi-client:$SHA
docker push sue222/multi-server:$SHA
docker push sue222/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=sue222/multi-server:$SHA
kubectl set image deployments/client-deployment client=sue222/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=sue222/multi-worker:$SHA