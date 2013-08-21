RSpec.configure do |config|
  config.color_enabled = true
  config.add_formatter :documentation
end

require File.dirname(__FILE__) + '/../lib/lolcomposer'