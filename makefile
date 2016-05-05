
# this makefile changed to GNU
ifdef SystemRoot
   RM = del /Q
   FixPath = $(subst /,\,$1)
else
   ifeq ($(shell uname), Linux)
      RM = rm -f
      FixPath = $1
   endif
endif

	CC= sdcc
	LD= sdld
	AS= sdas311
	H2B= hex2bin
	WAV= sweep.bin

all: sphlibdemomute.bin


sphlibdemomute.bin: mutedemo.bin spidata.bin
	cat mutedemo.bin  zero64k.bi1 > zz.bin
	head -c 4096 zz.bin > zz.bi1
	cat  zz.bi1  spidata.bin > sphlibdemomute.bin
	del zz.bin 


mutedemo.bin: mutedemo.ihx
	$(H2B) mutedemo.ihx

mutedemo.ihx: mutedemo.rel 
	$(LD) -u -m -i -y mutedemo mutedemo -l ms311sdcc.lib -l ms311sph.lib

mutedemo.rel: mutedemo.asm 
	$(AS) -l -o -s -y mutedemo.asm

mutedemo.asm: mutedemo.c Makefile spidata.h
	$(CC) -pMS311 -OB -OF --debug mutedemo.c

clean:
	$(RM) sphlibdemomute.bin
	$(RM) mutedemo.rel
	$(RM) mutedemo.asm
