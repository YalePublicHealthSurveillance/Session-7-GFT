
### SEARCH DATA

cov1   <-    gtrends(keyword=terms1,
                     geo = c("US-MA"),
                     category = 0,  #419=health conditions
                     gprop='web', #web/Youtube/ shopping/news
                     time = "today+5-y" #over what time range?
                     )
cov2   <-    gtrends(keyword=terms1,
                     geo = c("US-FL"),
                     category = 0,  #419=health conditions
                     gprop='web', #web/Youtube/ shopping/news
                     time = "today+5-y" #over what time range?
                     )
cov3   <-    gtrends(keyword=terms2,
                     geo = c("US-MA"),
                     category = 0,  #419=health conditions
                     gprop='web', #web/Youtube/ shopping/news
                     time = "today+5-y" #over what time range?
                     )
cov4   <-    gtrends(keyword=terms2,
                     geo = c("US-FL"),
                     category = 0,  #419=health conditions
                     gprop='web', #web/Youtube/ shopping/news
                     time = "today+5-y" #over what time range?
                     )
all.res1 <- list(cov1,cov2, cov3, cov4)

interest_time <- lapply(all.res1, '[[' ,'interest_over_time')

interest_time <- lapply(interest_time, function(x){
  x$hits <- as.numeric(x$hits)
  x$hits[is.na(x$hits)] <- 0
  return(x)
} )

compiled1 <- do.call('rbind.data.frame',interest_time )

saveRDS(compiled1,'./Data/covid_search_trends_fl_ma.rds')

###CDC COVID DATA

a1 <- read.csv('https://data.cdc.gov/api/views/9mfq-cb36/rows.csv?accessType=DOWNLOAD')

a1 <- a1[a1$state %in% c('MA','FL'),]

a1$date <- as.Date(a1$submission_date, '%m/%d/%Y')

a1$weekdate <- floor_date(a1$date, 'week')

a1 <- a1 %>%
  group_by(state, weekdate) %>%
  summarize('new_case'=sum(new_case))

a1 <- a1[,c('weekdate', 'state','new_case')]

saveRDS(a1, './Data/cdc_covid_data.rds')