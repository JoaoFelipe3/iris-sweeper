# Experimental!
I ~ "git: github.com/Marcos-cat/iris"

# State 0 is undiscovered, 1 is discovered, 2 is flagged.
# Mine count of -1 is death!!!!!
┌─╴Tile
  ~[State MineCount]
  
  GetTextureNum ← ⨬(
    10
  | ◿10-1MineCount
  | 11
  )⊸State
└─╴

GenBoard ← (
  ↯⊟.16 0
  ⍥₄₀(
    ⍜⊡⋅1 ⍢⋅(⊟∩⚂₁₆)(
      ∨∨⊃⊃𝄐≍⊡(/×⊡ ▽×⊸⤚⊃(≡/×≥0|≡/×<¤△:) +⊂A₂C₂¤)
    ) ⊟∩⚂₁₆
  )
  ⊙◌
  ⍉Tile⊸×₀⍥⋅¯1⟜(↘¯⟜↘⋯3⬚0⧈(/+♭)3_3)
)

┌─╴Game
  ~{Board NoClick State}
  
  New ← °⊸Board↯16_16_2 0 °⊸NoClick1{0 0 0}
  
  Discover ← |2 (
    ≠1Tile~State◡(⊡⊙Board)
    ⨬⋅∘(
      ⍥(⊙□₃𝄐⟜⊓GenBoard⋅0 ⊙°□₃) NoClick,
      ⟜⍜(Tile~State⊡⊙Board)⋅1
      Tile~MineCount◡(⊡⊙Board)
      ⍣(∧Discover ▽×◡⊃(≡/×≥0|≡/×<¤↙₂△Board:) +⊂A₂C₂¤ °0
      | ⍜Board≡₂(⍥⍜Tile~State⋅1=¯1⊸Tile~MineCount) ⍜State⋅¯1 ◌°¯1
      | ⋅⋅∘)
    )
  )
  Flag ← ⍜(Tile~State⊡⊙Board|⍥⍜÷₂¬≠1.)
  
  CheckWin ← ⍜⊙State⊙◌ /×♭≡₂(∨⊃(=1Tile~State|=¯1Tile~MineCount))⊸Board
  
  Draw ← (
    ⟜(⇡↙2△) Board
    ≡₂(
      ⊟⌊⊃÷◿4Tile~GetTextureNum
      ⍜⊢⇌∩(⊟:⊟.16)⊙⍜⊣+₃₀∩×₁₆
      I~Texture~Map ⊙⊙⊃⊃0_0 0 °◌
    )
  )
└─╴

PixelToTile ← ⌊÷16⊟⊙-₃₀°ℂ

Text ← map 0_1_¯1 {"16x16, 40 mines" "You win!" "You lose..."}

I~Open 256_286 "Minesweeper"

Game~New

⬚(I~Texture~Load "assets/tiles.png")I~Loop!(
  I~Draw~Background↯3 0.5
  I~Draw~Text White 30 0_0 get⊙Text⊸Game~State
  ⍥(
    Game~CheckWin
    Mouse!Pressed‼Left(⍥Game~Discover/×≥0.PixelToTile)
    Mouse!Pressed‼Right(⍥Game~Flag/×≥0.PixelToTile)
  )=0⊸Game~State
  ⊸Game~Draw
)
