From: Manuel Krause <manuelkrause@netscape.net>
Subject: data-logging with 2.4.22-pre7+ and logging-export compiling fails
Date: Wed, 30 Jul 2003 05:04:08 +0200
Message-ID: <3F2735A8.2090701@netscape.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15110-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hi,

I don't really know what is wrong with the logging-export patch
(ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.22/06-logging-export.diff.gz),
but if I didn't exclude it for compiling the 2.4.22-pre kernels since 
subversion 7 my kernel compile would fail.

As I always compiled reiserfs into kernel I don't really need it but I 
kept this patch in so far. So this only info.

Bye,

  Manuel


P.S.: Oh, yes, cool: My console even has still the failing lines of 
"make bzImage" (already many patchings and compiles later...), just to 
be complete.

[...]
make[1]: Leaving directory `/usr/src/linux/arch/i386/lib'
ld -m elf_i386 -T /usr/src/linux/arch/i386/vmlinux.lds -e stext 
arch/i386/kernel/head.o arch/i386/kernel/init_task.o init/main.o 
init/version.o init/do_mounts.o \
         --start-group \
         arch/i386/kernel/kernel.o arch/i386/mm/mm.o kernel/kernel.o 
mm/mm.o fs/fs.o ipc/ipc.o \
          drivers/char/char.o drivers/block/block.o drivers/misc/misc.o 
drivers/net/net.o drivers/char/drm/drm.o drivers/ide/idedriver.o 
drivers/scsi/scsidrv.o drivers/cdrom/driver.o drivers/pci/driver.o 
drivers/video/video.o drivers/usb/usbdrv.o drivers/media/media.o \
         net/network.o \
         /usr/src/linux/arch/i386/lib/lib.a /usr/src/linux/lib/lib.a 
/usr/src/linux/arch/i386/lib/lib.a \
         --end-group \
         -o vmlinux
mm/mm.o(.kstrtab+0x40): multiple definition of 
`__kstrtab_mark_page_accessed'
kernel/kernel.o(.kstrtab+0xca9): first defined here
mm/mm.o(__ksymtab+0x20): multiple definition of 
`__ksymtab_mark_page_accessed'
kernel/kernel.o(__ksymtab+0x700): first defined here
make: *** [vmlinux] Error 1
firehead:/usr/src/linux #

