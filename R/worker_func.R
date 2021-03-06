#' Set query threshold
#' 
#' Depreciated. This function will be remove in the next version.
#' 
#' @param worker a jieba worker
#' @param number the query threshold
#' @export
query_threshold = function(worker, number){
  warning("This function is depreciated, and will be removed in the next version due to the upstream apis changes.")
  stopifnot(inherits(worker,"jieba"))
  set_query_threshold(number,worker$worker)
  worker$max_word_length = number
}

#' Add user word
#' 
#' @param worker a jieba worker
#' @param words the new words
#' @param tags the new words tags, default "n"
#' @examples
#' cc = worker()
#' new_user_word(cc, "test")
#' new_user_word(cc, "do", "v")
#' @export
new_user_word = function(worker, words, tags = rep("n", length(words))){
  stopifnot(inherits(worker,"jieba"), length(words) == length(tags), is.character(words), is.character(tags))
  if (.Platform$OS.type == "windows") {
    words <- enc2utf8(words)
    tags <- enc2utf8(tags)
  }
  add_user_word(words,tags,worker$worker)
}
#' Get text location
#' 
#' Depreciated. This function will be remove in the next version.
#' 
#' @param words a string
#' @return a list with words, start position, and end position
#' @export
#' @examples 
#' \dontrun{
#' words_locate(c("this","is","a", "test"))
#' }
#' 
#' 
words_locate = function(words){
  warning("This function is depreciated, and will be removed in the next version due to the upstream apis changes.")
  if (.Platform$OS.type == "windows") {
    words <- enc2utf8(words)
  }
  res = get_loc(words)
  if (.Platform$OS.type == "windows") {
    Encoding(res[[1]]) = "UTF-8"
  }
  res
}
