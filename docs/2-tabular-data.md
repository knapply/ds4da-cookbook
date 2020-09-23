---
output: html_document
editor_options: 
  chunk_output_type: console
---

# Tabular Data {#tabular-data}

- Aliases: 
  + Tabular files
  + Flat
  + Delimited
- Includes:
  + Comma-Separated Value (.csv)
  + Tab-Separated Value (.tsv)

## Example Data

Modified from http://www.gapminder.org/data/

```
country,continent,year,lifeExp,pop,gdpPercap       # header/column names
Afghanistan,Asia,1952,28.801,8425333,779.4453145
Afghanistan,Asia,1957,30.332,9240934,820.8530296
Afghanistan,Asia,1962,31.997,10267083,853.10071
Afghanistan,Asia,1967,34.02,11537966,836.1971382
Afghanistan,Asia,1972,36.088,13079460,739.9811058
Afghanistan,Asia,1977,38.438,14880372,786.11336
Afghanistan,Asia,1982,39.854,12881816,978.0114388
Afghanistan,Asia,1987,40.822,13867957,852.3959448
Afghanistan,,,N/A,,                                # notice that we're missing values
```


```r
csv_text <- 
'country,continent,year,lifeExp,pop,gdpPercap
Afghanistan,Asia,1952,28.801,8425333,779.4453145
Afghanistan,Asia,1957,30.332,9240934,820.8530296
Afghanistan,Asia,1962,31.997,10267083,853.10071
Afghanistan,Asia,1967,34.02,11537966,836.1971382
Afghanistan,Asia,1972,36.088,13079460,739.9811058
Afghanistan,Asia,1977,38.438,14880372,786.11336
Afghanistan,Asia,1982,39.854,12881816,978.0114388
Afghanistan,Asia,1987,40.822,13867957,852.3959448
Afghanistan,,,N/A,,'

csv_file <- tempfile(fileext = ".csv")
writeLines(text = csv_text, con = csv_file)
```


## Input: Reading Data


```r
library(readr)
```


### Default


```r
data_frame_from_csv <- read_csv(file = csv_file)
```

```
## Parsed with column specification:
## cols(
##   country = col_character(),
##   continent = col_character(),
##   year = col_double(),
##   lifeExp = col_character(),
##   pop = col_double(),
##   gdpPercap = col_double()
## )
```

```r
data_frame_from_csv
```

```
## # A tibble: 9 x 6
##   country     continent  year lifeExp      pop gdpPercap
##   <chr>       <chr>     <dbl> <chr>      <dbl>     <dbl>
## 1 Afghanistan Asia       1952 28.801   8425333      779.
## 2 Afghanistan Asia       1957 30.332   9240934      821.
## 3 Afghanistan Asia       1962 31.997  10267083      853.
## 4 Afghanistan Asia       1967 34.02   11537966      836.
## 5 Afghanistan Asia       1972 36.088  13079460      740.
## 6 Afghanistan Asia       1977 38.438  14880372      786.
## 7 Afghanistan Asia       1982 39.854  12881816      978.
## 8 Afghanistan Asia       1987 40.822  13867957      852.
## 9 Afghanistan <NA>         NA N/A           NA       NA
```

#### Diagnose Problems

Notice that our `year` column says `<dbl>`, referring to it being of type `double`, yet all of our `year` values are whole numbers.


```r
typeof(data_frame_from_csv$year)
```

```
## [1] "double"
```

```r
data_frame_from_csv$year
```

```
## [1] 1952 1957 1962 1967 1972 1977 1982 1987   NA
```

We also hanve `"N/A"` in our `lifeExp` column, forcing R to interpret all `lifeExp` values as `character`s (`<chr>`).


```r
typeof(data_frame_from_csv$lifeExp)
```

```
## [1] "character"
```

```r
data_frame_from_csv$lifeExp
```

```
## [1] "28.801" "30.332" "31.997" "34.02"  "36.088" "38.438" "39.854" "40.822"
## [9] "N/A"
```

#### Solution


```r
read_csv(
  file = csv_file,
  col_types = cols(
    country = col_character(),
    continent = col_character(),
    year = col_integer(),        # read `year` as `integer`
    lifeExp = col_double(),      # read `lifeExp` as `double`
    pop = col_double(),
    gdpPercap = col_double()
  ),
  na = c("", "N/A")              # be explicit about how `csv_file` represents missing values
)
```

```
## # A tibble: 9 x 6
##   country     continent  year lifeExp      pop gdpPercap
##   <chr>       <chr>     <int>   <dbl>    <dbl>     <dbl>
## 1 Afghanistan Asia       1952    28.8  8425333      779.
## 2 Afghanistan Asia       1957    30.3  9240934      821.
## 3 Afghanistan Asia       1962    32.0 10267083      853.
## 4 Afghanistan Asia       1967    34.0 11537966      836.
## 5 Afghanistan Asia       1972    36.1 13079460      740.
## 6 Afghanistan Asia       1977    38.4 14880372      786.
## 7 Afghanistan Asia       1982    39.9 12881816      978.
## 8 Afghanistan Asia       1987    40.8 13867957      852.
## 9 Afghanistan <NA>         NA    NA         NA       NA
```


