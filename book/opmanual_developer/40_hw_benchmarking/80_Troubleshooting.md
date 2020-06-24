# Troubleshooting {#sec:hw_benchmark_troubleshooting level=sec status=ready}

Troubleshooting section

<minitoc/>

## Init_sd_card
Should an error like the one below appear:
``` shell
subprocess.CalledProcessError: Command '['sudo', 'e2fsck', '-f', '/dev/sdb2']' returned non-zero exit status 8.
```
use 

    laptop $ sudo fdisk /dev/![device]

to delete all partitions on the device. (`d` to delete, `w` to write) **Make sure to edit the correct device, otherwise data will be lost!** 
## Render Apriltags
If your map is rendered really tiny. You probably entered the measurements of the april tags in another unit than meters.