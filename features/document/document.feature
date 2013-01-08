Feature: Basic Structure
  JamScript is a text-based language for quick music notation.  It is designed to give a quick overview of a song with enough detail for musicians to jam around.  Think Real Book in Markdown.

  Each song has its own file.  The start of the file contains metadata about the file.

  Scenario: A document containing just basic metadata
    Given a file named "sample.jam" with:
      # A sample Jam
      #key E
      #bpm