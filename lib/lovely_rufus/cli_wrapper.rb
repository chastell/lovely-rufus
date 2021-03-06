require_relative 'settings'
require_relative 'text_wrapper'

module LovelyRufus
  class CLIWrapper
    def initialize(args = ARGV, text_wrapper: TextWrapper)
      @settings     = Settings.new(args)
      @text_wrapper = text_wrapper
    end

    def run(stream = $stdin)
      puts text_wrapper.wrap(stream.read, width: settings.width)
    end

    private

    attr_reader :settings, :text_wrapper
  end
end
