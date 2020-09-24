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
  
## Basics


```r
library(readr)
```

Here's some example data, modified from http://www.gapminder.org/data/


```
country,continent,year,lifeExp,pop,gdpPercap       # header/column names, separated by commas
Afghanistan,Asia,1952,28.801,8425333,779.4453145
Afghanistan,Asia,1957,30.332,9240934,820.8530296   # comma-separated values
Afghanistan,Asia,1962,31.997,10267083,853.10071
Afghanistan,Asia,1967,34.02,11537966,836.1971382
Afghanistan,Asia,1972,36.088,13079460,739.9811058
Afghanistan,Asia,1977,38.438,14880372,786.11336
Afghanistan,Asia,1982,39.854,12881816,978.0114388
Afghanistan,Asia,1987,40.822,13867957,852.3959448
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
Afghanistan,Asia,1987,40.822,13867957,852.3959448'

csv_file <- tempfile(fileext = ".csv")      
csv_file # a temporary file path
```

```
## [1] "/tmp/RtmplR4twa/file457f29b87d8e.csv"
```

```r
writeLines(text = csv_text, con = csv_file) # write `csv_text` to `csv_file`
```



```r
read_csv(file = csv_file)
```

```
## Parsed with column specification:
## cols(
##   country = col_character(),
##   continent = col_character(),
##   year = col_double(),
##   lifeExp = col_double(),
##   pop = col_double(),
##   gdpPercap = col_double()
## )
```

```
## # A tibble: 8 x 6
##   country     continent  year lifeExp      pop gdpPercap
##   <chr>       <chr>     <dbl>   <dbl>    <dbl>     <dbl>
## 1 Afghanistan Asia       1952    28.8  8425333      779.
## 2 Afghanistan Asia       1957    30.3  9240934      821.
## 3 Afghanistan Asia       1962    32.0 10267083      853.
## 4 Afghanistan Asia       1967    34.0 11537966      836.
## 5 Afghanistan Asia       1972    36.1 13079460      740.
## 6 Afghanistan Asia       1977    38.4 14880372      786.
## 7 Afghanistan Asia       1982    39.9 12881816      978.
## 8 Afghanistan Asia       1987    40.8 13867957      852.
```



You may encounter Tab-Delimited data where values are separated by `\t` instead of `,`. Instead of `readr::read_csv()`, we can use `readr::read_tsv()`.



```r
tsv_text <- 
'country\tcontinent\tyear\tlifeExp\tpop\tgdpPercap     
Afghanistan\tAsia\t1952\t28.801\t8425333\t779.4453145
Afghanistan\tAsia\t1957\t30.332\t9240934\t820.8530296
Afghanistan\tAsia\t1962\t31.997\t10267083\t853.10071
Afghanistan\tAsia\t1967\t34.02\t11537966\t836.1971382
Afghanistan\tAsia\t1972\t36.088\t13079460\t739.9811058
Afghanistan\tAsia\t1977\t38.438\t14880372\t786.11336
Afghanistan\tAsia\t1982\t39.854\t12881816\t978.0114388
Afghanistan\tAsia\t1987\t40.822\t13867957\t852.3959448'

tsv_file <- tempfile(fileext = ".tsv")
writeLines(text = tsv_text, con = tsv_file)
```


```r
read_tsv(file = tsv_file)
```

```
## Parsed with column specification:
## cols(
##   country = col_character(),
##   continent = col_character(),
##   year = col_double(),
##   lifeExp = col_double(),
##   pop = col_double(),
##   gdpPercap = col_double()
## )
```

```
## # A tibble: 8 x 6
##   country     continent  year lifeExp      pop gdpPercap
##   <chr>       <chr>     <dbl>   <dbl>    <dbl>     <dbl>
## 1 Afghanistan Asia       1952    28.8  8425333      779.
## 2 Afghanistan Asia       1957    30.3  9240934      821.
## 3 Afghanistan Asia       1962    32.0 10267083      853.
## 4 Afghanistan Asia       1967    34.0 11537966      836.
## 5 Afghanistan Asia       1972    36.1 13079460      740.
## 6 Afghanistan Asia       1977    38.4 14880372      786.
## 7 Afghanistan Asia       1982    39.9 12881816      978.
## 8 Afghanistan Asia       1987    40.8 13867957      852.
```




If we find ourselves reading delmited data that uses something other than `\t` or `,` to separate values, we can use `readr::read_delim()`.


```r
pipe_separated_values_text <- 
'country|continent|year|lifeExp|pop|gdpPercap     
Afghanistan|Asia|1952|28.801|8425333|779.4453145
Afghanistan|Asia|1957|30.332|9240934|820.8530296
Afghanistan|Asia|1962|31.997|10267083|853.10071
Afghanistan|Asia|1967|34.02|11537966|836.1971382
Afghanistan|Asia|1972|36.088|13079460|739.9811058
Afghanistan|Asia|1977|38.438|14880372|786.11336
Afghanistan|Asia|1982|39.854|12881816|978.0114388
Afghanistan|Asia|1987|40.822|13867957|852.3959448'

psv_file <- tempfile(fileext = ".tsv")
writeLines(text = pipe_separated_values_text, con = psv_file)
```


```r
read_delim(file = psv_file, delim = "|")
```

```
## Parsed with column specification:
## cols(
##   country = col_character(),
##   continent = col_character(),
##   year = col_double(),
##   lifeExp = col_double(),
##   pop = col_double(),
##   `gdpPercap     ` = col_double()
## )
```

