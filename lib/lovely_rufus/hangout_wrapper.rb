module LovelyRufus class HangoutWrapper < Layer
  def call wrap
    @wrap  = wrap
    final  = hangout_line ? rewrapped : wrap.text
    next_layer.call Wrap.new text: final, width: wrap.width
  end

  attr_reader :wrap
  private     :wrap

  private

  def hangout_line
    lines.each_cons 2 do |a, b|
      return a if a[/\p{space}/] and a.rindex(/\p{space}/) >= b.size
      return b if b[/\p{space}/] and b.rindex(/\p{space}/) >= a.size
    end
  end

  def lines
    @lines ||= wrap.text.lines.map(&:chomp)
  end

  def rewrapped
    hangout_line << NBSP
    basic    = BasicWrapper.new
    unfolded = lines.join(' ').gsub("#{NBSP} ", NBSP)
    wrapped  = basic.call(Wrap.new text: unfolded, width: wrap.width).text
    HangoutWrapper.new.call(Wrap.new text: wrapped, width: wrap.width).text
  end
end end
