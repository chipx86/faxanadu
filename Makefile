CA65 = ca65
LD65 = ld65

NES_ROM = faxanadu.nes
BUILD_NES_ROM = build/faxanadu.nes
BUILD_MESEN_FILE = build/faxanadu.mlb

MAIN_SOURCE = src/faxanadu.asm
INCLUDED_SOURCES = \
	src/APU_IO.asm \
	src/DEFS.asm \
	src/PPU.asm \
	src/RAM.asm \
	src/PRG0.asm \
	src/PRG1.asm \
	src/PRG2.asm \
	src/PRG3.asm \
	src/PRG4.asm \
	src/PRG5.asm \
	src/PRG6.asm \
	src/PRG7.asm \
	src/PRG8.asm \
	src/PRG9.asm \
	src/PRG10.asm \
	src/PRG11.asm \
	src/PRG12.asm \
	src/PRG13.asm \
	src/PRG14.asm \
	src/PRG15_MIRROR.asm \
	src/ZEROPAGE.asm

DELETE_SOURCES = \
	html/PRG0_MIRROR.html \
	html/PRG1_MIRROR.html \
	html/PRG2_MIRROR.html \
	html/PRG3_MIRROR.html \
	html/PRG4_MIRROR.html \
	html/PRG5_MIRROR.html \
	html/PRG6_MIRROR.html \
	html/PRG7_MIRROR.html \
	html/PRG8_MIRROR.html \
	html/PRG9_MIRROR.html \
	html/PRG10_MIRROR.html \
	html/PRG11_MIRROR.html \
	html/PRG12_MIRROR.html \
	html/PRG13_MIRROR.html \
	html/PRG14_MIRROR.html \
	html/PRG15.html \
	html/SRAM.html \
	html/PPU_MIRROR_1.html \
	html/PPU_MIRROR_2.html \
	html/PPU_MIRROR_3.html \
	html/PPU_MIRROR_4.html \
	html/PPU_MIRROR_5.html \
	html/PPU_MIRROR_6.html \
	html/PPU_MIRROR_7.html \
	html/PPU_MIRROR_8.html \
	html/PPU_MIRROR_9.html \
	html/PPU_MIRROR_10.html \
	html/RAM_MIRROR_1.html \
	html/RAM_MIRROR_2.html \
	html/RAM_MIRROR_3.html \
	src/PRG0_MIRROR.asm \
	src/PRG1_MIRROR.asm \
	src/PRG2_MIRROR.asm \
	src/PRG3_MIRROR.asm \
	src/PRG4_MIRROR.asm \
	src/PRG5_MIRROR.asm \
	src/PRG6_MIRROR.asm \
	src/PRG7_MIRROR.asm \
	src/PRG8_MIRROR.asm \
	src/PRG9_MIRROR.asm \
	src/PRG10_MIRROR.asm \
	src/PRG11_MIRROR.asm \
	src/PRG12_MIRROR.asm \
	src/PRG13_MIRROR.asm \
	src/PRG14_MIRROR.asm \
	src/PRG15.asm \
	src/SRAM.asm \
	src/PPU_MIRROR_1.asm \
	src/PPU_MIRROR_2.asm \
	src/PPU_MIRROR_3.asm \
	src/PPU_MIRROR_4.asm \
	src/PPU_MIRROR_5.asm \
	src/PPU_MIRROR_6.asm \
	src/PPU_MIRROR_7.asm \
	src/PPU_MIRROR_8.asm \
	src/PPU_MIRROR_9.asm \
	src/PPU_MIRROR_10.asm \
	src/RAM_MIRROR_1.asm \
	src/RAM_MIRROR_2.asm \
	src/RAM_MIRROR_3.asm


all: cleanup_generated $(BUILD_NES_ROM)


$(MAIN_SOURCE): $(INCLUDED_SOURCES)
	@touch $(MAIN_SOURCE)


./build/faxanadu.o: ./src/faxanadu.asm
	@mkdir -p build
	@$(CA65) $< -o $@


$(BUILD_NES_ROM): ./build/faxanadu.o ./src/ld65.cfg
	@$(LD65) -o "$(BUILD_NES_ROM)" -C src/ld65.cfg ./build/faxanadu.o
	@cp "$(BUILD_MESEN_FILE)" mesen/
	@sha256sum "$(BUILD_NES_ROM)"


cleanup_generated:
	@rm -f ${DELETE_SOURCES}


clean:
	@rm -f $(BUILD_NES_ROM) $(BUILD_MESEN_FILE)


.PHONY: all clean cleanup_generated
