From: "David R. Bergstein" <dbergstein@comcast.net>
Subject: LFS and Large File Support for reiserfs 3.6 (kernel 2.4.19)
Date: Sat, 07 Sep 2002 12:09:21 -0400
Message-ID: <IMELKMOINBOOFMGACNMDIENOCLAA.dbergstein@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-11394-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>

I seem to have hit a file size limit on my system where files exceed 4GB in
size.  I do have an LFS capable glibc (glibc-2.2.4-10.1mdk) on Mandrake 8.1,
running stock kernel 2.4.19, w/o additional patches applied.  This prevents
me from backing up a large directory of video files over the network, since
the file truncates itself after 4GB is exceeded.  Any hints to solve this
issue from the list members is appreciated.

Upon checking the partition, the following diagnostics are available:

[root@zeus root]# reiserfsck -p /dev/hda7
Reiserfs super block in block 16 on 0x307 of format 3.6 with standard
journal
Blocks (total/free): 5504262/3503324 by 4096 bytes
Filesystem is cleanly umounted

[root@zeus root]# reiserfsck /dev/hda7

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.3

Will read-only check consistency of the filesystem on /dev/hda7
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --check started at Sat Sep  7 12:06:58 2002
###########
Replaying journal..
0 transactions replayed
Checking S+tree..ok
Comparing bitmaps..ok
Checking Semantic tree...
ok
No corruptions found
There are on the filesystem:
        Leaves 4042
        Internal nodes 27
        Directories 592
        Other files 6353
        Data block pointers 3035946 (1047455 of them are zero)
        Safe links 0
###########
reiserfsck finished at Sat Sep  7 12:07:20 2002
###########

David R. Bergstein
Systems Engineer and Blues Musician -
http://mywebpages.comcast.net/dbergstein/
Heart of Blue - bookings on-line at http://www.heartofblue.com
OpenPGP Public Key 0xE1F138CA - For info see http://www.gnupg.org
Key fingerprint = C86E CA2A 4171 AC73 91D7  3DCE 8832 D764 E1F1 38CA


