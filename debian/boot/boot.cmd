# Print boot source

echo "Boot script loaded from devtype:${devtype} devnum:${devnum} devplist:${devplist}"

imagefile="Image"
setenv bootargs "$bootargs root=/dev/mmcblk${devnum}p${devplist}"
echo bootargs = $bootargs

echo Loading fdt file: ${prefix}hobot/${fdtfile}
ext4load ${devtype} ${devnum}:${devplist} ${fdt_addr_r} ${prefix}hobot/${fdtfile}

echo Loading kernel: ${prefix}${imagefile}
ext4load ${devtype} ${devnum}:${devplist} ${kernel_addr_r} ${prefix}${imagefile}

booti ${kernel_addr_r} - ${fdt_addr_r}

# Recompile with:
# mkimage -C none -A arm -T script -d boot.cmd boot.scr
