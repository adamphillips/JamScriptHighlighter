module Kernel
  # sample jams to use for testing
  def jams
    {
      :single_section => 'A single section jam
by Someone Cool
tempo 130bpm

* Verse
C F | F G
C F | C
',

      :two_sections => 'A jam in two parts
by Someone Cooler
tempo 110bpm

* Verse
C F | F G
C F | C

* Chorus
C | F
',

      :three_sections => 'A jam in three parts
by Someone Else
tempo 50bpm

* Verse
C F | F G
C F | C

* Chorus
C | F

* Bridge
Am | G | F | G
'
    }
  end
end