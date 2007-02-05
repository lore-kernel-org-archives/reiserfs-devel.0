From: Peter Stuge <stuge@cdy.org>
Subject: Re: reiserfsck 3.6.19 fails to rebuild-tree badly broken fs
Date: Mon, 5 Feb 2007 08:21:41 +0100
Message-ID: <20070205072141.13036.qmail@cdy.org>
References: <20070108024223.1754.qmail@cdy.org> <200701081347.57403.vs@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30534-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200701081347.57403.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello again,

On Mon, Jan 08, 2007 at 01:47:57PM +0300, Vladimir V. Saveliev wrote:
> > Attached is the log from rebuild-tree. I've run rebuild-tree several
> > times and always get the same result, except for the number 91163
> > after "left" which can change between runs. Block 33147 never changes
> > however.
> 
> It is likely that you have hardware problem with /dev/sdb2.
> You can try to run reiserfsck --rebuild-tree -B bad-block-list
> where bad-block-list contains list of bad blocks.
> Put 33147 into it.
> You may also want to run
> badblocks -b 4096 /dev/sdb2 in order to find other unreliable blocks.

The drive was connected through a USB-SATA-bridge and of course
you were right in that the drive has bad blocks. The bridge was
kind enough to hide the errors from me. Sorry for not hooking the
drive up to a native SATA controller before bugging you.

New error:
create_badblock_bitmap: block number (2064384) belongs to system
reiserfs area. It cannot be relocated.

I get this for a handful of blocks out of the few thousand that
badblocks found. This drive will of course not be used anymore,
but it would be nice if I could grab some more data off of it
before tossing it.

How would you suggest that I proceed? Is it feasible to teach
utilities or the fs driver to ignore the parts of the tree that
the broken system area blocks cover or is there more to it?


(Please cc me, I'm not subscribed to the list. Thanks!)

//Peter
