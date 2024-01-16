# OS Test

Reference: [https://wiki.osdev.org/Bare_Bones](https://wiki.osdev.org/Bare_Bones)

*Building the build environment*

``` sh
docker build -t ostest .
```

*Building the OS*

``` sh
./run
```

*Running the OS*

``` sh
qemu-system-i386 -kernel build-bin/myos.bin
```

*Formatting an ISO*

``` sh
cp build-bin/myos.bin osdir/boot
grub-mkrescue -o myos.iso osdir
```
