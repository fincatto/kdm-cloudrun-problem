# Repository purpose

Repository to demonstrate the problem when running the container that only happens on Google Cloud Run.

## Build and run container
```
docker build -t dcpomatic:latest .
docker run -it --rm dcpomatic:latest
```

### Push container
```
docker push registry.digitalocean.com/t3w/dcpomatic:latest
```
