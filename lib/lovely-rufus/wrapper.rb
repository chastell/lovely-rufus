module LovelyRufus class Wrapper
  NBSP = ' '

  def initialize text
    @paras = text.split(/\n[\/#> ]*\n/).map(&:strip)
  end

  def wrapped max_width = 72
    return '' if paras.all?(&:empty?)

    paras.map do |para|
      wrap_para_recursively para, max_width
    end.join "\n\n"
  end

  attr_reader :paras
  private     :paras

  private

  def find_hangout_line lines
    lines.find.with_index do |line, i|
      space = line.rindex(/[ #{NBSP}]/) and i < lines.size - 1 and
      ((i > 0              and space + 1 >= lines[i - 1].size) or
       (i < lines.size - 2 and space + 1 >= lines[i + 1].size) or
       (lines.size == 2    and space + 1 >= lines[i + 1].size))
    end
  end

  def remove_hangouts para, width
    lines = para.split "\n"
    if hangout_line = find_hangout_line(lines)
      hangout_line << NBSP
      fixed = lines.join(' ').gsub "#{NBSP} ", NBSP
      para.replace wrap_para_to_width fixed, width
    end
  end

  def wrap_para_recursively para, max_width
    best = wrap_para_to_width para, max_width
    (max_width - 1).downto 1 do |width|
      shorter = wrap_para_to_width para, width
      break if shorter.lines.count           > best.lines.count
      break if shorter.lines.map(&:size).max > best.lines.map(&:size).max
      best = shorter
    end
    best
  end

  def wrap_para_to_width para, width
    quotes = para[/^([\/#> ]*)/]
    leader = quotes.empty? ? '' : quotes.tr(' ', '') + ' '
    width -= leader.size if width > leader.size
    para
      .lines.map { |line| line[quotes.size..-1] }.join  # drop quotes
      .tr("\n", ' ')                                    # unwrap para
      .gsub(/ ([^ ]) /, " \\1#{NBSP}")                  # glue 1-letter words
      .gsub(/(.{1,#{width}})( |$\n?)/, "\\1\n")         # wrap to width
      .tap { |par| remove_hangouts par, width }         # handle hangouts
      .lines.map { |line| line.insert 0, leader }.join  # re-insert leader
      .tr(NBSP, ' ')                                    # drop glue spaces
      .chomp                                            # final touch
  end
end end
