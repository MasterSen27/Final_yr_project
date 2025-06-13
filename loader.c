// loader.c
#include <bpf/libbpf.h>
#include <stdio.h>
#include <unistd.h>

int main() {
    struct bpf_object *obj;
    int err;

    err = bpf_prog_load("hello.bpf.o", BPF_PROG_TYPE_TRACEPOINT, &obj, NULL);
    if (err) {
        fprintf(stderr, "Error loading BPF program: %d\n", err);
        return 1;
    }

    printf("Program loaded. Run `sudo cat /sys/kernel/debug/tracing/trace_pipe` in another terminal to see the output.\n");
    while (1) sleep(1);
    return 0;
}
