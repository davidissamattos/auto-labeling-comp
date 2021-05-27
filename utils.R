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


save_fig <- function(p, name){
  path <- glue::glue('./paper/',name)
  ggsave(filename = path,
         width = 210,
         height = 70,
         units = "mm",
         plot = p,
         device = 'pdf')
}
