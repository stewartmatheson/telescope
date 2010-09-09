module PostsHelper
  def highlight_with_raw(input, highlight_word)
    output = raw(input)
    highlight output, highlight_word
  end
end
