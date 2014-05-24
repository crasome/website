module UiInteractions
  class ContextDelegator < SimpleDelegator

    def initialize(context, **attributes)
      super context
      @attributes = attributes
    end

    def method_missing(method, *args, &block)
      return attributes[method] if attributes.has_key? method
      super
    end

    private
    attr_reader :attributes

    def context
      __getobj__
    end
  end
end
