SOURCES=changeversion.S ../f002/hookmain.S ../f002/newmenu.S ../f002/removerandomxor.S ../f002/serialdumpmemory.S ../f002/fixknobscaling.S ../f003/unifyboxes.S

FWUTILS=python3 ../../buttshock-et312-firmware/scripts/fw-utils.py

OBJECTS=$(SOURCES:.S=.o)
ASFLAGS=-mmcu=atmega16
LDFLAGS=-mavr5

all: $(SOURCES) f004

f004.fwpatch: f004.elf 
	avr-objdump -D f004.elf > f004.fwpatch

f004: f004.fwpatch
# patch the firmware based on our asm and patches
	$(FWUTILS) -i ../../buttshock-et312-firmware/firmware/312-16-decrypted.bin -o f004.bin -p f004.fwpatch
# add checksum and convert ready to upload
	$(FWUTILS) -i f004.bin -e -o f004.upg

f004.elf: $(OBJECTS)
	avr-ld $(LDFLAGS) -o f004.elf $(OBJECTS)

.S.o:
	avr-as $(ASFLAGS) $< -o $@

clean:
	rm -f f004.bin f004.upg f004.elf *.o
