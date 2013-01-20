JamScript Highligher
--------------------

[![Build Status](https://travis-ci.org/adamphillips/JamScriptHighlighter.png?branch=master)](undefined)

SyntaxHighlighter for [JamScript](https://github.com/adamphillips/JamScript)

## Installing

Requires
- Ruby 1.9.2 or higher
- [wkhtmltopdf](https://github.com/pdfkit/pdfkit/wiki/Installing-WKHTMLTOPDF) for PDF conversion.

At the command line type 

    gem install jam_script_highlighter

if you are planning to use the highlighter in a Ruby application and you are using Bundler, add the following to your Gemfile

    gem 'jam_script_highlighter'

then at the command line run

    bundle install

## Highlighting a JamScript

To use the highlighter in Ruby, you must first require jam_script_highlighter

    require 'jam_script_highlighter'

Then in order to highlight some JamScript, call the JamScriptHighlighter.highlight method passing it the JamScript as a string.  It will return an array of hashes, 1 for each line of the document.  The hash will contain the line of JamScript and its type.  The type will be one of the following

- :title , The title line of the document. Always the first line
- :metadata, Document metadata such as composer or tempo
- :control, A control line such as # Structure, # Chords, # Beats
- :section, A section of the song such as * Verse, * Chorus
- :note, A note (textual not musical) about the section
- :other, Usually data such as chords or beats

For example

    require 'jam_script_highlighter'

    jam1 = "A Funky Tune
    by Someone Cool
    tempo 123bpm

    * Verse
    C F | G G

    * Chorus
    F | C :x4

    # Structure
    Verse, Verse, Chorus
    Verse, Verse, Chorus
    Chorus
    "

    puts JamScriptHighlighter.highlight(jam1).inspect
    # => [{:type=>:title, :line=>"A Funky Tune"},
    # {:type=>:metadata, :line=>"by Someone Cool"},
    # {:type=>:metadata, :line=>"tempo 123bpm"},
    # {:type=>:section, :line=>"Verse"},
    # {:type=>:other, :line=>"C F | G G"},
    # {:type=>:section, :line=>"Chorus"},
    # {:type=>:other, :line=>"F | C :x4"},
    # {:type=>:control, :line=>"Structure"},
    # {:type=>:other, :line=>"Verse, Verse, Chorus"},
    # {:type=>:other, :line=>"Verse, Verse, Chorus"},
    # {:type=>:other, :line=>"Chorus"}]

## Converting to HTML

To convert a JamScript document to html, at the command line type

    jam_as_html path/to/jam

The html will be output to /path/to/jam.html
You can use wildcards

    jam_as_html folder/of/jams/*.jam

This will convert each file that matches the path

## Converting to a PDF

This requires that [wkhtmltopdf](https://github.com/pdfkit/pdfkit/wiki/Installing-WKHTMLTOPDF) is installed.

To convert a JamScript document to a pdf, at the command line type

    jam_as_pdf path/to/jam

The html will be output to /path/to/jam.pdf
You can use wildcards

    jam_as_pdf folder/of/jams/*.jam

This will convert each file that matches the path



