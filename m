From: Oleg Drokin <green@namesys.com>
Subject: Re: Reiserfs version???
Date: Thu, 7 Aug 2003 16:17:26 +0400
Message-ID: <20030807121726.GE19048@namesys.com>
References: <20030807102642.GA14567@hydra.bitwizard.nl> <20030807103445.GA14416@namesys.com> <20030807140711.A4105@bitwizard.nl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15222-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030807140711.A4105@bitwizard.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rogier Wolff <R.E.Wolff@BitWizard.nl>
Cc: copy@harddisk-recovery.nl, reiserfs-list@namesys.com

Hello!

On Thu, Aug 07, 2003 at 02:07:13PM +0200, Rogier Wolff wrote:
> > > Normally, fsck would be able to use a backup superblock. But it
> > > seems that reiserfsck is not capable of this. 
> > reiserfs does not have any backup superblocks.
> And I presume V4 fixes that?

No.

> I found a bunch of block with the "ReIsErFs" magic on the disk. They
> look similar to the superblock, enough so that the superblock should
> be reconstructed from there?

Well, you are probably looking at the old journaled versions of superblock
(and you have version 3.5 of disk format based on that magic,
v3.6 has ReIsEr2Fs as magic).
We thought about trying to extract superblock from journal, but that idea
was turned down as we do not know where journal might be without the superblock itself.

> > > Now --rebuild-sb asks me for the version. I really wouldn't know. 
> > Well, if you use recent enough fsck, it also gives some hints on how
> > to find the version (I really hope you are using reiserfsprogs
> > 3.6.11, if you are not, then I suggest you to upgrade your
> > reiserfsprogs first).
> We got the most recent a couple of weeks ago. It was 3.6.6. 

Now there is better one.
And there were some significant speedups, too.

> > If you run 2.4 kernel on your fileserver and you
> > still have logs from past boots, see if there is "reiserfs: using
> > 3.5.x disk format" message after mounting that fs.  If there is,
> The logs live on /, / is the one with the missing superblock.... 

How did you miss it (the superblock)?

> And mounting another fs that didn't have a missing superblock gave us
> no message, although reiserfs was version 3.6.25. 

It only gives the message for old filesystems.
Also if you compiled fith CONFIG_REISERFS_PROC_INFO enabled,
you can find lots of info about mounted reiserfs volumes in /proc/fs/reiserfs

> > then this is 3.5 format, if there is not then it has 3.6 format.  If
> I mounted another filesystem and in /proc it told me it found a 3.5
> version filesystem. So I went to the fsck --rebuild-sb and it had
> three options for a 3.5 filesystem...... (i.e. one was eliminated.)

Do you remember how log ago you created that FS?
If that was after year 2000, all chances you are having '>=3.5.9'.

> > you do not have any logs and you use kernel 2.4, then you may choose
> > 3.6 format and it won't hurt (but you won't be able to mount such a
> > volume with 2.2 kernel later on).
> We upgraded the ondisk format loosing the 2.2 compatiblity some time 
> ago. 

So in fact you should have 3.6 format, but you don't.

> So, given the above information, some strongly hinting we were at 3.5,
> some to 3.6, tell me which we have...... 

The magic tells you have v3.5, but you say you did the conversion...
Hm...

Bye,
    Oleg
