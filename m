From: Oleg Drokin <green@namesys.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 10:17:14 +0300
Message-ID: <20030212101714.A10274@namesys.com>
References: <NDBBJPAGKLCMDEIEKOPBAEIMKFAA.mailinglists@websitemanagers.com.au> <3452483515.20030212001747@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12697-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3452483515.20030212001747@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Feb 12, 2003 at 12:17:47AM +0100, Anders Widman wrote:
> >> I've used ReiserFS in the past, but have also used ext3 on my
> >> user's important
> >> data (/home) after a good chunk of one drive was converted to
> >> sparse/null files due to a screwup stemming from no 'badblocks' support
> >> in reiserfs.  Since then, i've used ext3 as well as Reiser but recently
> > I can't comment on your experience, but personally if I have a drive with
> > any number of badblocks (which are showing up to the fs layer, not invisibly
> > re-mapped by the drive) then I take the drive back and get a replacement, or
> > bin the drive.
> However,  the FS SHOULD support handling of bad blocks/clusters at the

Well, the FS itself support this. Kind of ;)
Just mark bad blocks are "used".
Of course this does not work when bad block is in journal (solved with
relocate/custom journal) or in bitmap block.
Said that, I know that ext3 does not do very well if there is a bad block
in the journal area.
Another problem is write errors (especially into journal areas). I do not
know about ext3, but reiserfs just fails in such a case, though I know
that SuSE people are working on resolving this problem.

> FS  layer,  even  while running in a production system. Bad blocks can
> pop  up  at any give time for no particular reason, and it is at these
> times  you  (we) need a strong and reliable filesystem that can handle
> and logically remap broken blocks/sectors.

Hm. None of existing filesystems for Linux can do this to my knowledge.

Bye,
    Oleg
