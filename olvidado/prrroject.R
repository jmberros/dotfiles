if (!exists("WORKDIR")) {
  stop("Please define a WORKDIR variable with a relative or absolute path before sourcing this file.")
}

library(glue)

.pj.initialize <- function() {
  message(glue("Initializing project: {WORKDIR}"))
  
  directories_to_create <- c(
    WORKDIR,
    file.path(WORKDIR, "data"),
    file.path(WORKDIR, "results")
  )
  
  for (directory in directories_to_create) {
    if (!file.exists(directory)) {
      dir.create(directory)
      message(glue("Creating: {directory}"))
    } else {
      message(glue("Already exists: {directory}"))
    }
  }
}

.pj.files_in_subdir <- function(subdir_name) {
  subdirectory <- file.path(WORKDIR, subdir_name)
  filelist <- list.files(subdirectory, recursive = T)
  
  message(glue("\n {length(filelist)} files in {subdirectory}:\n\n"))
  return (filelist)
}

.pj.data_files <- function() { .pj.files_in_subdir("data") }
.pj.results_files <- function() { .pj.files_in_subdir("results") }

.pj.file_in_subdir <- function(filename, subdir_name, check = T) {
  filepath <- file.path(WORKDIR, subdir_name, filename)
  if (check && !file.exists(filepath)) {
    stop(glue("'{filepath}' does not exist"))
  }
  return (filepath)
}

.pj.data_file <- function(filename, check = T) {
  .pj.file_in_subdir(filename, "data", check)
}

.pj.results_file <- function(filename, check = F) {
  .pj.file_in_subdir(filename, "results", check)
}

pj <- list(
  initialize = .pj.initialize,
  data_file = .pj.data_file,
  data_files = .pj.data_files,
  results_file = .pj.results_file,
  results_files = .pj.results_files,
  file_in_subdir = .pj.file_in_subdir,
  files_in_subdir = .pj.files_in_subdir
)
message(glue("`pj` (project) object ready to use for project: {WORKDIR}\n\n"))
