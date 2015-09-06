$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'amazon_pa_api'

Dir['spec/support/**/*.rb'].each { |f| require File.expand_path(f) }
