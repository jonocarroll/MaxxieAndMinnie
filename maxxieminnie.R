swap <- function(x, y, v) {
  xx <- v[x]
  yy <- v[y]
  v[x] <- yy
  v[y] <- xx
  v
}

chr_swap <- function(x, y, v) {
  paste0(swap(x, y, v), collapse = "")
}

toInt_swap <- function(x, y, v) {
  as.integer(chr_swap(x, y, v))
}

maxmin <- function(num) {
  chars <- strsplit(as.character(num), "")[[1]]
  n <- nchar(num)
  s <- seq_len(n)
  opts <- expand.grid(x = s, y = s)
  opts$v <- list(chars)
  vals <- purrr::pmap_int(opts, toInt_swap)
  vals <- vals[nchar(vals) == n]
  c(max(vals), min(vals))
}

maxmin(213)
maxmin(12345)
maxmin(100)
maxmin(11321)
