#import "lib.typ": *

#show: conf

// ---- Title page ----
// `version` is passed by the release workflow as `--input version=vX.Y.Z`;
// locally it is absent, so only the compile date is shown (matching the
// LaTeX edition's default `\today`, with no version line, outside of a
// tagged release build).
#let version = sys.inputs.at("version", default: "")
#page(numbering: none, footer: none)[
  #set align(center)
  #v(3fr)
  #text(size: 2.4em, weight: "bold")[LAK Precision]
  #v(1.2em)
  #text(size: 1.25em)[Lee Ann Madissoon --- Kaarel Kivisalu]
  #v(1.2em)
  #text(size: 1em)[
    #datetime.today().display("[month repr:long] [day padding:none], [year]")
    #if version != "" [ \ #version]
  ]
  #v(6fr)
]

// ---- Table of contents ----
#outline(title: [Contents], depth: 3)

// ---- Glossary (unnumbered chapter, still listed) ----
#heading(level: 1, numbering: none)[Glossary]
#include "glossary.typ"

// ---- General principles ----
= General principles
#include "general.typ"

// ---- Constructive and competitive bidding ----
= Constructive and competitive bidding

#include "openings.typ"
#include "1c.typ"
#include "1d.typ"
#include "1h.typ"
#include "1s.typ"
#include "1n.typ"
#include "2c.typ"
#include "2d.typ"
#include "2h.typ"
#include "2s.typ"
#include "2n.typ"
#include "3n.typ"
#include "conventions.typ"
#include "slam.typ"

// ---- Defensive bidding ----
= Defensive bidding
#include "defences.typ"

// ---- Carding ----
= Carding
#include "carding.typ"
