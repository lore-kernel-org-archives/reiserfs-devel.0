From: David Masover <ninja@slaphack.com>
Subject: when will it end?
Date: Tue, 26 Oct 2004 19:57:36 -0500
Message-ID: <417EF280.10003@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22187-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I have 512 megs of RAM and one 200 gig hard drive (effectively 177 gig
filesystem) that is 86% full.  I started the reiser4 repacker two days
ago, with very minimal system use since then (an hour or two a day of
playing music and reading email).  See below for my df and top.

Thankfully, the kernel seems intelligent enough about memory management
that once things other than Doom 3 start, they run reasonably smoothly,
even video (must be that anticipatory IO scheduler).

Three questions:   When will it end?  How can I kill it if I get sick of
waiting?  Is it conceivable that the repacker could be optimized to run
faster?


$ df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/hda5            184560092 158186648  26373444  86% /
$
$ top
top - 19:46:02 up 1 day, 23:24,  3 users,  load average: 1.55, 1.25, 1.09
Tasks:  65 total,   2 running,  63 sleeping,   0 stopped,   0 zombie
Cpu(s):  0.3% us, 25.6% sy,  0.0% ni, 38.5% id, 35.2% wa,  0.3% hi,  0.0% si
Mem:    516608k total,   487660k used,    28948k free,        0k buffers
Swap:   995988k total,    41844k used,   954144k free,   383936k cached

~  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND

~ 9010 root      20   0     0    0    0 D 25.0  0.0 570:37.54
k_reiser4_repac
~ 6914 aaron     20   0  2864 1172 2500 S  0.3  0.2   1:49.04 famd

31318 sanity    20   0  3444 1684 3092 R  0.3  0.3   0:00.03 aterm

~    1 root      20   0  1332  404 1180 S  0.0  0.1   0:00.86 init

~    2 root      39  19     0    0    0 S  0.0  0.0   0:00.01 ksoftirqd/0

~    3 root      10 -10     0    0    0 S  0.0  0.0   0:00.43 events/0

~    4 root      10 -10     0    0    0 S  0.0  0.0   0:00.00 khelper

~    5 root      10 -10     0    0    0 S  0.0  0.0   0:00.00 kblockd/0

~   31 root      20   0     0    0    0 S  0.0  0.0   0:09.81 kapmd

~   36 root      10 -10     0    0    0 S  0.0  0.0   0:00.00 aio/0

~   35 root      20   0     0    0    0 S  0.0  0.0   0:10.46 kswapd0

~  126 root      20   0     0    0    0 S  0.0  0.0   0:00.00 kseriod

~  128 root      20   0     0    0    0 S  0.0  0.0   0:00.75
ktxnmgrd:hda5:w
~  129 root      20   0     0    0    0 S  0.0  0.0   0:02.69 ent:hda5.

~  318 root      10 -10  1312  292 1164 S  0.0  0.1   0:00.05 udevd

~ 4988 root      20   0     0    0    0 S  0.0  0.0   0:00.06 khubd

~ 6049 root      20   0  1656  524 1228 S  0.0  0.1   0:00.07 metalog







-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQX7ygHgHNmZLgCUhAQINZg/+Otv/jDcUwhCpQ3obc+Mr//LN4NKbhX/0
cnO5CtSZ/QMaM2rgBUPz4VSYYH4SyRwHqjQ8n8Q9iPUeijNdMpzSytiFBksgPBgS
JBlKR34FLQaahkTm++kf9dJYj/kUNPQWQT1X0i4iet/P2wxd8VeOSrgulxcTPBVH
nbI0l02fcexSCqDez+dJQ1J7ETfbKjKIVWgPVklHuEE/CQ973lX2PBPCcMkKzV3G
w1AGL4Vxl5Sw+se6KjMFY2hFpoYnY5MMojrYfwULekoDj25e7gSh0fpBBheyRjd7
7y284urNPe8elcFmvVq9IclNYcNqpFVwC3/QNZLymEijlHaEHLjiMH14HMzukRSM
mSns/Dk9QM6A1C+r6DRj4rvRA7oFK+ajqI3xJ+qJMJJzysCsCCshBrh/M+x1jnaP
tQOKZnAht+nm5SOM4qLOZJPg8ymp46GJOsBSB4aQ+8ZjF2xb5DHvuqGnC8f+Z7Wu
DGKnCaqB/3qQB6wTgqgup9s4SKqMfTDGAmZINCccrSDAc9GFLePwcsBZVVkx4Oxw
Bp+Kb+8mUS079iDFgJ1DlJ1AOLnUvwbSsWyReWyay8wNxlIqmCRjJU5ALUN4U5hu
sBhSzhNwHczl79gWpz2NHd+wpXTWJkxlG9yTbW3kZ3BwH47JVjXmRzPqDEtDLN0K
4LkwfyGAxVk=
=MyNE
-----END PGP SIGNATURE-----
