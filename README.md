# Personal dotfiles

## Docker image

Build with:

```
docker build --rm -t siu/devenv --build-arg username=dev .
```

Run with:

```
docker run --rm -it siu/devenv
```

Run with 'developer' volume:

```
docker run --rm -it -v `pwd`:/developer siu:devenv
```

Snapshot work

While a docker image is running, do:

```
docker image ls
```

Create snapshot:

```
docker commit 0bd100ca0f8a siu:devenv-python
```

Run:

```
docker run --rm -it siu:devenv-python
```
