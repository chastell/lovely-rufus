module LovelyRufus class TextWrapper
  def self.wrap text, width: 72
    new(Wrap[text, width: width]).call
  end

  def initialize wrap
    @wrap = wrap
  end

  def call
    wrap_to wrap.width
  end

  attr_reader :wrap
  private     :wrap

  private

  def chain
    chain = [QuoteStripper, OneLetterGluer, BasicWrapper, HangoutWrapper]
    chain.reverse.reduce(-> wrap { wrap }) { |inner, outer| outer.new inner }
  end

  def paras
    @paras ||= wrap.text.split(/\n#{QUOTES}?\n/).reject do |para|
      para[/^#{QUOTES}?$/]
    end
  end

  def wrap_to size
    paras.map do |para|
      chain.call(Wrap[para, width: size]).text.tr NBSP, ' '
    end.join "\n"
  end
end end
