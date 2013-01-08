# MetricsSatellite
MetricsSatellite collects your rails application metrics.  
This gem invokes 5 static metrics tools:

* [Brakeman](https://github.com/presidentbeef/brakeman) - A static analysis security vulnerability scanner for Rails
* [Flay](https://github.com/seattlerb/flay) - Analyzes code for structural similarities
* [Guideline](https://github.com/r7kamura/guideline) - Checks that your code is protecting the rule of coding guideline
* [Hotspots](https://github.com/chiku/hotspots) - Identify frequently modified files in a git repository
* [RailsBestPractices](https://github.com/railsbp/rails_best_practices) - A code metric tool for rails projects

## Requirements
* Ruby >= 1.9

## Installation
```
$ gem install metrics_satellite
```

## Usage
MetricsSatellite has 2 features:

1. Collect today's metrics reports
2. Post today's metrics summary to [GrowthForcast](http://kazeburo.github.com/GrowthForecast/)

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
```

### Collect
Collect today's metrics reports.  
By default, reports are saved in `./reports/` directory.

```
$ metrics_satellite --type collect
```

![](http://dl.dropbox.com/u/5978869/image/20130108_170925.png)

### Post
Post today's metrics summary to your GrowthForecast server(`collect` should be executed before `post`).  
By default, a summary is posted to `http://#{host}/api/metrics/section/#{metrics_type}`.

```
$ metrics_satellite --type post --host growthforecast.example.com
```

![](http://dl.dropbox.com/u/5978869/image/20130108_170744.png)
