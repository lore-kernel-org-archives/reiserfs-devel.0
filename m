From: Tuomas Jormola <tjormola@cc.hut.fi>
Subject: Re: LVM array, one disk failed
Date: 06 Jan 2003 20:33:45 +0200
Message-ID: <1041878024.6748.22.camel@ganga>
References: <1041044851.5964.32.camel@ganga>
	 <20021228113942.A6599@namesys.com> <1041545041.13918.7.camel@ganga>
	 <20030106100157.A1881@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-Kb6h1Cu7ycg/eBSKnb+D"
Return-path: <reiserfs-list-return-12287-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030106100157.A1881@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com


--=-Kb6h1Cu7ycg/eBSKnb+D
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2003-01-06 at 09:01, Oleg Drokin wrote:
> Hello!
> 
> On Fri, Jan 03, 2003 at 12:04:01AM +0200, Tuomas Jormola wrote:
> 
> > > If you do not plan to add anymore drives or if you just don't have
> > > spare drive, you probably can run reiserfsck --rebuild-sb and after
> > > couple of questions it will write updated superblock that
> > > respects changed filesystem size (actually for this to work you first need
> > > to tell your LVM to report current volume size that is now shorter
> > > than it was at creation time).
> > reiserfsck says
> > Reiserfs with standard journal found, but there was specified a journal dev
> > I guess guess it's bad thing :/
> 
> Try with reiserfsprogs-3.6.5-pre1
Thanks for the tip and it indeed works better than 3.6.4. But now it
exists with return value 8 and message "Operation not permitted" while
executing write() inside bwrite() of lib/io.c. Isn't it odd that
lseek64() before that is OK but write fails? And yes, it's run as root.
I've attached strace and ltrace logs of the reiserfsck session, perhaps
they tell you something.

BR,
-- 
Tuomas Jormola <tjormola@cc.hut.fi>

--=-Kb6h1Cu7ycg/eBSKnb+D
Content-Disposition: attachment; filename=fsck-troubles-ltrace
Content-Type: text/plain; name=fsck-troubles-ltrace; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

