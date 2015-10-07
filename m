From: <doiggl@velocitynet.com.au>
Subject: I have some reiser4progs and mount questions.
Date: Wed, 07 Oct 2015 21:23:40 +1100
Message-ID: <c81d0a44a66152c3b74bbbd9e3e41a41@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Hello,
I have some reiser4progs and mount questions.

- Is there a patch available to fix the 'Wrong order of keys'.
- Can it be fixed ?
- Are there any options I can use to allow the 'mount' command to work
[even read only options] ?
I used in the past # fsck.reiser4 --build-fs --force  /dev/sdb

# mount /dev/sdb /media/disk
mount: mount(2) failed: No such file or directory

#dmesg
44180.648367] Loading Reiser4 (format release: 4.0.1) See www.namesys.com
for a description of Reiser4.
[44180.653126] reiser4[mount(20372)]: try_init_format40
(../fs/reiser4/plugin/disk_format/disk_format40.c:300)[vpf-1363]:
NOTICE: Warning: mounting sdb with errors.
[44180.653145] reiser4: sdb: found disk format 4.0.1.
[44180.653273] reiser4: sdb: use 'fsck.reiser4 --fix' to complete disk
format upgrade.
[44290.758082] reiser4[mount(20372)]: traverse_tree
(../fs/reiser4/search.c:725)[nikita-373]:
WARNING: not found on internal node: level: 6, lock_level: 1, stop_level:
1 lock_mode: read, bias: exact
[44290.758101] reiser4[mount(20372)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 42 (-2)
[44529.517327] reiser4[mount(20562)]: try_init_format40
(../fs/reiser4/plugin/disk_format/disk_format40.c:300)[vpf-1363]:
NOTICE: Warning: mounting sdb with errors.
[44529.517349] reiser4: sdb: found disk format 4.0.1.
[44529.517500] reiser4: sdb: use 'fsck.reiser4 --fix' to complete disk
format upgrade.
[44639.851339] reiser4[mount(20562)]: traverse_tree
(../fs/reiser4/search.c:725)[nikita-373]:
WARNING: not found on internal node: level: 6, lock_level: 1, stop_level:
1 lock_mode: read, bias: exact
[44639.851357] reiser4[mount(20562)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 42 (-2)

I can test and report back on the results on the result.

Thanks
--Glenn

History:
http://www.spinics.net/lists/reiserfs-devel/msg04810.html
http://www.spinics.net/lists/reiserfs-devel/msg04209.html
http://www.spinics.net/lists/reiserfs-devel/msg04871.html
http://www.spinics.net/lists/reiserfs-devel/msg04820.html

# cat /proc/filesystems | grep -i reiser
        reiserfs
        reiser4

# strace -e open  mount /dev/sdb /media/disk
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib64/libmount.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib64/libblkid.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libselinux.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib64/libuuid.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libdl.so.2", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib64/libpcre.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libpthread.so.0", O_RDONLY|O_CLOEXEC) = 3
open("/proc/filesystems", O_RDONLY)     = 3
open("/usr/lib/locale/locale-archive", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No
such file or directory)
open("/usr/share/locale/locale.alias", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib/locale/en_US.UTF-8/LC_CTYPE", O_RDONLY|O_CLOEXEC) = -1
ENOENT (No such file or directory)
open("/usr/lib/locale/en_US.utf8/LC_CTYPE", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib64/gconv/gconv-modules.cache", O_RDONLY) = 3
open("/run/mount/utab", O_RDWR|O_CREAT|O_CLOEXEC, 0644) = 3
open("/dev/sdb", O_RDONLY|O_CLOEXEC)    = 3
open("/sys/dev/block/8:16", O_RDONLY|O_CLOEXEC) = 4
mount: mount(2) failed: No such file or directory
+++ exited with 32 +++

# fsck.reiser4 --build-fs --force  /dev/sdb
.
.
        LOOKING FOR UNCONNECTED NODES FSCK: node.c: 108:
repair_node_items_check: Node (43828275), items (0)

        and
        (1): Wrong order of keys.
        FSCK: node.c: 108: repair_node_items_check: Node (52697435), items
(79)
        and (80): Wrong order of keys.
        FSCK: node.c: 108: repair_node_items_check: Node (63227569), items
(24)
        and (25): Wrong order of keys.
        FSCK: node.c: 108: repair_node_items_check: Node (63227571), items
(73)
        and (74): Wrong order of keys.
        FSCK: node.c: 108: repair_node_items_check: Node (116595727),
items

(20)

        and (21): Wrong order of keys.
        FSCK: node.c: 108: repair_node_items_check: Node (227923161),
items

(22)

        and (23): Wrong order of keys.
        FSCK: node.c: 108: repair_node_items_check: Node (284305753),
items

(61)

        and (62): Wrong order of keys.
                  Read nodes 1481038

        Good nodes 471512

                          Leaves of them 466164, Twigs of them 5348
                  Time interval: Wed Aug 27 03:35:57 2014 - Wed Aug 27
03:39:46
                  2014

