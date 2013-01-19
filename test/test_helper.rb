require 'minitest/spec'
require 'minitest/autorun'
require 'turn/autorun'

begin
  require 'hirb'
  require 'wirble'

  require 'debugger'
rescue LoadError
end

require 'support/colors'
require 'support/output'
require 'support/jams/jams'

require 'jam_script_highlighter'

def h text
  JamScriptHighlighter.highlight text
end

def htmlr text
  JamScriptHighlighter::Html.render text
end

Turn.config do |c|
 # use one of output formats:
 # :outline  - turn's original case/test outline mode [default]
 # :progress - indicates progress with progress bar
 # :dotted   - test/unit's traditional dot-progress mode
 # :pretty   - new pretty reporter
 # :marshal  - dump output as YAML (normal run mode only)
 # :cue      - interactive testing
 c.format  = :cue
 # turn on invoke/execute tracing, enable full backtrace
 c.trace   = true
 # use humanized test names (works only with :outline format)
 c.natural = true
end

