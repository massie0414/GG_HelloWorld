CC = wla-z80
CFLAGS = -i -o
LD = wlalink
LDFLAGS = -v -S -A

SFILES = HelloGameGear.asm
IFILES = FontData.inc
OFILES = HelloGameGear.o
OUT = HelloWorld.gg

all: $(OFILES) $(IFILES) makefile
	echo [objects] > linkfile
	echo $(OFILES) >> linkfile
	$(LD) $(LDFLAGS) linkfile $(OUT)

%.o: %.asm
	$(CC) $(CFLAGS) $@ $<

clean:
	rm -f $(OFILES) core *~ *.sym linkfile $(OUT)
