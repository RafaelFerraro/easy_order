require 'rubygems'
require 'bundler/setup'
require 'lotus/setup'
require_relative '../lib/easy_order'
require_relative '../apps/web/application'

Lotus::Container.configure do
  mount Web::Application, at: '/'
end
