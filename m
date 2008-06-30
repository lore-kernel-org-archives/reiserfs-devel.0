From: Volker Armin Hemmann <volker.armin.hemmann@tu-clausthal.de>
Subject: some filesystem 'benchmarking' with 2.6.26-rc8
Date: Mon, 30 Jun 2008 18:12:22 +0200
Message-ID: <200806301812.22490.volker.armin.hemmann@tu-clausthal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-kernel@vger.kernel.org
Cc: reiserfs-devel@vger.kernel.org

Hi,

since I had some chores to do and didn't want that my box got bored - a=
lso my=20
new replacement disk needed some stress testing, I did some simple and=20
probably very flawed benchmarking for the following fs:
ext3
jfs
xfs
reiserfs
reiser4.

What I did was very amateurish, but I like to share my results nonethel=
ess.=20
You are free to critize. In fact, I would like to hear hints or tips fo=
r the=20
next time. What I don't want to read is 'you suck go away'. However 'Yo=
u suck,=20
because,...' is acceptable.

This 'benchmark' consists of: creating two partitions with the fs to be=
=20
benchmarked - sdb1 and sdb4. sdb2 is /opt and sdb3 a backup partiton. B=
oth=20
mounted, but with no access while I did the runs. I kept them mounted t=
o=20
prevent accidental deletion by stupid fingers. sdb1 is ~45gb and sdb4 ~=
94gb=20
'huge'.

sda&sdb are Samsung HD502IJ 500gb, with NCQ turned on.
CPU: AMD X2 6000+ with 'performance' as scaling governor, 4GB of ram.
 Nforce 520/MCP65 chipset. NCQ was on.

All filesystems were compiled into the kernel.

first step was mkfs, mounting sdb1 to 'source' and sdb4 to 'target'. Af=
ter=20
that I copied a 'benchmark' directory consisting of ~9000pictures in on=
e=20
directory with some,sub-directories, a maildir with ~160000 mails in se=
veral=20
folders, and a 'films' directory with some sub dirs and some more pictu=
res in=20
sub-directories , all in all ~22GB of data, into the 'source' partition=
, in=20
the following called 'prepare'. This was not timed. The dataset consist=
 of=20
what I would call 'my typical home' - I did not include my documents di=
r=20
because it is pretty much dwarfed by the other three (and I simply forg=
ot.=20
Ahem).

=46rom source I copied to target, followed by sync, this is called 'cre=
ate' and=20
was timed with time.. I choose the same fs for both partitions for fair=
ness=20
reasons. After that, umount, mount, echo 1 > /proc/sys/vm/drop_caches

Then I copied the benchmark-dir on the target. This is called 'copy' be=
low. =20
'benchie' was copied to 'bencho' (I am great with names). cp, follwed b=
y sync,=20
all of it timed, then umount, mount, echo 1 > ....

After that came 'move'. Moving the benchmark dir benchie into another=20
directory - called benchie2 - not renaming. Of course followed by sync =
and=20
timed.
umount/mount/drop_caches

rem1:time rm'ing the benchmark dir 'bencho' on target&sync, then umount=
,=20
mount, ...
rem2:time rm'ing benchie2 on targe&sync,umount, mount...

The results are by no means 'fair'.As you can see with the mount option=
s. I=20
would have liked to turn on barriers for all fs. Same for reiser4 which=
 also=20
used lzo compression (because that is what I am using and I was interes=
ted how=20
fast/slow it is compared to the rest).=20

One thing: mount option documentation sucks. man mount has some options=
,=20
/usr/src/linux/Documentation/filesystems has some options, and then the=
re is=20
the stuff you have to google/grep sources for (reiserfs, I am looking a=
t you).=20
This is something that IMHO needs improving. Even if most users use pre=
-tuned=20
distris.

I did no 'tuning'. If defaults suck, they suck. Sorry. But nobody can e=
xpect=20
08/15 home users to google for hours for the perfect set of settings.

X was not running
cron was not running
smartd, hddtemp, dbus, hald, udev, metalog WERE running. I tried to be =
close=20
to my 'everyday' setup - X was not running to prevent me from skewing t=
he=20
results by clogging the cpu.

Results:

ext3:                           =20
mkfs.ext3 /dev/sdb1  0,02s user 0,99s system 6% cpu 14,816 total
mkfs.ext3 /dev/sdb4  0,03s user 3,63s system 9% cpu 39,030 total
mount /dev/sdb1 -t ext3 -o barrier=3D1,data=3Djournal,noatime /mnt/sour=
ce  0,00s=20
user 0,00s system 0% cpu 0,025 total                                   =
                                                                       =
=20
mount /dev/sdb4 -t ext3 -o barrier=3D1,data=3Djournal,noatime /mnt/targ=
et  0,00s=20
user 0,00s system 11% cpu 0,030 total                                  =
                                                                       =
