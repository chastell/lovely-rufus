module LovelyRufus
  module Layers
    class Layer
      def initialize(next_layer = ->(wrap) { wrap })
        @next_layer = next_layer
      end

      def call(_wrap)
        raise 'Layer subclasses must define #call that takes a Wrap'
      end

      private

      attr_reader :next_layer
    end
  end
end
