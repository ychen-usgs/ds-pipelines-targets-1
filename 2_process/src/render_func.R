
library(readr)

render_func <- function (data,out_path) {
  
  dir.create(file.path(out_path), showWarnings = FALSE)
  
  readr::write_csv(data, file = file.path(out_path))
  
  return(out_path)
}

