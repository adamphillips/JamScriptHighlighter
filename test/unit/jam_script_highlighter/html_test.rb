require 'test_helper'

describe JamScriptHighlighter::Html do
  describe '.render' do
    describe 'when passed a string' do
      before do
        @jam = ''
      end

      describe 'containing just a title' do
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

          it 'should wrap the metadata in a metadata div' do
            htmlr(@jam).must_match %r{<h2>by Some one</h2>}
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
                htmlr(@jam).must_match %r{<div class="chords">\s*.*C F | G.*\s*<\/div>}
              end

              describe 'containing a structure' do
                before do
                  @jam += "\n# Structure\nVerse, Chorus"
                end

                it 'should contain a h3 with a class of control' do
                  htmlr(@jam).must_match %r{<h3 class="control">Structure</h3>}
                end

                it 'should wrap the structure in a structure div' do
                  htmlr(@jam).must_match %r{<div class="structure">\s*.*Verse, Chorus.*\s*</div>}
                end
              end
            end
          end
        end
      end
    end
  end
end