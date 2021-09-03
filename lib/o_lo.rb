require 'action_controller'
require 'active_record'
require 'action_view'

module Olo
  ActionController::Base.send(:include, Olo) 
  ActiveRecord::Base.send(:include, Olo) 
  ActionView::Base.send(:include, Olo)

  def self.log(thing, decorator="*", decorator_length=100)
    decorator_length = validate_decorator_length(decorator_length)
    decorator = validate_decorator(decorator)
    return if thing.nil?
    3.times { puts "" }
    3.times { puts "#{decorator}" * decorator_length }
    puts ""
    puts thing
    puts ""
    3.times { puts "#{decorator}" * decorator_length }
    3.times { puts "" }
  end

  private

  def self.validate_decorator_length(length)
    length = 0 if length.nil?
    length = 100 if length < 1
    length = 100 if !length.is_a?(Integer)
    length = 200 if length > 200
    length
  end

  def self.validate_decorator(decorator)
    decorator = decorator.to_s if decorator.is_a?(Integer)
    decorator = "*" if !decorator.is_a?(String)
    decorator
  end
end