=20
#                                                                      =
                                      =20
disk usage after prepare:                                              =
                                                  =20
/dev/sdb1             48062440  22160100  23460864  49% /mnt/source    =
                                      =20
#                                                                      =
                                      =20
create.sh                                                              =
                                      =20
sh create.sh  1,08s user 105,19s system 3% cpu 45:17,78 total          =
                                      =20
/dev/sdb4             96221328  22167824  69165728  25% /mnt/target    =
                                      =20
#                                                                      =
                                      =20
copy.sh                                                                =
                                      =20
sh copy.sh  1,09s user 114,32s system 3% cpu 50:15,30 total            =
                                      =20
/dev/sdb4             96221328  44147224  47186328  49% /mnt/target    =
                                      =20
#                                                                      =
                                      =20
move.sh                                                                =
                                      =20
sh move.sh  0,00s user 0,01s system 4% cpu 0,218 total                 =
                                      =20
#                                                                      =
                                      =20
rem1.sh:                                                               =
                                      =20
rm -rf /mnt/target/bencho  0,04s user 5,12s system 6% cpu 1:17,75 total=
                                      =20
rem2.sh:                                                               =
                                      =20
sh rem2.sh  0,04s user 5,74s system 4% cpu 2:05,16 total               =
                                      =20
########################################################               =
                                                                       =
 =20

JFS
mkfs.jfs -q /dev/sdb1  0,00s user 0,04s system 11% cpu 0,337 total
mkfs.jfs -q /dev/sdb4  0,00s user 0,09s system 12% cpu 0,731 total
#                                                                =20
                                =20
mount /dev/sdb1 -t jfs -o noatime /mnt/source  0,00s user 0,00s system =
121%=20
cpu 0,003 total
mount /dev/sdb4 -t jfs -o noatime /mnt/target  0,00s user 0,00s system =
110%=20
cpu 0,003 total
#                                                                      =
                   =20
disk usage after prepare.sh:                                           =
                               =20
/dev/sdb1             48795072  22049220  26745852  46% /mnt/source    =
                   =20
#                                                                      =
                   =20
create.sh:                                                             =
                   =20
sh create.sh  0,79s user 64,93s system 6% cpu 16:14,70 total           =
                   =20
/dev/sdb1             48795072  22049220  26745852  46% /mnt/source    =
                   =20
/dev/sdb4             97719568  22046568  75673000  23% /mnt/target    =
                   =20
#                                                                      =
                   =20
copy.sh:                                                               =
                   =20
sh copy.sh  0,84s user 68,99s system 6% cpu 17:22,76 total             =
                   =20
/dev/sdb4             97719568  44080448  53639120  46% /mnt/target    =
                   =20
#                                                                      =
                   =20
move.sh:                                                               =
                   =20
sh move.sh  0,00s user 0,00s system 0% cpu 0,353 total                 =
                   =20
#                                                                      =
                   =20
rem1.sh:                                                               =
                   =20
sh rem1.sh  0,05s user 4,74s system 3% cpu 2:26,86 total               =
                   =20
#                                                                      =
                   =20
rem2.sh:                                                               =
                   =20
sh rem2.sh  0,05s user 4,55s system 3% cpu 2:27,94 total               =
                   =20
######################################################                 =
                                        =20

XFS
mkfs.xfs -f /dev/sdb1  0,00s user 0,01s system 2% cpu 0,322 total
mkfs.xfs -f /dev/sdb4  0,00s user 0,01s system 0% cpu 0,907 total
#                                                               =20
mount /dev/sdb1 -t xfs -o barrier=3D1,noatime /mnt/source  0,00s user 0=
,00s=20
system 2% cpu 0,161 total
mount /dev/sdb4 -t xfs -o barrier=3D1,noatime /mnt/target  0,00s user 0=
,00s=20
system 1% cpu 0,168 total
/dev/sdb1              47G  4,2M   47G   1% /mnt/source                =
                           =20
/dev/sdb4              94G  4,2M   94G   1% /mnt/target                =
                           =20
#                                                                      =
                           =20
disk usage after prepare.sh:                                           =
                                       =20
/dev/sdb1             48805696  21979288  26826408  46% /mnt/source    =
                           =20
#                                                                      =
                           =20
create.sh:                                                             =
                           =20
(mails extre slow, films fast, first 6gb were responsible for most of t=
he=20
hour)                            =20
sh create.sh  1,09s user 82,65s system 2% cpu 1:04:30,78 total         =
                           =20
/dev/sdb1             48805696  21979288  26826408  46% /mnt/source    =
                           =20
/dev/sdb4             97707792  21979280  75728512  23% /mnt/target    =
                           =20
#                                                                      =
                           =20
