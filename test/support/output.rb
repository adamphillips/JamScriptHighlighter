require 'hirb'

# Output functions
# =================
# Functions to format and display output

# Writes content out to the terminal
# Use Hirb to format tables.
# Can specify a color using one of the defined color constants
#
# Examples
#
#   out 'some_text', :blue  # Prints out the text in blue
#
def out(text, text_color=nil, *opts)
  extend Hirb::Console
  #text = text.to_a if text.kind_of? ActiveRecord::Base

  if text.kind_of? Array
    STDOUT.puts start_color text_color if text_color
    table text, *opts
    STDOUT.puts reset_color if text_color
  else
    text = color(text.inspect, text_color) if text_color

    STDOUT.puts "\n\n#{text}"
  end
end

# Puts out an error.
# The error is written to STDERR and colored in the error color.
def err(message, backtrace=nil)
  STDERR.puts color(message, error_color)
  backtrace.each {|line| line_color = (line[0..1] == '/') ? backtrace_local_color : backtrace_gem_color; STDERR.puts color(line, line_color)} unless backtrace.nil? || backtrace.empty?
end