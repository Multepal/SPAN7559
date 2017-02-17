# Guidelines for Encoding the Popol Vuh

> NOTE: This is a work in progress. 

# Layers of Markup

- Descriptive
- Analytical
- Interpretive

# Texts

| Code   | Text                                                            |
|:-------|:----------------------------------------------------------------|
| `XOM`  | Ximénez's original manuscript (K'iche' and Spanish)             |
| `CLP`  | Christenson's literal-poetic translation (K'iche' and English)  |
| `RST`  | Recinos' Spanish translation                                    |

## XOM

### Document Structure

| Element | Tagname | Values | xml:id     | n          |
|:--------|:--------|:-------|:-----------|:-----------|
| MS      | `div type='ms-vol'`   | xom    | xom        |            |
| folio   | `div type='folio'`  | 01-56  | xom-fXX    | XX         |
| side    | `div type='side'`  | r, v   | xom-fXXS   | XX.f.S     |
| col     | `div type='col'`  | l,r    | xom-fXXSC  | XX.f.S.C   |
| line    | `l`     | 1-n    | xom-fXXSCL | XX.f.S.C.L |

### Sources

### Special Considerations

## CLP

## RST

# Transduction Map

K'iche' source --> Ximénez's transcription --> X --> Separation --> Newberry MS1515 --> Christeson --> OSU

# The TEI Header

