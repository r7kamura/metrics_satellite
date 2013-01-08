# MetricsSatellite
Metrics collector of Rails application.

## Requirements
* Ruby >= 1.9

## Installation
```
gem install metrics_satellite
```

## Usage
```
$ metrics_satellite
Usage: metrics_satellite [options]
        --type=                      (default:       -) 'collect' or 'post'
        --host=                      (default:       -) GrowthForecast host to send report
        --service=                   (default: metrics) GrowthForecast service name
        --section=                   (default: section) GrowthForecast section name
        --git=                       (default:      ./) git repository directory
        --app=                       (default:      ./) application directory
        --reports=                   (default: reports) collected reports directory
        --guideline-abc-complexity=  (default:      15) threshold of ABC complexity
        --guideline-long-line=       (default:      80) threshold of long line
        --guideline-long-method=     (default:      10) threshold of long method
        --hotspots-cutoff=           (default:      10) threshold of change count
        --hotspots-time=             (default:      14) time span of git log target
        --no-brakeman                (default:   false) disable Brakeman
        --no-flay                    (default:   false) disable Flay
        --no-guideline               (default:   false) disable Guideline
        --no-hotspots                (default:   false) disable Hotspots
        --no-rails-best-practices    (default:   false) disable RailsBestPractices

$ metrics_satellite --type collect
$ metrics_satellite --type post --host growthforecast.example.com
```
