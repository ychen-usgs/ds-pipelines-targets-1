
source("2_process/src/fetch_func.R")
source("2_process/src/ploting_func.R")
source("2_process/src/render_func.R")
source("2_process/src/diag_func.R")

# defining variables
download_dir <- '1_fetch/out/'
out_dir <- '2_process/out/'
eval_data <- fetch_data(download_dir)

# rendering outputs
plot_func(eval_data,out_dir)
render_func(eval_data,out_dir)
diag_func(eval_data,out_dir)
