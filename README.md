# Chip-8

This project is a [Chip-8](http://www.cs.columbia.edu/~sedwards/classes/2016/4840-spring/designs/Chip8.pdf) implementation in Ruby.

### Opcodes [(reference)](http://devernay.free.fr/hacks/chip8/C8TECH10.HTM):

- 00E0: CLS `[Implemented]`

    Clear the display.

- 00EE: RET
- 0nnn: SYS addr
- 1nnn: JP addr `[Implemented]`

    Jump to location nnn.

- 2nnn: CALL addr
- 3xkk: SE Vx, byte
- 4xkk: SNE Vx, byte
- 5xy0: SE Vx, Vy
- 6xkk: LD Vx, byte `[Implemented]`

    The interpreter puts the value kk into register Vx.

- 7xkk: ADD Vx, byte `[Implemented]`

    Set Vx = Vx + kk.

- 8xy0: LD Vx, Vy
- 8xy1: OR Vx, Vy
- 8xy2: AND Vx, Vy
- 8xy3: XOR Vx, Vy
- 8xy4: ADD Vx, Vy
- 8xy5: SUB Vx, Vy
- 8xy6: SHR Vx {, Vy}
- 8xy7: SUBN Vx, Vy
- 8xyE: SHL Vx {, Vy}
- 9xy0: SNE Vx, Vy
- Annn: LD I, addr `[Implemented]`

    The value of register I is set to nnn.

- Bnnn: JP V0, addr
- Cxkk: RND Vx, byte
- Dxyn: DRW Vx, Vy, nibble `[WIP]`

    Display n-byte sprite starting at memory location I at (Vx, Vy), set VF = collision.

- Ex9E: SKP Vx
- ExA1: SKNP Vx
- Fx07: LD Vx, DT
- Fx0A: LD Vx, K
- Fx15: LD DT, Vx
- Fx18: LD ST, Vx
- Fx1E: ADD I, Vx
- Fx29: LD F, Vx
- Fx33: LD B, Vx
- Fx55: LD [I], Vx
- Fx65: LD Vx, [I]

## Commands

- Running

```
make run
```

- Testing

```
make test
```
