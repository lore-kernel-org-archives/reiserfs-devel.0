From: Andrej Podzimek <andrej@podzimek.org>
Subject: =?UTF-8?Q?=E2=80=9EToo_many_iterations=E2=80=9C_and_fsck.reiser4_failure?=
Date: Mon, 9 Jun 2008 07:47:55 -0700 (PDT)
Message-ID: <17734422.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel@vger.kernel.org


Hello,

my laptop system has been in use with Reiser v4 for half a year or so. =
There
may have been some unexpected restarts and system crashes during that
time... KDE refused to start today. This time it was not just a usual
problem with user permissions. This is what I found in kernel.log:

Jun  9 12:23:38 xandrej reiser4[kbuildsycoca(3104)]: traverse_tree
(fs/reiser4/search.c:689)[nikita-1481]:
Jun  9 12:23:38 xandrej WARNING: Too many iterations: 128
Jun  9 12:23:38 xandrej reiser4[kbuildsycoca(3104)]: traverse_tree
(fs/reiser4/search.c:689)[nikita-1481]:
Jun  9 12:23:38 xandrej WARNING: Too many iterations: 256
Jun  9 12:23:38 xandrej reiser4[kbuildsycoca(3104)]: traverse_tree
(fs/reiser4/search.c:689)[nikita-1481]:
Jun  9 12:23:38 xandrej WARNING: Too many iterations: 512
Jun  9 12:23:38 xandrej reiser4[kbuildsycoca(3104)]: traverse_tree
(fs/reiser4/search.c:689)[nikita-1481]:
Jun  9 12:23:38 xandrej WARNING: Too many iterations: 1024
Jun  9 12:23:38 xandrej reiser4[kbuildsycoca(3104)]: traverse_tree
(fs/reiser4/search.c:689)[nikita-1481]:
Jun  9 12:23:38 xandrej WARNING: Too many iterations: 2048
Jun  9 12:23:38 xandrej reiser4[kbuildsycoca(3104)]: traverse_tree
(fs/reiser4/search.c:689)[nikita-1481]:
Jun  9 12:23:38 xandrej WARNING: Too many iterations: 4096
Jun  9 12:23:38 xandrej reiser4[kbuildsycoca(3104)]: traverse_tree
(fs/reiser4/search.c:689)[nikita-1481]:
Jun  9 12:23:38 xandrej WARNING: Too many iterations: 8192
Jun  9 12:23:38 xandrej reiser4[kbuildsycoca(3104)]: traverse_tree
(fs/reiser4/search.c:689)[nikita-1481]:
Jun  9 12:23:38 xandrej WARNING: Too many iterations: 16384
Jun  9 12:23:38 xandrej reiser4[kbuildsycoca(3104)]: traverse_tree
(fs/reiser4/search.c:689)[nikita-1481]:
Jun  9 12:23:38 xandrej WARNING: Too many iterations: 32768
Jun  9 12:23:38 xandrej reiser4[kbuildsycoca(3104)]: traverse_tree
(fs/reiser4/search.c:689)[nikita-1481]:
Jun  9 12:23:38 xandrej WARNING: Too many iterations: 65536
Jun  9 12:23:39 xandrej reiser4[kbuildsycoca(3104)]: traverse_tree
(fs/reiser4/search.c:689)[nikita-1481]:
Jun  9 12:23:39 xandrej WARNING: Too many iterations: 131072
Jun  9 12:23:39 xandrej reiser4[kbuildsycoca(3104)]: traverse_tree
(fs/reiser4/search.c:689)[nikita-1481]:
Jun  9 12:23:39 xandrej WARNING: Too many iterations: 262144
Jun  9 12:23:40 xandrej reiser4[kbuildsycoca(3104)]: traverse_tree
(fs/reiser4/search.c:722)[nikita-373]:
Jun  9 12:23:40 xandrej WARNING: reiser-2018: Too many iterations. Tree
corrupted, or (less likely) starvation occurring.: level: 4, lock_level=
: 2,
stop_level: 1 lock_mode: read, bias: left-slant
Jun  9 12:23:40 xandrej reiser4[kbuildsycoca(3104)]: tail2extent
(fs/reiser4/plugin/file/tail_conversion.c:516)[nikita-2282]:
Jun  9 12:23:40 xandrej WARNING: Partial conversion of 2426179: -5

Running fsck.reiser4 revealed corruption on all of my Reiser4 volumes. =
All
of them could be fixed, except for /home. :-( I ran fsck.reiser4 --buil=
d-fs
--build-sb. Everything went just fine until the sematic tree scan. It g=
ot
stuck at 99% with intensive disk usage. After about 10 minutes, the pro=
gram
ended with an error message (=E2=80=9Eoperational error=E2=80=9C or som=
ething of that kind).
(Just one line, no further details.)

The hard drive is a relatively recent Seagate Momentus 100 GB, 7200 RPM=
,
2,5", IDE, checked with smartctl regularly. The drive doesn't seem to b=
e the
cause of this...

However, after the (probably unfinished) disk scan, I could still mount=
 the
/home partition and KDE started just fine this time. The file system is
probably not in a consistent state right now. What could I do to stop
further corruption? What scan options should I use?

I am using ArchLinux and the reiser4progs package supplied with the dis=
tro.

Best regards,

Andrej Podzimek
--=20
View this message in context: http://www.nabble.com/%E2%80%9EToo-many-i=
terations%E2%80%9C-and-fsck.reiser4-failure-tp17734422p17734422.html
Sent from the ReiserFS - General mailing list archive at Nabble.com.

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
