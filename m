From: Cookie-Monster <cookie.monster@starfall.de>
Subject: Problem with my HDD
Date: Wed, 29 May 2002 19:49:29 +0200
Message-ID: <10512850437.20020529194929@starfall.de>
Reply-To: Cookie-Monster <cookie.monster@starfall.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10437-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi everybody

I hope you can help me. I formated on of my Server-HDDs with ReiserFS
version, which has been distributed in SuSE Linux 7.3. Sorry, but I
don't know the version, cause I'm know running SuSE Linux 8.0.

My Problem is, that the HDD cannot be mounted anymore:

1.   fileserver:/ # mount /dev/sda1 /ftp/apps/
2.   mount: Not a directory

The first line is the command and the second one is what "mount" tells
me about my HDD.
After this problem I ran reiserfsck:

      fileserver:/ # reiserfsck /dev/sda1
      reiserfsck 3.x.1b (2002)
      Will read-only check consistency of the filesystem on /dev/sda1
      Will put log info to 'stdout'

      Do you want to run this program?[N/Yes] (note need to type Yes):Yes
      ###########
      reiserfsck --check started at Wed May 29 19:22:53 2002
      ###########
      Replaying journal..
      0 transactions replayed
      Checking S+tree..

      Bad root block 4294967295. (--rebuild-tree did not complete)



      Aborted

So then I started reiserfsck with option --rebuil-tree as the manpage
says:

     fileserver:/ # reiserfsck /dev/sda1 --rebuild-tree
     reiserfsck 3.x.1b (2002)
       **********************************************************
       ** This  is  an  experimental  version  of  reiserfsck, **
       **              !! MAKE A BACKUP FIRST !!               **
       ** Don't run this program unless something  is  broken. **
       ** Some types of random FS damage can be recovered from **
       ** by  this  program,   which  basically   throws  away **
       ** the internal nodes of the tree and then reconstructs **
       ** them. This program is for use only by the desperate, **
       ** and is  of only beta quality.  If you are using  the **
       ** latest  reiserfsprogs  and  it  fails  please  email **
       ** bug reports to reiserfs-list@namesys.com.            **
       **********************************************************

     Will rebuild the filesystem (/dev/sda1) tree
     Will put log info to 'stdout'

     Do you want to run this program?[N/Yes] (note need to type Yes):Yes
     Replaying journal..
     0 transactions replayed
     ###########
     reiserfsck --rebuild-tree started at Wed May 29 19:27:02 2002
     ###########

     Pass 0:
     ####### Pass 0 #######
     Loading on-disk bitmap .. ok, 693365 blocks marked used
     Skipping 8486 blocks (super block, journal, bitmaps) 684879 blocks wil=
l be read
     0%....20%....40%....60%...                               left 171398, =
4754 /sec


The check goes on til there are 171398 (more than 60%) blocks left then it =
hangs
up for a while before continueing. From this point on it continues
very slow only. From 150xxx it continues fast til 13039.
At this point the program quits without saying anything and the HDD is
hung up. The old version of reiserfsck, in the SuSe Linux 7.3 Edition
gave out a lot of "Block could not be read" or something like this and
the HDD hung up.

So I can't get the files on this HDD and my life depends on them, so
can someone HELP ME PLEASE?
I really need the data! Is there any possibilty of deleating the
unreadable blocks and rebuuilding the tree then? When this works, I
can get SOME of the information on the HDD back, because there are
only 2-3GB data on it and only 900MB of the data is really important.
But this 900MB are some of the last files I saved on the HDD.

I would be very happy, if someone has any idea of what I can do.

Jesse Schl=FCter

p.s.: The HDD is a IBM DRHS36V (36GB U2W-SCSI) if that is important.

--
Cookie-Monster
cookie.monster@starfall.de
http://www.starfall.de/

