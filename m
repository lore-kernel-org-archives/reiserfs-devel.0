From: reiserfs@ied.com
Subject: how screwed am I ? - lost 79160kB off of a May 2001 reiserfs partition
 to a swap :-(
Date: Sun, 17 Aug 2003 13:44:16 -0400 (EDT)
Message-ID: <no.Yo.N.nN.0308171326020.2986-100000@business.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15343-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com



  Hello all,

   I screwed myself - I've overwritten the first 79160kB of 
a 38GB partition (fdisk says 38796975 blocks) with swap :-(

   The partition was almost full. I also have full output of 
"find ." on that partition before I screwed up. Total of 
639146 files.

   I don't care about the files in the first 79160kB, since 
those would be OS installation files. But I have many 
important personal files in the remaining 38GB.

   The partition was created as part of a Mandrake 
installation in about May 2001 (I think it was Mandrake 7.2 
then?). The kernel was linux-2.4.3 (which reiserfs version 
would this be?)

   I know I'm screwed, but exactly how much ?

   Any tips / suggestions / procedures for recovering these
files ?

    Thanks a bunch in advance,

        John


