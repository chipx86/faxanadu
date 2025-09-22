ASM6F = asm6f

NES_ROM = faxanadu.nes
BUILD_NES_ROM = build/faxanadu.nes
BUILD_MESEN_FILE = build/faxanadu.mlb

MAIN_SOURCE = src/faxanadu.asm
INCLUDED_SOURCES = \
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
	src/PRG15_MIRROR.asm


all: $(BUILD_NES_ROM)


$(MAIN_SOURCE): $(INCLUDED_SOURCES)
	@touch $(MAIN_SOURCE)


$(BUILD_NES_ROM): $(MAIN_SOURCE)
	@mkdir -p build
	@cd src && $(ASM6F) -m faxanadu.asm "../$(BUILD_NES_ROM)"
	@cp "$(BUILD_MESEN_FILE)" mesen/
	@sha256sum "$(BUILD_NES_ROM)"


clean:
	@rm -f $(BUILD_NES_ROM) $(BUILD_MESEN_FILE)


.PHONY: all clean
