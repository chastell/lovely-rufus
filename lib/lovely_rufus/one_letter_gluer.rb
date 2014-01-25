module LovelyRufus class OneLetterGluer < Layer
  def call text: text, width: 72
    pattern = /(?<=\p{space})(&|\p{letter})\p{space}/
    next_layer.call text: text.gsub(pattern, "\\1\\2#{NBSP}"), width: width
  end
end end
