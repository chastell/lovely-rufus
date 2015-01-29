class Class
  private

  def private_attr_reader(*attrs)
    attr_reader(*attrs)
    private(*attrs)
  end
end

module LovelyRufus
  NBSP = "\u00A0"

  def self.wrap(text, text_wrapper: TextWrapper, width: 72)
    text_wrapper.wrap(text, width: width)
  end
end

require_relative 'lovely_rufus/cli_wrapper'
require_relative 'lovely_rufus/text_wrapper'
