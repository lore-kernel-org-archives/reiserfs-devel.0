From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck --rebuild-tree Aborted
Date: Thu, 30 Sep 2004 12:55:49 +0400
Message-ID: <200409301255.49901.vitaly@namesys.com>
References: <20040930092442.40ee8189@xor.ttknn.net> <20040930115219.31b75bab@xor.ttknn.net> <20040930123555.77ce375c@xor.ttknn.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21968-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040930123555.77ce375c@xor.ttknn.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Molchanov Alexander <a.molchanov@transtelecom-nn.ru>, reiserfs-list@namesys.com

On Thursday 30 September 2004 12:35, Molchanov Alexander wrote:
> On Thu, 30 Sep 2004 11:52:19 +0400
>
> Molchanov Alexander <a.molchanov@transtelecom-nn.ru> wrote:
> > > Hello.
> > >
> > > I have a big trouble.
> > > ...[skiped]...
> > >
> > > Pass 2:
> > > 0%....20%....40%..                                       left 818621,
> > > 4280 /sec Not enough allocable blocks, checking bitmap...there are 0
> > > allocable blocks, btw
> > >
> > > out of disk space
> > > Aborted
> > >
> > >
> > > ...[skiped]...
> >
> > Excuse me for troubling. I nevertheless have found on a disk
> > badblocks/badsectors (right at the end of an partition - 3 blocks on
> > 1024).
> >
> > Sorry!
> >
> > # badblocks -v -o sda2.badb.out /dev/sda2
> > Checking blocks 0 to 10009251
> > Checking for bad blocks (read-only test): done
> > Pass completed, 3 bad blocks found.
> >
> > # cat sda2.badb.out
> > 10009248
> > 10009249
> > 10009250
>
> # reiserfsck --badblocks sda2.badb.out --yes --logfile rebuild.log 
> --rebuild-tree /dev/sda2 reiserfsck 3.6.17 (2003 www.namesys.com)
> ...
>
> Will rebuild the filesystem (/dev/sda2) tree
> Bad block list will contain only blocks specified in 'sda2.badb.out' file
> Will put log info to 'rebuild.log'
>
> Do you want to run this program?[N/Yes] (note need to type Yes if you
> do):Yes create_badblock_bitmap: block number (10009247) points out of fs
> size (2502304). create_badblock_bitmap: block number (10009248) points out
> of fs size (2502304). create_badblock_bitmap: block number (10009249)
> points out of fs size (2502304). create_badblock_bitmap: block number
> (10009250) points out of fs size (2502304). create_badblock_bitmap: block
> number (10009251) points out of fs size (2502304). Replaying journal..
> Reiserfs journal '/dev/sda2' in blocks [18..8211]: 0 transactions replayed
> ###########
> reiserfsck --rebuild-tree started at Thu Sep 30 12:14:54 2004
> ###########

bad blocks should be of the same size as the fs blocksize. as the current reiserfs
is of 4k blocksize, 1k blocks are wrong, all these 3 blocks lie in the 4k block 
#2502312.

and again the 4k block #2502312 lie beyond end of the device that keeps only 
#2502311 4k blocks.

-- 
Thanks,
Vitaly Fertman

