From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: ReiserFS v3 + millions of files?
Date: Thu, 30 Oct 2003 00:33:23 -0700
Message-ID: <20031030003323.R17778@schatzie.adilger.int>
References: <200310262146.28850.d.oglesby@insightbb.com> <20031029060345.GA21398@mrball.net> <3F9F7DE0.7040000@namesys.com> <20031030060440.GA20504@mrball.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15939-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20031030060440.GA20504@mrball.net>; from todd@mrball.net on Wed, Oct 29, 2003 at 10:04:40PM -0800
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Todd Lyons <todd@mrball.net>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

On Oct 29, 2003  22:04 -0800, Todd Lyons wrote:
> Hans Reiser wrote:
> > Is ext3 using htree?
> 
> You know, I don't know the answer to that.  I would guess that it's the
> default compilation options, so if you say that it uses that by default,
> I'll believe you.  I tried grepping the binary but didn't find anything
> that indicated type of structure.

Unlikely.  The htree (also called indexed directory) code is not in any
common kernel, although we have been using it extensively for Lustre for
many months without problems.

In the past we did some comparisons between ext3+htree and reiserfs for
creating 10M files in a single directory and for local filesystems both
started at around 25k-30k/s but ext3 started to taper off after about
1M files to under 10k/s (this was on a very large/fast SCSI RAID array)
while reiserfs kept pretty steady at 25k/s for the whole 10M files.

Ext3 was a lot worse initially, but I wrote a patch which avoided reading
empty inode table blocks from disk while it was allocating inodes.  That
patch made it into 2.6 I think, but isn't in stock 2.4.  What also makes
a big difference is the size of your journal, because you can quickly
dirty a lot of blocks as you insert filenames into the directory when
there are a lot of directory blocks.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

