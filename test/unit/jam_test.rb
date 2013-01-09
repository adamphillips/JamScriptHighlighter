require 'test_helper'

describe  Jam do
  describe '.new' do
    it 'should initialise the Jam with the specified properties' do
      j = Jam.new(:title => 'A funky tune', :composer => 'Me', :tempo => '120', :time_signature => [4, 4])

      j.title.must_equal 'A funky tune'
      j.composer.must_equal 'Me'
      j.tempo.must_equal '120'
      j.time_signature.must_equal [4, 4]
    end
  end

end