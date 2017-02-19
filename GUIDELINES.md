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

| Element | Tagname               | Values | xml:id     | n          |
|:--------|:----------------------|:-------|:-----------|:-----------|
| MS      | `div type='ms-vol'`   | xom    | xom        |            |
| folio   | `div type='folio'`    | 01-56  | xom-fXX    | XX         |
| side    | `div type='side'`     | r,v    | xom-fXXS   | XX.f.S     |
| col     | `div type='col'`      | l,r    | xom-fXXSC  | XX.f.S.C   |
| line    | `l`                   | 1-n    | xom-fXXSCL | XX.f.S.C.L |

### Sources
    - `textos/christeson-tanscription.txt`
    - `textos/osu-transcription-cols.txt`
    - `textos/osu-transcription-flat.txt`

### Special Considerations
- Use of special characters
    - The original text uses characters that match these:
        - Latin Capital letter TZ: Ꜩ
        - Latin Capital Letter Open E: Ɛ
    - Should we use them in our transcription?
        - We could add Ꜩ and keep Ɛ
        - Or we could remove Ɛ
- Numbers in Christenson
    - Where do the come from? What do they mean?
    - Should we remove them?
    - Note, they are not found in the OSU version

## CLP

## RST

# Transduction Map

K'iche' source --> Ximénez's transcription --> X --> Separation --> Newberry MS1515 --> Christeson --> OSU

# The TEI Header

