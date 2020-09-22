compile_book <- function(){
  bookdown::render_book('index.Rmd', 'all')
  #Creating a file called .nojekyll for github pages
  file.create('./docs/.nojekyll')
}

create_index <- function(x){
  index <- as.integer(as.factor(x))
  return(index)
}

get_index_names_as_array <- function(x){
  arr <- as.array(as.character(levels(as.factor(x))))
  return(arr)
}

print_stan_code <- function(filename)
{
  sourcecode <- paste(readLines(filename), collapse="\n")
  cat(sourcecode)
}


get_HPDI_from_stanfit<- function(stanfit)
{
  require(coda)
  hpdi<-coda::HPDinterval(coda::as.mcmc(as.data.frame(stanfit)))
  estimate<-as.data.frame(summary(stanfit)$summary)$mean
  df<-tibble::rownames_to_column(as.data.frame(hpdi), "Parameter")
  df.hpdi<-mutate(df,
                  Mean=as.data.frame(summary(stanfit)$summary)$mean) %>%
    rename(HPDI.lower=lower, HPDI.higher=upper)
  return(df.hpdi)
}

save_fig <- function(p, name){
  path <- glue::glue('./paper/',name)
  ggsave(filename = path,
         width = 210,
         height = 70,
         units = "mm",
         plot = p,
         device = 'pdf')
}
