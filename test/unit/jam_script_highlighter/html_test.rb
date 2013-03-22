require 'test_helper'

describe JamScriptHighlighter::Html do
  describe '.render' do
    describe 'when passed a string' do
      before do
        @jam = ''
      end

      describe 'containing a title' do
        before do
          @jam += "Some jam\n"
        end

        it 'should be wrapped in title tags' do
          htmlr(@jam).must_match %r{<h1>Some jam</h1>}
        end

        describe 'containing metadata' do
          before do
            @jam += "by Some one\n"
          end

          it 'should wrap the metadata in a metadata h2' do
            htmlr(@jam).must_match %r{<h2 class="metadata">by Some one</h2>}
          end

          describe 'containing a section' do
            before do
              @jam += "\n* Verse\n"
            end

            it 'should contain a h4 with class of section' do
              htmlr(@jam).must_match %r{<h4 class="section">Verse</h4>}
            end

            describe 'containing chords' do
              before do
                @jam += "C F | G\n"
              end

              it 'should wrap the chords in a containing div' do
                htmlr(@jam).must_match %r{<div class="chords">\nC F | G\n</div>}
              end

              it 'should not include an uneccessary closing div' do
                htmlr(@jam).wont_match %r{</div>\n</div>}
              end

              describe 'containing a structure' do
                before do
                  @jam += "\n# Structure\nVerse, Chorus"
                end

                it 'should contain a h3 with a class of control' do
                  htmlr(@jam).must_match %r{<h3 class="control">Structure</h3>}
                end

                it 'should wrap the structure in a structure div' do
                  htmlr(@jam).must_match %r{<div class="structure">\nVerse, Chorus\n</div>}
                end
              end
            end
          end
        end
      end
    end
  end
end