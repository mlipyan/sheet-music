melody = \relative c {
  \clef treble
  \key f \major
  \time 4/4
\autoBeamOn

\once \override Score.BreakAlignment.break-align-orders =
    #(make-vector 3 '(instrument-name
                      left-edge
                      ambitus
                      breathing-sign
                      clef
                      key-signature
                      time-signature
                      staff-bar
                      custos))
  \once \override Staff.TimeSignature.space-alist =
    #'((first-note . (fixed-space . 2.0))
       (right-edge . (extra-space . 0.5))
       ;; free up some space between time signature
       ;; and repeat bar line
       (staff-bar . (extra-space . 1)))
  \bar ".|:"

  bes''4 f8 g8~g2 | a4 e8 d8~d2 | c4 b a8 g8 a4~ | a1 |

 g'4 bes4  d c~| c4 c4 a bes | bes4 a4 e8d8 e4~ | e1 |

 \once \override Score.BreakAlignment.break-align-orders =
    #(make-vector 3 '(instrument-name
                      left-edge
                      ambitus
                      breathing-sign
                      clef
                      key-signature
                      time-signature
                      staff-bar
                      custos))
  \once \override Staff.TimeSignature.space-alist =
    #'((first-note . (fixed-space . 2.0))
       (right-edge . (extra-space . 0.5))
       ;; free up some space between time signature
       ;; and repeat bar line
       (staff-bar . (extra-space . 1)))
  \bar ":|."
 \break
f8 ees8 f4 c2 | bes4 aes4  bes4 g4 | f'8 ees8 f4~f2 |  f1 | \break
d'4 b4 g2 | a4 f4 d2 | c8 e8 g4. \relative c' {c8 d4} | }


text = \lyricmode {
  Aaa Bee Cee Dee
}

harmonies = \chordmode {
  g1:m7 | c1:7 | f:maj7 | f:maj7 | c1:m7 | f:7  | bes:maj7 |  bes:maj7|
  bes:m7| ees:7 | aes:maj7 | aes:maj7 |
  e:m7.5-| a:9- | d:m7
}

\header {
  title = "Gustavo's Lament"
  composer = "Max Lipyanskiy"
  meter  = "Bossa Nova"
}

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \harmonies
    }
    \new Voice = "one" { \autoBeamOff \melody }
    
  >>
  \layout { }
  \midi { }
}
 