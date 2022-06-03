require 'capybara/dsl'

class Elemental
  include Capybara::DSL

  ACCEPTED_METHODS = [:link, :button, :field].freeze

  class << self
    def method_missing(method, *args, &block)
      if ACCEPTED_METHODS.include?(method)
        method_name = "#{args.first}_#{method}".to_sym
        capybara_call = "find_#{method}".to_sym
        element_selector = args[1]
        options = args[2]

        if element_selector.is_a?(Proc)
          define_method args.first.to_sym do |a|
            element_selector.call(a)
          end

          define_method method_name do |a|
            if options.nil?
              public_send(capybara_call, element_selector.call(a))
            else
              public_send(capybara_call, element_selector.call(a), options)
            end
          end
        else
          define_method args.first.to_sym do
            element_selector
          end

          define_method method_name do
            if options.nil?
              public_send(capybara_call, element_selector)
            else
              public_send(capybara_call, element_selector, options)
            end
          end
        end
      else
        super
      end
    end

    def elements(name, selector, **args)
      define_method "#{name}_elements" do
        all selector, **args
      end
    end

    def element(name, selector, **args)
      if selector.is_a?(Proc)
        define_method name do |param|
          selector.call(param)
        end

        define_method "#{name}_element" do |param, **options|
          find(selector.call(param), **args, **options)
        end
      else
        define_method name do
          selector
        end

        define_method "#{name}_element" do |**options|
          find selector, **args, **options
        end
      end
    end

    def respond_to_missing?(method, include_private = false)
      ACCEPTED_METHODS.include?(method) || super
    end
  end
end
