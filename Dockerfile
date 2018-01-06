FROM gcc:7
COPY spectre.c /
WORKDIR /
RUN gcc -std=c99 -O0 spectre.c -o spectre

FROM alpine:3.6
WORKDIR /
COPY --from=0 /spectre .
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2 && chmod +x /spectre
CMD ["/spectre"]
