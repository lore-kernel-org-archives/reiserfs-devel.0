From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Corruption: --fix-fixable results in all nlink values = 0
Date: Thu, 22 Aug 2002 15:00:24 +0400
Message-ID: <200208221500.24544.vitaly@namesys.com>
References: <m3k7mpreij.fsf@merlin.emma.line.org> <3D63BD2D.1070602@web.de> <3D63CA89.3050002@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11284-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D63CA89.3050002@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, degerrit@web.de
Cc: reiserfs-list@namesys.com

Hans Reiser wrote:
> Gerrit Hannaert wrote:
> > Hans Reiser wrote:
> >> It is not that I oppose putting it into the tree with a fixed key for
> >> the file holding it, it is that I want us to work on other things
> >> instead.
> >>
> >> Hans
> >
> > Why not just run 'badblocks' (or the failure mechanism which now
> > aborts with "bread: Cannot read a block") as an (optional) part of
> > fsck and use the output in a bad-block-marking phase?
>
> This is good UI design.  Vitaly....

some block could be read at the fifth attempt, so badblocks may show 
different results every time, but you want such blocks to be marked 
as bad all the time.

> > Then you don't need to store the list of bad blocks anywhere, at least
> > not for fsck anyway ;-). Personally though, as a user, I'd like to
> > confirm the list of bad blocks in this case (in case it's too large I
> > might decide not to do it...)
> >
> > It wasn't even clear to me until last week that the hard disk *also*
> > did remapping of bad blocks, whether automatically or with some
> > vendor-tool. Perhaps any fsck failure due to hardware error should
> > recommend using low-level disk-checking tools provided by hard disk
> > vendors prior to taking any action itself?
> >
> > - Gerrit

reiserprogs know how to do the following (disabled for now):
1) reiserfsck --check -B badblocks_file 
checks that blocks from the badblocks_file are not used by an internal 
tree, except the object [-1 -1] and all of these blocks exist as 
unformatted pointers in the object [-1 -1] and all of them are marked 
as used in on-disk bitmap.
2) reiserfsck --fix-fixable -B badblocks_file
checks that blocks from the badblocks_file are not used by an internal 
tree, remove the body of the object [-1 -1] and add all blocks from the 
file badblocks_file into the object [-1 -1] as unformatted pointers.
3) reiserfsck --rebuild-tree -B badblocks_file
rebuilds an internal tree without pointers to blocks specified in the 
file badblocks_file, removes the body of the object [-1 -1], add all 
blocks from the file badblocks_file into the file [-1 -1] when the tree 
is rebuilt.
4) debugreiserfs -B badblocks_file
searches the key [-1 -1 1 IND] in the internal tree and prints the bad 
block list kept there.

bad blocks are kept in the object [-1 -1] as unformatted pointers of 
indirect items. 

-- 

Thanks,
Vitaly Fertman


