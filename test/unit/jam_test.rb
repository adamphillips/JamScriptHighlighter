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
        @jam += "A funky tune\n"
      end

      it 'should set the title' do
        Jam.from_string(@jam).title.must_equal 'A funky tune'
      end

      describe 'when there is meta data' do
        it 'should set the meta data' do
          @jam += "by Some Body\n"
          Jam.from_string(@jam).metadata.must_equal({:by => 'Some Body'})
          @jam += "tempo 120bpm\n"
          Jam.from_string(@jam).metadata.must_equal({:by => 'Some Body', :tempo => '120bpm'})
        end
      end
    end
  end

end