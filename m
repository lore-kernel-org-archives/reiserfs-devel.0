From: Jake Maciejewski <maciejej@msoe.edu>
Subject: reiser4 still not working on PPC
Date: Mon, 08 Aug 2005 00:41:07 -0500
Message-ID: <1123479668.17488.25.camel@gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25337-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Trying to mount reiser4 on PPC still gives me "mount: No such file or
directory". I'm using 2.6.12.2 with the 3rd Namesys patch for 2.6.12,
and my progs are version 1.0.4-1.

I ran mount with strace and got a whole bunch of stuff, but here's the
interesting part, where it deviates from a successful ext2 mount
following the same procedure (note that I used losetup to reduce the
work done by mount):

mount("/dev/loop0", "/home/jake/debug/mnt_reiser4/", "reiser4", MS_POSIXACL|MS_ACTIVE|MS_NOUSER|0xec0000, 0) = 268581048
mount("/dev/loop0", "/home/jake/debug/mnt_reiser4/", "reiser4", MS_POSIXACL|MS_ACTIVE|MS_NOUSER|0xec0000, 0) = 268581048
mount("/dev/loop0", "/home/jake/debug/mnt_reiser4/", "reiser4", MS_POSIXACL|MS_ACTIVE|MS_NOUSER|0xec0000, 0) = -1 ENOENT (No such file or directory)
rt_sigprocmask(SIG_UNBLOCK, ~[TRAP SEGV RTMIN RT_1], NULL, 8) = 0
lstat64("/home/jake/debug/mnt_reiser4/", {st_mode=S_IFDIR|0755, st_size=1024, ...}) = 0
stat64("/home/jake/debug/mnt_reiser4/", {st_mode=S_IFDIR|0755, st_size=1024, ...}) = 0
stat64("/dev/loop0", {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 0), ...}) = 0
dup(2)                                  = 3
fcntl64(3, F_GETFL)                     = 0x2 (flags O_RDWR)
fstat64(3, {st_mode=S_IFCHR|0620, st_rdev=makedev(136, 0), ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x30018000
_llseek(3, 0, 0x7fb192a8, SEEK_CUR)     = -1 ESPIPE (Illegal seek)
write(3, "mount: No such file or directory"..., 33) = 33
close(3)                                = 0
munmap(0x30018000, 4096)                = 0
exit_group(32)                          = ?

I don't know much about Linux syscalls, but I thought mount() was
supposed to return 0 or -1. So mount gets a bogus return value, tries
again, gets the same, then tries a third time and gets ENOENT? Then it
looks like it's trying to figure out whether the device file or mount
point doesn't exist, but both exist so it gives me a generic "No such
file or directory" and exits. I get some interesting kernel messages,
however:

ps_hash_table: 32 buckets
ef_hash_table: 8192 buckets
z_hash_table: 8192 buckets
z_hash_table: 8192 buckets
j_hash_table: 16384 buckets
loading reiser4 bitmap......done (2 jiffies)
d_cursor_hash_table: 256 buckets
reiser4[mount(8564)]: key_warning (fs/reiser4/plugin/object.c:96)[nikita-717]:
code: -2 at fs/reiser4/tree_walk.c:168
WARNING: Error for inode 720575940379279360 (-2)
for key: (910200000000000:0:0:2:a00000000000000:0)[*]

Nothing seems to change if I re-run mkfs (same inode, key), or even
create the FS from a known-good AMD64 machine. Unfortunately, if I
enable debugging, attempting to insert the module cause modprobe to
consume 100% CPU and go zombie. So far I've avoided building it in
because my beige g3 is a PITA to boot.

-- 
Jake Maciejewski <maciejej@msoe.edu>

