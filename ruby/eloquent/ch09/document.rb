# This class must be defined in some previous chapter.
# But for the moment I am simply going with my gut feeling.
class Document
  attr_reader :title, :author, :content

  def initialize(title, author, content)
    @title   = title
    @author  = author
    @content = content
  end

  def words
    content.split
  end

  def word_count
    words.size
  end
end
