
library(readr)

render_func <- function (data,out_path) {
  
  readr::write_csv(data, file = file.path(out_path))
  
  return(out_path)
}

