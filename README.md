# MetricsSatellite
Collect metrics and Report summaries.

## Requirements
* Ruby >= 1.9

## Installation
```
$ git clone git@github.cookpad.com:ryo-nakamura/metrics_satellite.git
$ cd metrics_satellite
$ bundle install
```

## Usage
```
$ ./bin/metrics_satellite
Usage: metrics_satellite [options]
        --type=                      (default:       -) 'collect' or 'post'
        --host=                      (default:       -) GrowthForecast host to send report
        --service=                   (default: metrics) GrowthForecast service name
        --section=                   (default: section) GrowthForecast section name
        --git=                       (default:      ./) git repository directory
        --app=                       (default:      ./) application directory
        --reports=                   (default: reports) collected reports directory

$ ./bin/metrics_satellite --type collect
$ ./bin/metrics_satellite --type post --host growthforecast.example.com
```
