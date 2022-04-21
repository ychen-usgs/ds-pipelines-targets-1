
library(targets)

source("1_fetch/src/fetch_func.R")
source("2_process/src/clean_func.R")
source("3_visualize/src/ploting_func.R")
source("2_process/src/render_func.R")
source("2_process/src/diag_func.R")

#tar_option_set(packages = c("tidyverse", "sbtools", "whisker"))

list(
  # Get the data from ScienceBase
  tar_target(
    model_RMSEs_csv,
    fetch_data(download_path = "1_fetch/out/model_RMSEs.csv"),
    format = "file"
  ), 
  # Prepare the data for plotting
  tar_target(
    eval_data,
    clean_func(in_filepath = model_RMSEs_csv)
  ),
  # Create a plot
  tar_target(
    figure_1_png,
    plot_func(out_file_path = "3_visualize/out/figure_1.png", data = eval_data), 
    format = "file"
  ),
  # Save the processed data
  tar_target(
    model_summary_results_csv,
    render_func(data = eval_data, out_path = "2_process/out/model_summary_results.csv"), 
    format = "file"
  ),
  # Save the model diagnostics
  tar_target(
    model_diagnostic_text_txt,
    diag_func(data = eval_data, outpath = "2_process/out/model_diagnostic_text.txt"), 
    format = "file"
  )
)
