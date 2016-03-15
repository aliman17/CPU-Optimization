include Makefile_generic
OBJS   = vector.o comp.o verify.o verfunc.o
TAGGED_FILES = vector.h vector.c \
	comp.h comp.c \
	perf.h perf.c \
	verify.h verify.c \
	timer.h \
    verfunc.c verfunc.h 

all: driver

driver: perf.c $(OBJS) comp.d
	$(CC) $(CFLAGS) -o driver perf.c $(OBJS) $(LIBS)

vector.o: vector.h vector.c
	$(CC) -c $(CFLAGS) -o vector.o vector.c

comp.d: comp.o
	$(OBJDUMP) comp.o > comp.d

comp.o: vector.h comp.h comp.c
	$(CC) -c $(CFLAGS) -o comp.o comp.c

perf.o: perf.h perf.c
	$(CC) -c $(CFLAGS) -o perf.o perf.c

verify.o: verify.h verify.c
	$(CC) -c $(CFLAGS) -o verify.o verify.c

verfunc.o: verfunc.c verfunc.h
	$(CC) -c $(CFLAGS) -o verfunc.o verfunc.c

TAGS:	$(TAGGED_FILES)
	etags -o TAGS $(TAGGED_FILES)

clean:
	-rm $(OBJS) comp.d
	-rm driver

distclean: clean
	-rm main *~