copy.sh:                                                               =
                           =20
sh copy.sh  1,10s user 90,33s system 3% cpu 40:03,23 total             =
                           =20
/dev/sdb4             97707792  43954232  53753560  45% /mnt/target    =
                           =20
#                                                                      =
                           =20
move.sh:                                                               =
                           =20
sh move.sh  0,00s user 0,01s system 2% cpu 0,540 total                 =
                           =20
#                                                                      =
                           =20
rem1.sh:                                                               =
                           =20
sh rem1.sh  0,04s user 10,76s system 1% cpu 12:13,20 total             =
                           =20
#                                                                      =
                           =20
rem2.sh                                                                =
                           =20
sh rem2.sh  0,04s user 11,23s system 1% cpu 13:24,95 total             =
                           =20
######################################################                 =
                    =20

reiserfs:
mkfs.reiserfs -q /dev/sdb1  0,01s user 0,04s system 0% cpu 10,455 total
mkfs.reiserfs -q /dev/sdb4  0,01s user 0,07s system 2% cpu 3,502 total=20
#                                                                     =20
mount:                                                                =20
mount /dev/sdb1 -t reiserfs -o barrier=3Dflush,data=3Djournal,noatime /=
mnt/source =20
0,00s user 0,06s system 14% cpu 0,392 total                            =
                                                                     =20
mount /dev/sdb4 -t reiserfs -o barrier=3Dflush,data=3Djournal,noatime /=
mnt/target =20
0,00s user 0,04s system 6% cpu 0,555 total                             =
                                                                     =20
#                                                                      =
                                      =20
disk usage after prepare:                                              =
                                                  =20
/dev/sdb1             48828008  21960572  26867436  45% /mnt/source    =
                                      =20
#                                                                      =
                                      =20
create:                                                                =
                                      =20
sh create.sh  1,12s user 183,73s system 7% cpu 41:17,34 total          =
                                      =20
#                                                                      =
                                      =20
copy:                                                                  =
                                      =20
sh copy.sh  1,03s user 173,93s system 11% cpu 25:56,22 total           =
                                      =20
/dev/sdb4             97752532  43882824  53869708  45% /mnt/target    =
                                      =20
#                                                                      =
                                      =20
move:                                                                  =
                                      =20
sh move.sh  0,00s user 0,01s system 0% cpu 0,688 total                 =
                                      =20
#                                                                      =
                                      =20
rem1.sh:                                                               =
                                      =20
sh rem1.sh  0,04s user 16,59s system 30% cpu 53,700 total
#
rem2.sh
sh rem2.sh  0,06s user 16,57s system 29% cpu 56,769 total
###########################################################

reiser4+lzo
mkfs.reiser4 -y -o create=3Dccreg40,compress=3Dlzo1 /dev/sdb1  0,00s us=
er 0,01s=20
system 2% cpu 0,423 total
mkfs.reiser4 -y -o create=3Dccreg40,compress=3Dlzo1 /dev/sdb4  0,01s us=
er 0,02s=20
system 1% cpu 2,619 total

mount /dev/sdb1 -t reiser4 -o noatime /mnt/source  0,00s user 0,01s sys=
tem 0%=20
cpu 2,893 total
mount /dev/sdb4 -t reiser4 -o noatime /mnt/target  0,00s user 0,02s sys=
tem 0%=20
cpu 4,717 total
#
disk usage after prepare.sh:
/dev/sdb1             46397568  21190652  25206916  46% /mnt/source
#
create.sh:
sh create.sh  0,88s user 123,96s system 15% cpu 13:04,77 total
/dev/sdb1             46397568  21190652  25206916  46% /mnt/source
/dev/sdb4             92886840  21192180  71694660  23% /mnt/target
#
copy.sh:
sh copy.sh  0,89s user 142,65s system 17% cpu 14:01,58 total
/dev/sdb4             92886840  42381216  50505624  46% /mnt/target
#
move.sh:
sh move.sh  0,00s user 0,01s system 1% cpu 0,602 total
#
rem1:
sh rem1.sh  0,07s user 23,64s system 22% cpu 1:47,22 total
rem2:
sh rem2.sh  0,06s user 20,18s system 19% cpu 1:41,35 total
#############################################################

the 'sh' are extremly simple. Just the operation (copy, move, rm) and s=
ync.

I plan to do reiser4 with gzip and without compression in the next coup=
le of=20
days. If you want me to try one of the other fs with different options,=
 just=20
say so.=20

I was very surprised by jfs and xfs. The first was faster than expected=
 (even=20
with the unfairness in its favour) and xfs was much, much slower than=20
expected. XFS was pretty fast with the films, but suffered a lot with t=
he=20
emails, while reiserfs and reiser4 dealt very well with the emails.

Gl=FCck Auf,
Volker
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
