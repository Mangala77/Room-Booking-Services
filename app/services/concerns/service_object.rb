# frozen_string_literal: true

# Base module for all Service Objects.
# Create Service Objects by including this module into a class and defining a
# #call method.
# @note Service Objects defined this way are designed to hold a single
#   responsibility, and as such, should only contain a single public method:
#   #call
# @see
#   http://rubyblog.pro/2017/05/solid-single-responsibility-principle-by-example
# @see http://brewhouse.io/blog/2014/04/30/gourmet-service-objects.html
# @example A simple service object
#   Class Example::DoSomething
#     include ServiceObject
#
#     def call
#       # Do Something
#     end
#   end
module ServiceObject
  # Hook run when ServiceObject is included in a class. Adds the class methods
  # required for creating a service object to the class of the service object.
  # @param base [*] The service object including this module.
  def self.included(base)
    base.extend ServiceObjectClassMethods
  end

  # Module defining default class methods for Service Objects.
  # @note This module is to be used in ServiceObject only, and not designed to
  #   be included / extended anywhere else.
  module ServiceObjectClassMethods
    # Main entry method to call/execute all Service Objects.
    # @example A standard call to execute a ServiceObject
    #   Example::DoSomething.call a_param: 'EXAMPLE_CONTEXT'
    # @example Executing a Service Object with a block
    #   Example::DoSomething.call(a_param: 'EXAMPLE_CONTEXT') do |arg|
    #     p arg
    #   end
    # @param args [Hash] any arguments a Service Object is expected to handle.
    # @return [*] Each Service Object will return its own value.
    def call(**args)
      if block_given?
        new(args).call(&Proc.new)
      else
        new(args).call
      end
    end
  end

  # Initializer for a new Service Object instantiation.
  # @note not to be called from outside the class, this method is intended for
  #   internal usage only. Service Objects should never be explicitly
  #   instantiated.
  # @param args [Hash] any arguments a Service Object may need
  # @return [void]
  def initialize(**args)
    args.each do |key, value|
      singleton_class.send :attr_reader, key
      singleton_class.send :private, key
      instance_variable_set :"@#{key}", value
    end
  end
end
