CLANG ?= clang
KERNEL_HEADERS := /usr/src/linux-headers-$(shell uname -r)

CFLAGS = -O2 -g -Wall -target bpf -D__TARGET_ARCH_x86 \
  -I. \
  -I$(KERNEL_HEADERS)/include \
  -I$(KERNEL_HEADERS)/include/uapi \
  -I$(KERNEL_HEADERS)/include/generated \
  -I$(KERNEL_HEADERS)/arch/x86/include \
  -I$(KERNEL_HEADERS)/arch/x86/include/uapi \
  -I$(KERNEL_HEADERS)/arch/x86/include/generated \
  -I$(KERNEL_HEADERS)/arch/x86/include/generated/uapi \
  -I$(KERNEL_HEADERS)/arch/x86/include/generated/asm \
  -I$(KERNEL_HEADERS)/include/asm-generic

hello.bpf.o: hello.bpf.c
	$(CLANG) $(CFLAGS) -c $< -o $@

clean:
	rm -f *.o
