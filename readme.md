### Build and run container
```
docker build -t registry.digitalocean.com/t3w/dcpomatic:latest .
docker run -it --rm registry.digitalocean.com/t3w/dcpomatic:latest
docker push registry.digitalocean.com/t3w/dcpomatic:latest
```