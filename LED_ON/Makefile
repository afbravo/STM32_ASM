# Tools used for compiling, linking and flashing
AS = arm-none-eabi-as
LD = arm-none-eabi-ld
OC = openocd
OBJCOPY = arm-none-eabi-objcopy

# Flags for compiling, linking and flashing
ASFLAGS = -g 
LDFLAGS = -T
LINKER = $(IDIR)/stm32f446re.ld
OCFLAGS = -c "program $(ELF) verify reset exit"
OBJCOPYFLAGS = -O binary

# PROGRAMMER
PROGRAMMER = interface/stlink-v2.cfg

# Files names
SRC = $(wildcard *.s) $(wildcard $(IDIR)/*.s)
OBJ = $(patsubst %.s, $(ODIR)/%.o, $(notdir $(SRC)))
ELF = $(ODIR)/main.elf
BIN = $(ODIR)/main.bin

# Output Directory
ODIR = build
IDIR = inc
$(shell mkdir -p $(ODIR))

vpath %.s .:$(IDIR)

all: $(OBJ) $(ELF) $(BIN)
$(ODIR)/%.o: %.s
	@ $(AS) $(ASFLAGS) $< -o $@
$(ELF): $(OBJ)
	@ $(LD) $(LDFLAGS) $(LINKER) $^ -o $@
$(BIN): $(ELF)
	@ $(OBJCOPY) $(OBJCOPYFLAGS) $< $@

flash:
	@ $(OC) -f $(PROGRAMMER) $(OCFLAGS)
clean:
	@ rm -rf $(ODIR)