From: jbingemer@oilgear.de
Subject: Problems with reiserfsck 3.6.9 (Newbie)
Date: Mon, 21 Jul 2003 11:47:40 +0200
Message-ID: <OFC07A0152.B0CB2D3C-ONC1256D6A.00325BC5-C1256D6A.0035E056@oilgear.de>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=_alternative 0035E054C1256D6A_="
Return-path: <reiserfs-list-return-14973-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=_alternative 0035E054C1256D6A_=
Content-Type: text/plain; charset="US-ASCII"

Hello,

I've problems with my big harddisk in my home server.

The problem started with accessing an CD image stored on that disk over a 
NFS share. The same directory is also shared over SAMBA for my 2000 box. 
(The Disk is a Samsung 120GB drive, half a year old).

The server just stopped responding when I tried to burn this image (at 
176MB the buffer turned empty and cdrdao stopped responding). I was not 
able to access the samba share or the nfs share of that volume any more.

So I restarted the server, unmounted the volume and started reiserfsck. 
The output told me to run --rebuild-tree, so I tried this, but @ Block 
25268519 it just stopped doing anything for 2h. I wasn't able to restart 
the server anymore, so I switched it off yesterday evening.

This morning I installed the newest reiserfsprogs from your Homepage and 
tried the --rebuild-tree again. It hangs again, but on a different block. 
Here is the output of 'reiserfsck /dev/hde5 --rebuild-tree' :

--SNIP--
bi:~ # reiserfsck /dev/hde5 --rebuild-tree

<-------------reiserfsck, 2003------------->
reiserfsprogs 3.6.9

  *************************************************************
  ** Do not  run  the  program  with  --rebuild-tree  unless **
  ** something is broken and MAKE A BACKUP  before using it. **
  ** If you have bad sectors on a drive  it is usually a bad **
  ** idea to continue using it. Then you probably should get **
  ** a working hard drive, copy the file system from the bad **
  ** drive  to the good one -- dd_rescue is  a good tool for **
  ** that -- and only then run this program.                 **
  ** If you are using the latest reiserfsprogs and  it fails **
  ** please  email bug reports to reiserfs-list@namesys.com, **
  ** providing  as  much  information  as  possible --  your **
  ** hardware,  kernel,  patches,  settings,  all reiserfsck **
  ** messages  (including version),  the reiserfsck logfile, **
  ** check  the  syslog file  for  any  related information. **
  ** If you would like advice on using this program, support **
  ** is available  for $25 at  www.namesys.com/support.html. **
  *************************************************************

Will rebuild the filesystem (/dev/hde5) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you 
do):Yes
Replaying journal..
0 transactions replayed
###########
reiserfsck --rebuild-tree started at Mon Jul 21 10:23:02 2003
###########

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 25871679 blocks marked used
Skipping 9105 blocks (super block, journal, bitmaps) 25862574 blocks will 
be read
0%block 42751: The number of items (38) is incorrect, should be (5) - 
corrected
block 42751: The free space (36) is incorrect, should be (3508) - 
corrected
pass0: block 42751, item 1: The file [26801 41683] has the wrong mode 
(?rwxrw-r-x), corrected to (-rwxrw-r-x)
pass0: block 42751, item 3: The file [26801 41687] has the wrong mode 
(c---rw-rw-), corrected to (----rw-rw-)
                                                     left 25269095, 6381 
/sec
--SNIP--

Is there anything I can try or did I make a mistake ?

Best regards
Joerg Bingemer
--=_alternative 0035E054C1256D6A_=--
