# drone-sonar-qualitygate-plugin

The plugin of Drone CI to integrate the response of the SonarScanner against SonarQube (previously called Sonar), which is an open source code quality management platform.

Detail tutorials: [DOCS.md](DOCS.md).

## Build process

build go binary file

```commandline
go mod vendor
GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -a -o drone-sonar-qualitygate
```

build docker image
`docker build -t dxas90/drone-sonar-qualitygate-plugin .`

## Testing the docker image

after you run the `sonar-scanner` command

```commandline
docker run --rm \
  -e SONAR_TOKEN=60878847cea1a31d817f0deee3daa7868c431433 \
  dxas90/drone-sonar-qualitygate-plugin
```

## Pipeline example

```yaml
steps
- name: code-analysis
  image: aosapps/drone-sonar-plugin
  settings:
      sonar_host:
        from_secret: sonar_host
      sonar_token:
        from_secret: sonar_token

- name: code-analysis-result
  image: dxas90/drone-sonar-qualitygate-plugin
  settings:
      sonar_token:
        from_secret: sonar_token
```
