---
output: html_document
editor_options: 
  chunk_output_type: console
---
# I/O {#foundation-io}


## Input: Reading Data


```r
csv_file_path <- "https://gist.githubusercontent.com/knapply/12d519be8fab627007d0ce46e1b12d8c/raw/0fe9b9ff2bd5698508c4ea9705ec2d02338ab064/mcc-mnc.csv"
```

### Base


```r
base_read_csv <- read.csv(file = csv_file_path)

head(base_read_csv)
```

```
##   MCC MNC ISO     Country Country.Code                   Network
## 1 289  88  ge    Abkhazia            7                  A-Mobile
## 2 289  68  ge    Abkhazia            7                  A-Mobile
## 3 289  67  ge    Abkhazia            7                   Aquafon
## 4 412  88  af Afghanistan           93 Afghan Telecom Corp. (AT)
## 5 412  80  af Afghanistan           93 Afghan Telecom Corp. (AT)
## 6 412   1  af Afghanistan           93      Afghan Wireless/AWCC
```

### Tidy



```r
tidy_read_csv <- readr::read_csv(file = csv_file_path)
```

```
## Parsed with column specification:
## cols(
##   MCC = col_double(),
##   MNC = col_double(),
##   ISO = col_character(),
##   Country = col_character(),
##   `Country Code` = col_double(),
##   Network = col_character()
## )
```

```r
tidy_read_csv
```

```
## # A tibble: 1,690 x 6
##      MCC   MNC ISO   Country     `Country Code` Network                  
##    <dbl> <dbl> <chr> <chr>                <dbl> <chr>                    
##  1   289    88 ge    Abkhazia                 7 A-Mobile                 
##  2   289    68 ge    Abkhazia                 7 A-Mobile                 
##  3   289    67 ge    Abkhazia                 7 Aquafon                  
##  4   412    88 af    Afghanistan             93 Afghan Telecom Corp. (AT)
##  5   412    80 af    Afghanistan             93 Afghan Telecom Corp. (AT)
##  6   412     1 af    Afghanistan             93 Afghan Wireless/AWCC     
##  7   412    40 af    Afghanistan             93 Areeba/MTN               
##  8   412    50 af    Afghanistan             93 Etisalat                 
##  9   412    30 af    Afghanistan             93 Etisalat                 
## 10   412    20 af    Afghanistan             93 Roshan/TDCA              
## # … with 1,680 more rows
```


### `{data.table}`


```r
dt_read_csv <- data.table::fread(input = csv_file_path)

dt_read_csv
```

```
##       MCC MNC ISO     Country Country Code                   Network
##    1: 289  88  ge    Abkhazia            7                  A-Mobile
##    2: 289  68  ge    Abkhazia            7                  A-Mobile
##    3: 289  67  ge    Abkhazia            7                   Aquafon
##    4: 412  88  af Afghanistan           93 Afghan Telecom Corp. (AT)
##    5: 412  80  af Afghanistan           93 Afghan Telecom Corp. (AT)
##   ---                                                               
## 1686: 645   2  zm      Zambia          260               MTN/Telecel
## 1687: 645   1  zm      Zambia          260        Airtel/Zain/Celtel
## 1688: 648   4  zw    Zimbabwe          263                    Econet
## 1689: 648   1  zw    Zimbabwe          263                   Net One
## 1690: 648   3  zw    Zimbabwe          263                   Telecel
```

