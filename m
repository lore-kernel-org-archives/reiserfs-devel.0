From: Costyn van Dongen <costyn@xs4all.nl>
Subject: possible bugreport: rebuild-sb not behaving as expected
Date: Sun, 6 Apr 2003 20:42:30 +0200 (CEST)
Message-ID: <Pine.LNX.4.53.0304062012510.23286@phogen.xs4all.nl>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="1841432574-1411301117-1049654550=:23286"
Return-path: <reiserfs-list-return-13599-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--1841432574-1411301117-1049654550=:23286
Content-Type: TEXT/PLAIN; charset=US-ASCII

Hi,

According to the manpage of reiserfsck I should now submit a bug report,
so here goes.

My goal was:
------------
make a reiserfs partition smaller so I could install another distribution
on there to try out.

Sources of information:
-----------------------
man resize_reiserfs
http://xpt.sourceforge.net/techdocs/linuxdisk/Partition/linuxdisk02.007.html

The resize_reiserfs page wasn't clear about how to use cfdisk to resize a
partition, and man cfdisk didn't say anything about resizing either, so
that's why I used the steps in the URL above to guide me along.

My partition setup (by parted):
-------------------------------
Disk geometry for /dev/hdb: 0.000-58644.140 megabytes
Disk label type: msdos
Minor    Start       End     Type      Filesystem  Flags
1          0.031   4998.164  primary   reiserfs    boot
2       4998.164   5256.562  primary   linux-swap
3       5256.562  53897.761  primary   reiserfs

Steps I took:
-------------
(sorry, these first steps I don't have in a log file. The steps I took in
repairing, I do; see attachment. All this was done under Knoppix)

1. resize_reiserfs -s -5G /dev/hdb3
2. using fdisk I deleted the partition /dev/hdb3 and recreated it only
smaller, leaving an extra margin of about 500MB. I started it at the same
cylinder as the partition I deleted.
3. rebooted

From here on you can see a replay of my actions in the attachment (some
uninteresting commands like looking up man pages removed)

I think one mistake I made was in reiserfsck -rebuild-sb and specifying
the wrong number of blocks for the partition. Is this something that can
be done again? (doing another rebuild-sb after having done one earlier?).
In some instances it did not ask me for sb information. See attachment.

There isn't anything on the drive I that is really important, but getting
it back is a nuisance (downloading a bunch of stuff again). I'd like to
avoid it.

So do you people think you might be able to help? Or have I dug myself
into a deep hole and is the data irrecoverable?

Cheers, and thanks in advance,

Costyn.

p.s. I've subscribed myself to the list, for convenience sake.
--1841432574-1411301117-1049654550=:23286
Content-Type: APPLICATION/zip; name="reiserfslog.zip"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.53.0304062042300.23286@phogen.xs4all.nl>
Content-Description: 
Content-Disposition: attachment; filename="reiserfslog.zip"

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
AAAAAQABAEYAAABiFgAAAAA=

--1841432574-1411301117-1049654550=:23286--