```
## # A tibble: 8 x 6
##   country     continent  year lifeExp      pop `gdpPercap     `
##   <chr>       <chr>     <dbl>   <dbl>    <dbl>            <dbl>
## 1 Afghanistan Asia       1952    28.8  8425333             779.
## 2 Afghanistan Asia       1957    30.3  9240934             821.
## 3 Afghanistan Asia       1962    32.0 10267083             853.
## 4 Afghanistan Asia       1967    34.0 11537966             836.
## 5 Afghanistan Asia       1972    36.1 13079460             740.
## 6 Afghanistan Asia       1977    38.4 14880372             786.
## 7 Afghanistan Asia       1982    39.9 12881816             978.
## 8 Afghanistan Asia       1987    40.8 13867957             852.
```








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


## Common Pitfalls

### Incorrect Column Types


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

We also have `"N/A"` in our `lifeExp` column, forcing R to interpret all `lifeExp` values as `character`s (`<chr>`).


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



## Alternatives

<style type="text/css">
/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}
</style>


<div class="tab">
  <button class="tablinks" 
          onclick="open_context(event, 'Minimalist')" 
          id ="defaultOpen">Minimalist</button>
  <button class="tablinks" 
          onclick="open_context(event, 'Advanced')">Advanced</button>
</div>




<div id="Minimalist" class="tabcontent">


```r
base_r <- read.csv(
  file = csv_file,
  na.strings = c("", "N/A")
)

base_r
```

```
##       country continent year lifeExp      pop gdpPercap
## 1 Afghanistan      Asia 1952  28.801  8425333  779.4453
## 2 Afghanistan      Asia 1957  30.332  9240934  820.8530
## 3 Afghanistan      Asia 1962  31.997 10267083  853.1007
## 4 Afghanistan      Asia 1967  34.020 11537966  836.1971
## 5 Afghanistan      Asia 1972  36.088 13079460  739.9811
## 6 Afghanistan      Asia 1977  38.438 14880372  786.1134
## 7 Afghanistan      Asia 1982  39.854 12881816  978.0114
## 8 Afghanistan      Asia 1987  40.822 13867957  852.3959
## 9 Afghanistan      <NA>   NA      NA       NA        NA
```

```r
str(base_r)
```

```
## 'data.frame':	9 obs. of  6 variables:
##  $ country  : chr  "Afghanistan" "Afghanistan" "Afghanistan" "Afghanistan" ...
##  $ continent: chr  "Asia" "Asia" "Asia" "Asia" ...
##  $ year     : int  1952 1957 1962 1967 1972 1977 1982 1987 NA
##  $ lifeExp  : num  28.8 30.3 32 34 36.1 ...
##  $ pop      : int  8425333 9240934 10267083 11537966 13079460 14880372 12881816 13867957 NA
##  $ gdpPercap: num  779 821 853 836 740 ...
```

```r
base_r <- read.csv(
  file = csv_file,
  colClasses = c(
    country = "character",
    continent = "character",
    year = "integer",
    lifeExp = "double",
    pop = "double",
    gdpPercap = "double"
  ),
  na.strings = c("", "N/A")
)

base_r
```

```
##       country continent year lifeExp      pop gdpPercap
## 1 Afghanistan      Asia 1952  28.801  8425333  779.4453
## 2 Afghanistan      Asia 1957  30.332  9240934  820.8530
## 3 Afghanistan      Asia 1962  31.997 10267083  853.1007
## 4 Afghanistan      Asia 1967  34.020 11537966  836.1971
## 5 Afghanistan      Asia 1972  36.088 13079460  739.9811
## 6 Afghanistan      Asia 1977  38.438 14880372  786.1134
## 7 Afghanistan      Asia 1982  39.854 12881816  978.0114
## 8 Afghanistan      Asia 1987  40.822 13867957  852.3959
## 9 Afghanistan      <NA>   NA      NA       NA        NA
```

```r
str(base_r)
```

```
## 'data.frame':	9 obs. of  6 variables:
##  $ country  : chr  "Afghanistan" "Afghanistan" "Afghanistan" "Afghanistan" ...
##  $ continent: chr  "Asia" "Asia" "Asia" "Asia" ...
##  $ year     : int  1952 1957 1962 1967 1972 1977 1982 1987 NA
##  $ lifeExp  : num  28.8 30.3 32 34 36.1 ...
##  $ pop      : num  8425333 9240934 10267083 11537966 13079460 ...
##  $ gdpPercap: num  779 821 853 836 740 ...
```

</div>




<div id="Advanced" class="tabcontent">


```r
options(datatable.print.class = TRUE)

data.table::fread(
  file = csv_file,
  na.strings = c("", "N/A")
)
```

```
##        country continent  year lifeExp      pop gdpPercap
##         <char>    <char> <int>   <num>    <int>     <num>
## 1: Afghanistan      Asia  1952  28.801  8425333  779.4453
## 2: Afghanistan      Asia  1957  30.332  9240934  820.8530
## 3: Afghanistan      Asia  1962  31.997 10267083  853.1007
## 4: Afghanistan      Asia  1967  34.020 11537966  836.1971
## 5: Afghanistan      Asia  1972  36.088 13079460  739.9811
## 6: Afghanistan      Asia  1977  38.438 14880372  786.1134
## 7: Afghanistan      Asia  1982  39.854 12881816  978.0114
## 8: Afghanistan      Asia  1987  40.822 13867957  852.3959
## 9: Afghanistan      <NA>    NA      NA       NA        NA
```

</div>




<script>
function open_context(evt, context) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(context).style.display = "block";
  evt.currentTarget.className += " active";
}

document.getElementById("defaultOpen").click();
</script>





