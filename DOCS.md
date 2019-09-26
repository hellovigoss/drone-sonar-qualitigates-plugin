---
date: 2019-02-12T10:50:00+00:00
title: SonarQube QualityGate
author: dxas90
tags: [ Sonar, SonarQube, Analysis, QualityGate, report ]
logo: sonarqube.svg
repo: dxas90/drone-sonar-qualitygate-plugin
image: dxas90/drone-sonar-qualitygate-plugin
---

This plugin can wait for the result of the scan of your code from the analysis report in your SonarQube server. SonarQube (previously called Sonar), is an open source code quality management platform.

The below pipeline configuration demonstrates simple usage:

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

# Secret Reference

Safety first, the host and token are stored in Drone Secrets.

* `sonar_token`: User token used to post the analysis report to SonarQube Server. Click User -- My Account -- Security -- Generate Tokens.

# Notes

* this plugin it is a complement to `aosapps/drone-sonar-plugin` for the quality gate response
* it read the `.scannerwork/report-task.txt` for the settings of the report

Code repository: [dxas90/drone-sonar-qualitygate-plugin](https://github.com/dxas90/drone-sonar-qualitygate-plugin).  
SonarQube Parameters: [Analysis Parameters](https://docs.sonarqube.org/display/SONAR/Analysis+Parameters)
