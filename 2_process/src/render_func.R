
library(readr)

render_func <- function (data,out_dir) {
  
  readr::write_csv(data, file = file.path(out_dir, 'model_summary_results.csv'))
  
}

