From: Rajesh Fowkar <rfowkar@goatelecom.com>
Subject: reiserfs 3.5.x partition and corruption - please help
Date: Fri, 29 Mar 2002 13:20:02 +0000
Message-ID: <20020329132002.GA461@debian>
References: <20020329131517.GA373@debian>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020329131517.GA373@debian>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

I have got a primary partition of 1.5 GB on which I created reiserfs file
system. I created the file system using mkreiserfs which came with the
reiserfsprogs package distributed with woody. It was working fine for last
6 months.

Today suddenly when I tried to mount and list the contents, it gave me
error saying that some of the files could not be stated. I downloaded the
latest version of e2fsprogs from woody tree and ran reiserfsck /dev/hda2,
error still persisted. I even tried --fix-fixable, --rebuild-tree.

Now my position is I cannot mount the patition at all. I have got lot of
stuff from woody downloaded on my dial-up link in that partition. Please
help me to somehow mount that partition.

Here are some details :

--------------------------------------------------------------------------
debian:~# mount /mnt/hda2/
mount: wrong fs type, bad option, bad superblock on /dev/hda2,
       or too many mounted file systems
debian:~# 
--------------------------------------------------------------------------


--------------------------------------------------------------------------
debian:~# dpkg -l |grep reiser
ii  reiserfsprogs  3.x.1a-2       User-level tools for ReiserFS filesystems
--------------------------------------------------------------------------


--------------------------------------------------------------------------
debian:~# reiserfsck /dev/hda2

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.x.1a

Will read-only check consistency of the filesystem on /dev/hda2
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --check started at Fri Mar 29 13:09:52 2002
###########
Replaying journal..
Journal header's mountid: 57
latest transaction found is of mountid 3072
Should those transactions be replayed?(y/n)
0 transactions replayed
Checking S+tree..

Bad root block 4294967295. (--rebuild-tree did not complete)



Aborted
debian:~# 
--------------------------------------------------------------------------


--------------------------------------------------------------------------
debian:~# reiserfsck --rebuild-tree /dev/hda2

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.x.1a

  **********************************************************
  ** This  is  an  experimental  version  of  reiserfsck, **
  **              !! MAKE A BACKUP FIRST !!               **
  ** Don't run this program unless something  is  broken. **
  ** Some types of random FS damage can be recovered from **
  ** by  this  program,   which  basically   throws  away **
  ** the internal nodes of the tree and then reconstructs **
  ** them. This program is for use only by the desperate, **
  ** and is of only beta quality.
  **
  **   Email reiserfs-list@namesys.com with bug reports.
  **
  **********************************************************

  Will rebuild the filesystem (/dev/hda2) tree
  Will put log info to 'stdout'

  Do you want to run this program?[N/Yes] (note need to type Yes):Yes
  Replaying journal..
  Journal header's mountid: 57
  latest transaction found is of mountid 3072
  Should those transactions be replayed?(y/n)
  0 transactions replayed
  ###########
  reiserfsck --rebuild-tree started at Fri Mar 29 13:10:47 2002
  ###########

  Pass 0:
  ####### Pass 0 #######
  Loading on-disk bitmap .. ok, 203297 blocks marked used
  Skipping 8207 blocks (super block, journal, bitmaps) 195091 blocks will be read
  0%pass0.c 1215 do_pass_0 left 195090, 0 /sec
  not data block found, 0
  Aborted
 debian:~# 
--------------------------------------------------------------------------

--------------------------------------------------------------------------
If I say 'y' to the above prompt to replay the transaction than I am
getting the following :

<Snipped>
replay_one_transaction: transaction 9568258: block 3289 should not be journalled (0)
replay_one_transaction: transaction 9568258: block 3290 should not be journalled (0)
replay_one_transaction: transaction 9568258: block 3291 should not be journalled (0)
replay_one_transaction: transaction 9568258: block 3292 should not be journalled (0)
replay_one_transaction: transaction 9568258: block 3293 should not be journalled (0)
replay_one_transaction: transaction 9568258: block 3294 should not be journalled (0)
replay_one_transaction: transaction 9568258: block 3295 should not be journalled (0)
replay_one_transaction: transaction 9568258: block 3296 should not be journalled (0)
replay_one_transaction: transaction 9568258: block 3297 should not be journalled (0)
replay_one_transaction: transaction 9568258: block 3298 should not be journalled (0)
replay_one_transaction: transaction 9568258: block 3299 should not be journalled (0)
replay_one_transaction: transaction 9568258: block 3300 should not be journalled (0)
replay_one_transaction: transaction 9568258: block 3301 should not be journalled (0)
replay_one_transaction: transaction 9568258: block 3302 should not be journalled (0)
replay_one_transaction: transaction 9568258: block 3303 should not be journalled (0)
replay_one_transaction: transaction 9568258: block 3304 should not be journalled (0)
replay_one_transaction: transaction 9568258: block 3305 should not be journalled (0)
replay_one_transaction: transaction 9568258: block 3306 should not be journalled (0)
replay_one_transaction: transaction 9568258: block 3307 should not be journalled (0)
replay_one_transaction: transaction 9568258: block 3308 should not be journalled (0)
replay_one_transaction: transaction 9568258: block 3309 should not be journalled (0)
replay_one_transaction: transaction 9568258: block 3310 should not be journalled (0)
Segmentation fault
debian:~# 
<Snipped>

I will be really greatful if somebody can help me to come out of this hole.

Thanks in advance.

Please cc: the replies to rfowkar@goatelecom.com. I am not subscribed to
the list.

Peace

--
Rajesh *  rajesh-shriram@gmx.net  *  http://www.symonds.net/~rajesh/
Powered By : Debian GNU/Linux 2.2 R-3 [Kernel 2.4.18(ext3),Mutt 1.3.27i]
To love is good, love being difficult.
