require './chip8'

RSpec.describe Chip8 do
  describe "#execute" do
    it "clears when opcode is 00E0" do
      chip8 = Chip8.new
      chip8.execute(0x0, 0xE0)

      expect(chip8.pc).to eq(2)
    end

    it "sets Vx to kk when opcode is 6xkk" do
      tests = [
        { index: 0x0, opcode: 0x60, operand: 0xA },
        { index: 0x1, opcode: 0x61, operand: 0xF },
      ]

      tests.each do |test_case|
        chip8 = Chip8.new
        chip8.execute(test_case[:opcode], test_case[:operand])
        expect(chip8.v[test_case[:index]]).to eq(test_case[:operand])
      end
    end

    it "sets Vx to Vx + kk when opcode is 7xkk" do
      tests = [
        { index: 0x0, opcode: 0x70, operand: 0xA, expected: 0xB },
        { index: 0x1, opcode: 0x71, operand: 0xF, expected: 0x10 },
      ]

      tests.each do |test_case|
        chip8 = Chip8.new
        chip8.v[test_case[:index]] = 0x1
        chip8.execute(test_case[:opcode], test_case[:operand])
        expect(chip8.v[test_case[:index]]).to eq(test_case[:expected])
      end
    end

    it "sets Vx to Vx + kk when opcode is 7xkk" do
      tests = [
        { opcode: 0xA2, operand: 0x2A, expected: 0x22A },
        { opcode: 0xA1, operand: 0xFA, expected: 0x1FA },
      ]

      tests.each do |test_case|
        chip8 = Chip8.new
        chip8.execute(test_case[:opcode], test_case[:operand])
        expect(chip8.i).to eq(test_case[:expected])
      end
    end
  end
end