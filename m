From: Fionn Behrens <fionn@unix-ag.org>
Subject: Re: Strange Syslog messages - this is NOT an isolated case!
Date: Mon, 30 Sep 2002 12:57:53 +0200
Message-ID: <20020930125753.5d05d7ea.fionn@unix-ag.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11565-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi Sean, hi all,

I had a bad system crash last night and had to rebuild-tree afterwards. After
completion I noticed that I always got errors trying to list the /lost+found
directory on the rebuilt partition:

root@rtfm[lost+found] ls -la
ls: 33277_18: Permission denied
ls: 33277_21: Permission denied
total 723505
drwx------    2 root     root          232 Sep 30 09:36 .
drwxrwxr-x   14 root     staff         312 Sep 29 21:19 ..
-rw-r-----    1 fionn    staff        1680 Sep 28  2000 10_5545
-rw-r--r--    1 root     root          738 Apr 23 15:17 33277_16
-rwxr-xr-x    1 fionn    staff     5528244 Mar 16  2001 41953_37254
-rwxr-xr-x    1 fionn    staff    733839360 Dec 13  2001 4625_4657
-rw-------    1 fionn    staff       12288 Aug 28  2001 48215_50042
-rwxr-xr-x    1 fionn    staff     1478380 Dec 17  2001 mplayer

Obviously there are links to some non-existent directory items.
This is the accompanying part of syslog:

Sep 30 11:01:14 rtfm kernel: Using rupasov hash to sort names
Sep 30 11:01:14 rtfm kernel: reiserfs: using 3.5.x disk format
Sep 30 11:01:14 rtfm kernel: ReiserFS version 3.6.25
Sep 30 11:01:19 rtfm kernel: is_leaf: wrong item type for item *3.5*[33277 21
0x1 IND], item_len 4, item_location 1846, free_space(entry_count) 0
Sep 30 11:01:19 rtfm kernel: vs-5150: search_by_key: invalid format found in
block 12064. Fsck?
Sep 30 11:01:19 rtfm kernel: vs-13070: reiserfs_read_inode2: i/o failure
occurred trying to find stat data of [33277 18 0x0 SD]
Sep 30 11:01:19 rtfm kernel: is_leaf: wrong item type for item *3.5*[33277 21
0x1 IND], item_len 4, item_location 1846, free_space(entry_count) 0
Sep 30 11:01:19 rtfm kernel: vs-5150: search_by_key: invalid format found in
block 12064. Fsck?
Sep 30 11:01:19 rtfm kernel: vs-13070: reiserfs_read_inode2: i/o failure
occurred trying to find stat data of [33277 21 0x0 SD]

This looks strangely familiar, doesnt it?

Having gotten curious, I did a ls -lR on the drive and uncovered about a dozen
similar problems outside /lost+found. I have not yet changed anything on the
drive and hope you can give me some advice as I consider this a SERIOUS
problem (wheter my data is in danger or not, problems should be found by an
fsck). As a satiric sidenote, there are messages appearing in the syslog,
suggesting an fsck. But fsck wont find a problem.

So, bottom line:
* The drive is pretty new. badblocks does NOT find anything. In fact it ran   
  flawlessly until I rebuilt the tree.
* reiserfsck --fix-fixable claims there are NO errors.
* I have 2.4.19, too
* I am using reiserfsprogs 3.6.3 from the Debian
  reiserfsprogs 3.6.3-1 package.

If one of the core developers gets interested in the problem we might be able
to find an arrangement for hin to look after the issue on_site. I will gladly
supply any debug output on request.

With kind regards,
		Fionn

P.S.: Sean, do you happen to have tried either 2.4.19-ac4 lately or are you
      using the kernel-preemption-rml patch? Are you using LVM? 
      These are the only unusual things I had running lately and although
      I dont suspect it has to do something with this I'd like to
      back-check for similarities...

P.P.S: As a side note: Is there _any_ way to convert old 3.5/rupasov volumes
       to newer formats without copying half a terabyte over and over again?
-- 
I believe we have been called by history to lead the world.
                                                       G.W. Bush, 2002-03-01
