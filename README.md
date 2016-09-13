# Grafana

## Acknowledgements
This container is based on the existing official [Grafana Docker container](https://github.com/grafana/grafana-docker). This container adds a layer on top of the Grafana container, which takes care of the bootstrapping for datasources and dashboards.

## Description
Self-bootstrapping Grafana instance in a Docker container.

## Setup
The container exposes `/etc/grafana`, where an external volume can be mounted with pre-existing dashboards and datasources to be added to Grafana via API. The external volume must also have a [grafana config file](http://docs.grafana.org/installation/configuration/) present at the root of the mapped volume.

### Dashboards
Iterates over all `.json` files in `/etc/grafana/dashboards/` and posts each via curl with Basic Auth to the grafana API.

The bootstrapping script handles _part_ of the conversion from Grafana 'templates' to what the dashboard API expects. The script wraps the json files provided in `{"overwrite": true, "dasboard": ${JSON} }`, but does not handle dynamic template inputs like templatized datasources.

### Datasources
Iterates over all `.json` files in `/etc/grafana/datasources/` and posts each via curl with Basic Auth to the grafana API.
