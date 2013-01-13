require 'test_helper'

describe  Jam do
  describe '.new' do
    it 'should initialise the Jam with the specified properties' do
      j = Jam.new(:title => 'A funky tune', :metadata => {:by => 'Me', :tempo => '120', :time_signature => [4, 4]})

      j.title.must_equal 'A funky tune'
      j.metadata[:by].must_equal 'Me'
      j.metadata[:tempo].must_equal '120'
      j.metadata[:time_signature].must_equal [4, 4]
    end
  end

  describe '.from_string' do
    before { @jam = '' }

    describe 'when there is a title' do
      before do
        @jam += "A funky tune"
      end

      it 'should set the title' do
        Jam.from_string(@jam).title.must_equal 'A funky tune'
      end

      describe 'when there is meta data' do
        it 'should set the meta data' do
          @jam += "\nby Some Body"
          Jam.from_string(@jam).metadata.must_equal({:by => 'Some Body'})
          @jam += "\ntempo 120bpm"
          Jam.from_string(@jam).metadata.must_equal({:by => 'Some Body', :tempo => '120bpm'})
        end
      end

      describe 'when there is a section defined' do
        before do
          @jam += "\n* Verse\nC F | G G7 \nC F | G C"
        end

        it 'should parse the section' do
          jam = Jam.from_string(@jam)
          verse = jam.sections['Verse']
          verse.must_be_kind_of Section
          verse.bars.length.must_equal 4
          verse.bars[0].chords[0].note.must_equal 'C'
          verse.bars[1].chords[1].note.must_equal 'G'
        end
      end
    end
  end

end