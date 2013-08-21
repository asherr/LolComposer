libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require "lolcomposer/version"
require "lolcomposer/champ_builder"
require "lolcomposer/champion"
require "lolcomposer/roster"

module LolComposer

end
