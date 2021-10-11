class Chip8
  attr_accessor :pc, :memory, :v, :i

  def initialize
    @pc = 0x0
    @memory = []
    @v = [0x0] * 0x10 # 16 8-bit registers (V0 to VF)
    @i = 0x0
  end

  def run(file_path)
    load_rom(file_path)
    while true do
      execute(@memory[@pc], @memory[@pc+1])
      sleep(1)
    end
  end

  def load_rom(file_path)
    raw_content = File.open(file_path, 'rb') { |f| f.read }
    raw_content.each_byte { |b| @memory.append(b) }
  end

  def execute(opcode, operand)
    if opcode == 0x0 && operand == 0xE0
      # 00E0 - CLS: Clear the display.
      clear
      increment_pc
    elsif opcode >> 0x4 == 0x6
      # 6xkk - The interpreter puts the value kk into register Vx.
      @v[opcode & 0xF] = operand
      increment_pc
    elsif opcode >> 0x4 == 0x7
      # 7xkk - Set Vx = Vx + kk
      @v[opcode & 0xF] = @v[opcode & 0xF] + operand
      increment_pc
    elsif opcode >> 0x4 == 0xA
      # Annn - The value of register I is set to nnn.
      @i = (((opcode & 0xF) << 0x8) + operand)
      increment_pc
    elsif opcode >> 0x4 == 0xD
      puts "TODO - hardcore"
      ### TODO
      # Dxyn - Display n-byte sprite starting at memory location I at (Vx, Vy), set VF = collision.
      increment_pc
    else
      puts "#{hex(opcode)} #{hex(operand)}"
      debug(opcode, operand)
      increment_pc
    end
  end
  
  def clear
  end
  
  def increment_pc
    @pc += 2
  end

  def debug(opcode, operand)
    puts "Debug for: #{hex(opcode)} #{hex(operand)}"
    puts "i = #{@i.to_s(16)}"
    puts "v = #{@v.collect { |i| i.to_s(16) }}"
    puts "memory = #{@memory.collect { |i| i.to_s(16) }}"
  end

  def bin(n)
    n.to_s(2)
  end

  def hex(n)
    n.to_s(16)
  end
end