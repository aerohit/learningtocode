# This class must be defined in some previous chapter.
# But for the moment I am simply going with my gut feeling.
class Document
  attr_reader :content

  def initialize(some_variable, some_other_variable, content)
    @content = content
  end

  def words
    content.split
  end

  def word_count
    words.size
  end
end