__libc_start_main(0x0804b1f4, 3, 0xbffffb04, 0x08048f44, 0x08074720 <unfinished ...>
__register_frame_info(0x080856a4, 0x080858d8, 0xbffffaa8, 0x40048f18, 0x40134e48) = 0x08048fec
getenv("COLUMNS")                                 = NULL
malloc(104)                                       = 0x0808aae8
memcpy(0x0808aae8, "_mem_begin_", 12)             = 0x0808aae8
memset(0x0808aaf8, '\000', 80)                    = 0x0808aaf8
memset(0x0808aaf8, '\000', 80)                    = 0x0808aaf8
setrlimit(1, 0xbffffa94, 80, 0x08085780, 0x40134e48) = 0
malloc(200)                                       = 0x0808ab58
memcpy(0x0808ab58, "_mem_begin_", 12)             = 0x0808ab58
memset(0x0808ab68, '\000', 176)                   = 0x0808ab68
getopt_long(3, 0xbffffb04, "iql:nb:Szd:R:h:j:gafVrpyt:", 0x08085434, 0xbffffa58) = 0
getopt_long(3, 0xbffffb04, "iql:nb:Szd:R:h:j:gafVrpyt:", 0x08085434, 0xbffffa58) = -1
fprintf(0x40132380, "\n<-------------%s, 2002--------"..., "reiserfsck"
<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.5-pre1

) = 72
register_printf_function(75, 0x0806b870, 0x0806b76c, 3, 0x40067558) = 0
register_printf_function(107, 0x0806b8d4, 0x0806b76c, 0x0806bc95, 75) = 0
register_printf_function(72, 0x0806b95c, 0x0806b788, 3, 0x40067558) = 0
register_printf_function(98, 0x0806b7f8, 0x0806b750, 0x0806bcc0, 72) = 0
register_printf_function(121, 0x0806ba40, 0x0806b7a4, 3, 0x40067558) = 0
register_printf_function(77, 0x0806bb74, 0x0806b7c0, 0x0806bceb, 121) = 0
register_printf_function(85, 0x0806bbf4, 0x0806b7dc, 3, 0x40067558) = 0
vfprintf(0x40132380, "  ******************************"..., 0xbffffa4c  *************************************************************
  ** If you are using the latest reiserfsprogs and  it fails **
  ** please  email bug reports to reiserfs-list@namesys.com, **
  ** providing  as  much  information  as  possible --  your **
  ** hardware,  kernel,  patches,  settings,  all  reiserfsk **
  ** messages  (including version),  the reiserfsck logfile, **
  ** check  the  syslog file  for  any  related information. **
  ** If you would like advice on using this program, support **
  ** is available  for $25 at  www.namesys.com/support.html. **
  *************************************************************

) = 641
vfprintf(0x40132380, "Will check superblock and rebuil"..., 0xbffffa4cWill check superblock and rebuild it if needed
) = 47
vfprintf(0x40132380, "Will put log info to '%s'\n", 0xbffffa4cWill put log info to 'stdout'
) = 30
fprintf(0x40132380, "%s", "\nDo you want to run this program"...
Do you want to run this program?[N/Yes] (note need to type Yes if you do):) = 75
__getdelim(0xbffffa28, 0xbffffa24, 10, 0x40132080, 0x40132380) = 4
strcmp("Yes\n", "Yes\n")                          = 0
open("/dev/evms/lvm/d/d", 32768, 027777775154)    = 3
malloc(92)                                        = 0x0808aca8
memcpy(0x0808aca8, "_mem_begin_", 12)             = 0x0808aca8
memset(0x0808acb8, '\000', 68)                    = 0x0808acb8
asprintf(0x0808acc4, 0x08082160, 0xbffffc10, 0x0806f4da, 68) = 17
malloc(548)                                       = 0x0808ad88
memcpy(0x0808ad88, "_mem_begin_", 12)             = 0x0808ad88
memset(0x0808ad98, '\000', 524)                   = 0x0808ad98
malloc(4120)                                      = 0x0808afb0
memcpy(0x0808afb0, "_mem_begin_", 12)             = 0x0808afb0
memset(0x0808afc0, '\000', 4096)                  = 0x0808afc0
malloc(4120)                                      = 0x0808bfd0
memcpy(0x0808bfd0, "_mem_begin_", 12)             = 0x0808bfd0
memset(0x0808bfe0, '\000', 4096)                  = 0x0808bfe0
malloc(4120)                                      = 0x0808cff0
memcpy(0x0808cff0, "_mem_begin_", 12)             = 0x0808cff0
memset(0x0808d000, '\000', 4096)                  = 0x0808d000
malloc(4120)                                      = 0x0808e010
memcpy(0x0808e010, "_mem_begin_", 12)             = 0x0808e010
memset(0x0808e020, '\000', 4096)                  = 0x0808e020
malloc(4120)                                      = 0x0808f030
memcpy(0x0808f030, "_mem_begin_", 12)             = 0x0808f030
memset(0x0808f040, '\000', 4096)                  = 0x0808f040
malloc(4120)                                      = 0x08090050
memcpy(0x08090050, "_mem_begin_", 12)             = 0x08090050
memset(0x08090060, '\000', 4096)                  = 0x08090060
malloc(4120)                                      = 0x08091070
memcpy(0x08091070, "_mem_begin_", 12)             = 0x08091070
memset(0x08091080, '\000', 4096)                  = 0x08091080
malloc(4120)                                      = 0x08092090
memcpy(0x08092090, "_mem_begin_", 12)             = 0x08092090
memset(0x080920a0, '\000', 4096)                  = 0x080920a0
malloc(4120)                                      = 0x080930b0
memcpy(0x080930b0, "_mem_begin_", 12)             = 0x080930b0
memset(0x080930c0, '\000', 4096)                  = 0x080930c0
malloc(4120)                                      = 0x080940d0
memcpy(0x080940d0, "_mem_begin_", 12)             = 0x080940d0
memset(0x080940e0, '\000', 4096)                  = 0x080940e0
memset(0x080940e0, '\000', 4096)                  = 0x080940e0
lseek64(3, 8192, 0, 0, 0x0808af6c)                = 8192
read(3, "", 4096)                                 = 4096
strncmp("", "ReIsErFs", 8)                        = -82
strncmp("", "ReIsEr2Fs", 9)                       = -82
strncmp("", "ReIsEr3Fs", 9)                       = -82
memset(0x080930c0, '\000', 4096)                  = 0x080930c0
lseek64(3, 65536, 0, 0, 0x0808af38)               = 65536
read(3, "EOFS\217\001K\2220", 4096)               = 4096
strncmp("ReIsEr2Fs", "ReIsErFs", 8)               = -20
strncmp("ReIsEr2Fs", "ReIsEr2Fs", 9)              = 0
strncmp("ReIsEr2Fs", "ReIsErFs", 8)               = -20
strncmp("ReIsEr2Fs", "ReIsEr3Fs", 9)              = -1
strncmp("ReIsEr2Fs", "ReIsEr2Fs", 9)              = 0
malloc(228)                                       = 0x080950f0
memcpy(0x080950f0, "_mem_begin_", 12)             = 0x080950f0
memset(0x08095100, '\000', 204)                   = 0x08095100
close(3)                                          = 0
open("/dev/evms/lvm/d/d", 32770, 0140)            = 3
open64(0xbffffc10, 0, 204, 0x0808ad19, 0x0808ab68) = 4
ioctl(4, -2147216782, 0xbffff9a4)                 = 0
strncmp("ReIsEr2Fs", "ReIsEr2Fs", 9)              = 0
printf("\nDid you use resizer(y/n)[n]: ")         = 30
__getdelim(0xbffffa10, 0xbffffa0c, 10, 0x40132080, 0x0808ab68) = 2
vfprintf(0x40132200, "rebuild-sb: wrong block count oc"..., 0xbffff9bc) = 67
strncmp("ReIsEr2Fs", "ReIsErFs", 8)               = -20
strncmp("ReIsEr2Fs", "ReIsEr3Fs", 9)              = -1
strncmp("ReIsEr2Fs", "ReIsEr2Fs", 9)              = 0
strncmp("ReIsEr2Fs", "ReIsErFs", 8)               = -20
strncmp("ReIsEr2Fs", "ReIsEr3Fs", 9)              = -1
strncmp("ReIsEr2Fs", "ReIsEr2Fs", 9)              = 0
memcpy(0x080930c0, "", 204)                       = 0x080930c0
free(0x080950f0)                                  = <void>
strncmp("ReIsEr2Fs", "ReIsErFs", 8)               = -20
strncmp("ReIsEr2Fs", "ReIsEr2Fs", 9)              = 0
vfprintf(0x40132380, "Reiserfs super block in block %l"..., 0xbffff91cReiserfs super block in block 16 on 0x7507 of ) = 46
strncmp("ReIsEr2Fs", "ReIsErFs", 8)               = -20
strncmp("ReIsEr2Fs", "ReIsEr3Fs", 9)              = -1
strncmp("ReIsEr2Fs", "ReIsEr2Fs", 9)              = 0
vfprintf(0x40132380, "format 3.6 with ", 0xbffff93cformat 3.6 with ) = 16
strncmp("ReIsEr2Fs", "ReIsEr3Fs", 9)              = -1
vfprintf(0x40132380, "standard journal\n", 0xbffff93cstandard journal
) = 17
vfprintf(0x40132380, "Count of blocks on the device: %"..., 0xbffff93cCount of blocks on the device: 26170368
) = 40
vfprintf(0x40132380, "Number of bitmaps: %u\n", 0xbffff92cNumber of bitmaps: 799
) = 23
vfprintf(0x40132380, "Blocksize: %d\n", 0xbffff93cBlocksize: 4096
) = 16
vfprintf(0x40132380, "Free blocks (count of blocks - u"..., 0xbffff92cFree blocks (count of blocks - used [journal, bitmaps, data, reserved] blocks): 3183179
) = 88
vfprintf(0x40132380, "Root block: %u\n", 0xbffff93cRoot block: 27459
) = 18
vfprintf(0x40132380, "Filesystem is %scleanly umounted"..., 0xbffff93cFilesystem is NOT cleanly umounted
) = 35
vfprintf(0x40132380, "Tree height: %d\n", 0xbffff93cTree height: 5
) = 15
vfprintf(0x40132380, "Hash function used to sort names"..., 0xbffff91cHash function used to sort names: "r5"
) = 39
vfprintf(0x40132380, "Objectid map size %d, max %d\n", 0xbffff93cObjectid map size 24, max 972
) = 30
vfprintf(0x40132380, "Journal parameters:\n", 0xbffff92cJournal parameters:
) = 20
vfprintf(0x40132380, "\tDevice [0x%x]\n", 0xbffff90c	Device [0x0]
) = 14
vfprintf(0x40132380, "\tMagic [0x%x]\n", 0xbffff8fc	Magic [0x57728bc3]
) = 20
vfprintf(0x40132380, "\tSize %u blocks (including 1 for"..., 0xbffff90c	Size 8193 blocks (including 1 for journal header) (first block 18)
) = 68
vfprintf(0x40132380, "\tMax transaction length %u block"..., 0xbffff8fc	Max transaction length 1024 blocks
) = 36
vfprintf(0x40132380, "\tMax batch size %u blocks\n", 0xbffff90c	Max batch size 900 blocks
) = 27
vfprintf(0x40132380, "\tMax commit age %u\n", 0xbffff8fc	Max commit age 30
) = 19
vfprintf(0x40132380, "Blocks reserved by journal: %u\n", 0xbffff92cBlocks reserved by journal: 0
) = 30
vfprintf(0x40132380, "Fs state field: 0x%x\n", 0xbffff93cFs state field: 0x1
) = 20
vfprintf(0x40132380, "sb_version: %u\n", 0xbffff92csb_version: 2
) = 14
vfprintf(0x40132380, "inode generation number: %u\n", 0xbffff93cinode generation number: 2816602
) = 33
vfprintf(0x40132380, "UUID: %U\n", 0xbffff92c <unfinished ...>
fprintf(0xbfffd238, "%02x", 0x3)                  = 2
fprintf(0xbfffd238, "%02x", 0x79)                 = 2
fprintf(0xbfffd238, "%02x", 0x8f)                 = 2
fprintf(0xbfffd238, "%02x", 0x7b)                 = 2
fprintf(0xbfffd238, "-")                          = 1
fprintf(0xbfffd238, "%02x", 0x7e)                 = 2
fprintf(0xbfffd238, "%02x", 0x19)                 = 2
fprintf(0xbfffd238, "-")                          = 1
fprintf(0xbfffd238, "%02x", 0x43)                 = 2
fprintf(0xbfffd238, "%02x", 0xeb)                 = 2
fprintf(0xbfffd238, "-")                          = 1
fprintf(0xbfffd238, "%02x", 0x9e)                 = 2
fprintf(0xbfffd238, "%02x", 0xf7)                 = 2
fprintf(0xbfffd238, "-")                          = 1
fprintf(0xbfffd238, "%02x", 0xba)                 = 2
fprintf(0xbfffd238, "%02x", 0xdd)                 = 2
fprintf(0xbfffd238, "%02x", 0x86)                 = 2
fprintf(0xbfffd238, "%02x", 0x60)                 = 2
fprintf(0xbfffd238, "%02x", 0x62)                 = 2
fprintf(0xbfffd238, "%02x", 0xc)                  = 2
UUID: 03798f7b-7e19-43eb-9ef7-badd8660620c
<... vfprintf resumed> )                          = 43
vfprintf(0x40132380, "LABEL: %.16s\n", 0xbffff93cLABEL: 
) = 8
vfprintf(0x40132380, "Set flags in SB:\n", 0xbffff92cSet flags in SB:
) = 17
vfprintf(0x40132380, "\t%s\n", 0xbffff93c	ATTRIBUTES CLEAN
)        = 18
fprintf(0x40132380, "%s", "Is this ok ? (y/n)[n]: "Is this ok ? (y/n)[n]: ) = 23
__getdelim(0xbffff998, 0xbffff994, 10, 0x40132080, 32765) = 2
strcmp("y\n", "y\n")                              = 0
lseek64(3, 65536, 0, 0, 32765)                    = 65536
write(3, "", 4096)                                = -1
__errno_location()                                = 0x40135aa0
strerror(1)                                       = "Operation not permitted"
fprintf(0x40132380, "bwrite: write %ld bytes returned"..., 4096bwrite: write 4096 bytes returned -1 (block=16, dev=3): Operation not permitted
) = 80
exit(8 <unfinished ...>
__deregister_frame_info(0x080856a4, 0x40009608, 0x400137bc, 0x40013d40, 1) = 0

Did you use resizer(y/n)[n]: rebuild-sb: wrong block count occured (26170367), fixed (26170368)
+++ exited (status 8) +++

--=-Kb6h1Cu7ycg/eBSKnb+D
Content-Disposition: attachment; filename=fsck-troubles-strace
Content-Type: text/plain; name=fsck-troubles-strace; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

execve("/sbin/reiserfsck", ["reiserfsck", "--rebuild-sb", "/dev/evms/lvm/d/d"], [/* 23 vars */]) = 0
uname({sys="Linux", node="shakti", ...}) = 0
brk(0)                                  = 0x808aae0
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=32812, ...}) = 0
old_mmap(NULL, 32812, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40014000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\30\222"..., 1024) = 1024
fstat64(3, {st_mode=S_IFREG|0755, st_size=1153784, ...}) = 0
old_mmap(NULL, 1166560, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4001d000
mprotect(0x40130000, 40160, PROT_NONE)  = 0
old_mmap(0x40130000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x113000) = 0x40130000
old_mmap(0x40136000, 15584, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40136000
close(3)                                = 0
munmap(0x40014000, 32812)               = 0
brk(0)                                  = 0x808aae0
brk(0x808ab60)                          = 0x808ab60
brk(0x808b000)                          = 0x808b000
getrlimit(0x1, 0xbffffa64)              = 0
setrlimit(RLIMIT_FSIZE, {rlim_cur=RLIM_INFINITY, rlim_max=RLIM_INFINITY}) = 0
write(2, "\n<-------------reiserfsck, 2002-"..., 72
<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.5-pre1

) = 72
write(2, "  ******************************"..., 641  *************************************************************
  ** If you are using the latest reiserfsprogs and  it fails **
  ** please  email bug reports to reiserfs-list@namesys.com, **
  ** providing  as  much  information  as  possible --  your **
  ** hardware,  kernel,  patches,  settings,  all  reiserfsk **
  ** messages  (including version),  the reiserfsck logfile, **
  ** check  the  syslog file  for  any  related information. **
  ** If you would like advice on using this program, support **
  ** is available  for $25 at  www.namesys.com/support.html. **
  *************************************************************

) = 641
write(2, "Will check superblock and rebuil"..., 47Will check superblock and rebuild it if needed
) = 47
write(2, "Will put log info to \'stdout\'\n", 30Will put log info to 'stdout'
) = 30
write(2, "\nDo you want to run this program"..., 75
Do you want to run this program?[N/Yes] (note need to type Yes if you do):) = 75
fstat64(0, {st_mode=S_IFIFO|0600, st_size=0, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40014000
read(0, "Yes\nn\ny\n", 4096)            = 8
open("/dev/evms/lvm/d/d", O_RDONLY|O_LARGEFILE) = 3
brk(0x808d000)                          = 0x808d000
brk(0x808f000)                          = 0x808f000
brk(0x8091000)                          = 0x8091000
brk(0x8093000)                          = 0x8093000
brk(0x8095000)                          = 0x8095000
brk(0x8097000)                          = 0x8097000
_llseek(3, 8192, [8192], SEEK_SET)      = 0
read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
_llseek(3, 65536, [65536], SEEK_SET)    = 0
read(3, "\377S\217\1K\2220\0Ck\0\0\22\0\0\0\0\0\0\0\0 \0\0\0\4\0"..., 4096) = 4096
close(3)                                = 0
open("/dev/evms/lvm/d/d", O_RDWR|O_LARGEFILE) = 3
stat64("/dev/evms/lvm/d/d", {st_mode=S_IFBLK|0660, st_rdev=makedev(117, 7), ...}) = 0
open("/dev/evms/lvm/d/d", O_RDONLY|O_LARGEFILE) = 4
ioctl(4, 0x80041272, 0xbffff9a4)        = 0
fstat64(1, {st_mode=S_IFREG|0644, st_size=3615, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40015000
stat64("/dev/evms/lvm/d/d", {st_mode=S_IFBLK|0660, st_rdev=makedev(117, 7), ...}) = 0
write(2, "Reiserfs super block in block 16"..., 46Reiserfs super block in block 16 on 0x7507 of ) = 46
write(2, "format 3.6 with ", 16format 3.6 with )        = 16
write(2, "standard journal\n", 17standard journal
)      = 17
write(2, "Count of blocks on the device: 2"..., 40Count of blocks on the device: 26170368
) = 40
write(2, "Number of bitmaps: 799\n", 23Number of bitmaps: 799
) = 23
write(2, "Blocksize: 4096\n", 16Blocksize: 4096
)       = 16
write(2, "Free blocks (count of blocks - u"..., 88Free blocks (count of blocks - used [journal, bitmaps, data, reserved] blocks): 3183179
) = 88
write(2, "Root block: 27459\n", 18Root block: 27459
)     = 18
write(2, "Filesystem is NOT cleanly umount"..., 35Filesystem is NOT cleanly umounted
) = 35
write(2, "Tree height: 5\n", 15Tree height: 5
)        = 15
write(2, "Hash function used to sort names"..., 39Hash function used to sort names: "r5"
) = 39
write(2, "Objectid map size 24, max 972\n", 30Objectid map size 24, max 972
) = 30
write(2, "Journal parameters:\n", 20Journal parameters:
)   = 20
write(2, "\tDevice [0x0]\n", 14	Device [0x0]
)        = 14
write(2, "\tMagic [0x57728bc3]\n", 20	Magic [0x57728bc3]
)  = 20
write(2, "\tSize 8193 blocks (including 1 f"..., 68	Size 8193 blocks (including 1 for journal header) (first block 18)
) = 68
write(2, "\tMax transaction length 1024 blo"..., 36	Max transaction length 1024 blocks
) = 36
write(2, "\tMax batch size 900 blocks\n", 27	Max batch size 900 blocks
) = 27
write(2, "\tMax commit age 30\n", 19	Max commit age 30
)   = 19
write(2, "Blocks reserved by journal: 0\n", 30Blocks reserved by journal: 0
) = 30
write(2, "Fs state field: 0x1\n", 20Fs state field: 0x1
)   = 20
write(2, "sb_version: 2\n", 14sb_version: 2
)         = 14
write(2, "inode generation number: 2816602"..., 33inode generation number: 2816602
) = 33
write(2, "UUID: 03798f7b-7e19-43eb-9ef7-ba"..., 43UUID: 03798f7b-7e19-43eb-9ef7-badd8660620c
) = 43
write(2, "LABEL: \n", 8LABEL: 
)                = 8
write(2, "Set flags in SB:\n", 17Set flags in SB:
)      = 17
write(2, "\tATTRIBUTES CLEAN\n", 18	ATTRIBUTES CLEAN
)    = 18
write(2, "Is this ok ? (y/n)[n]: ", 23Is this ok ? (y/n)[n]: ) = 23
_llseek(3, 65536, [65536], SEEK_SET)    = 0
write(3, "\0T\217\1K\2220\0Ck\0\0\22\0\0\0\0\0\0\0\0 \0\0\0\4\0\0"..., 4096) = -1 EPERM (Operation not permitted)
write(2, "bwrite: write 4096 bytes returne"..., 80bwrite: write 4096 bytes returned -1 (block=16, dev=3): Operation not permitted
) = 80
write(1, "\nDid you use resizer(y/n)[n]: re"..., 97
Did you use resizer(y/n)[n]: rebuild-sb: wrong block count occured (26170367), fixed (26170368)
) = 97
munmap(0x40015000, 4096)                = 0
_exit(8)                                = ?

--=-Kb6h1Cu7ycg/eBSKnb+D--

