From: Henning Westerholt <henning@skalatan.de>
Subject: coredump with fsck.reiser4
Date: Fri, 15 Aug 2003 20:05:05 +0200
Message-ID: <200308152005.08832.henning@skalatan.de>
Reply-To: henning@skalatan.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15329-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

After two days of compiling and test with "stress" on a new reiserfs4, i 
noticed several problems:

- operations of rm and stress hang from time to time
- unable to build mozilla and perl at all
- a "sync" also hang occasionally


So i decided to give fsck.reiser4 a try. But it only coredumped on my system:

fsck.reiser4 0.4.11
[...]
Will check consistency of the filesystem on (/dev/hdd6).
Will use (default) profile.
Information: Continue?
(Yes/No): Yes

***** fsck.reiser4 started at Fri Aug 15 19:47:16 2003

***** Openning the fs.
Reiser4 fs was detected on the /dev/hdd6.
Master super block:
offset:         16
blksize:        4096
magic:          R4Sb
format:         0
label:          <none>

Format super block:
plugin:         format40
description:    Disk-format for reiser4, ver. 0.4.11
offset:         17
magic:          R4Sb-Default
flushes:        0
stamp:          0x3dd47605
blocks:         1536207
free blocks:    858296
root block:     31
tail policy:    4
next oid:       0x1143dc
file count:     1131484
tree height:    4
key policy:     LARGE

Segmentation fault (core dumped)


Information from the mount in the system logs:

Aug 15 19:27:17 sonne kernel: ================ fs info (mount ok) ===
Aug 15 19:27:17 sonne kernel: root block: 31
Aug 15 19:27:17 sonne kernel: tree height: 4
Aug 15 19:27:17 sonne kernel: Oids: next to use 1131484, in use 166211
Aug 15 19:27:17 sonne kernel: Block counters:
Aug 15 19:27:17 sonne kernel: ^Iblock count^I1536207
Aug 15 19:27:17 sonne kernel: ^Ifree blocks^I858296
Aug 15 19:27:17 sonne kernel: ^Iused blocks^I677911
Aug 15 19:27:17 sonne kernel: ^Igrabbed^I0
Aug 15 19:27:17 sonne kernel: ^Ifake allocated formatted^I0
Aug 15 19:27:17 sonne kernel: ^Ifake allocated unformatted^I0
Aug 15 19:27:17 sonne kernel: Root directory key: (29:1:0:0:2a:0)[stat data]
Aug 15 19:27:17 sonne kernel: Diskmap is not present
Aug 15 19:27:17 sonne kernel: =========== disk format info (reiser40) ===


I've provided the 2,7 MB coredump at http://www.skalatan.de/misc/core

-- 
Regards,
Henning

