require_relative '../spec_helper'

module LovelyRufus describe CLIWrapper do
  describe '#wrap' do
    it 'wraps the passed String to 72 characters by default' do
      short = 'all right: stop, collaborate and listen'
      CLIWrapper.new.wrap(short).must_equal short
      long = short + ' – Ice is back with a brand new invention'
      wrap = short + " – Ice is back with a brand new\ninvention"
      CLIWrapper.new.wrap(long).must_equal wrap
    end

    it 'wraps the passed String to the given number of characters' do
      input = 'something grabs a hold of me tightly; ' +
        'flow like a harpoon – daily and nightly'
      CLIWrapper.new(%w[--width 40]).wrap(input).must_equal(
        "something grabs a hold of me tightly;\n" +
        'flow like a harpoon – daily and nightly')
      CLIWrapper.new(%w[-w21]).wrap(input).must_equal(
        "something grabs a\nhold of me tightly;\n" +
        "flow like a harpoon –\ndaily and nightly")
    end
  end
end end