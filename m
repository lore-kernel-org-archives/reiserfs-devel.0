From: Rogier Wolff <R.E.Wolff@BitWizard.nl>
Subject: Re: Reiserfs version???
Date: Thu, 7 Aug 2003 14:07:13 +0200
Message-ID: <20030807140711.A4105@bitwizard.nl>
References: <20030807102642.GA14567@hydra.bitwizard.nl> <20030807103445.GA14416@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15221-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030807103445.GA14416@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: copy@harddisk-recovery.nl, reiserfs-list@namesys.com

On Thu, Aug 07, 2003 at 02:34:45PM +0400, Oleg Drokin wrote:
> Hello!
> 
> On Thu, Aug 07, 2003 at 12:26:42PM +0200, wolff@hydra.bitwizard.nl wrote:
> 
> > Normally, fsck would be able to use a backup superblock. But it
> > seems that reiserfsck is not capable of this. 
> 
> reiserfs does not have any backup superblocks.

And I presume V4 fixes that?

I found a bunch of block with the "ReIsErFs" magic on the disk. They
look similar to the superblock, enough so that the superblock should
be reconstructed from there?

> > Now --rebuild-sb asks me for the version. I really wouldn't know. 

> Well, if you use recent enough fsck, it also gives some hints on how
> to find the version (I really hope you are using reiserfsprogs
> 3.6.11, if you are not, then I suggest you to upgrade your
> reiserfsprogs first).

We got the most recent a couple of weeks ago. It was 3.6.6. 
 
> If you store files of bigger than 2Gb in size on that FS, then it is
> of 3.6 version.  If you run 2.2 kernel on your fileserver, then it

Yes, probably. 

> is of 3.5 version.

Nope. 

> If you run 2.4 kernel on your fileserver and you
> still have logs from past boots, see if there is "reiserfs: using
> 3.5.x disk format" message after mounting that fs.  If there is,

The logs live on /, / is the one with the missing superblock.... 

And mounting another fs that didn't have a missing superblock gave us
no message, although reiserfs was version 3.6.25. 

> then this is 3.5 format, if there is not then it has 3.6 format.  If

I mounted another filesystem and in /proc it told me it found a 3.5
version filesystem. So I went to the fsck --rebuild-sb and it had
three options for a 3.5 filesystem...... (i.e. one was eliminated.)

> you do not have any logs and you use kernel 2.4, then you may choose
> 3.6 format and it won't hurt (but you won't be able to mount such a
> volume with 2.2 kernel later on).

We upgraded the ondisk format loosing the 2.2 compatiblity some time 
ago. 

So, given the above information, some strongly hinting we were at 3.5,
some to 3.6, tell me which we have...... 

I chose option 2, fsck-ed it, and it now mounts. We're now rsyncing
the data to another disk and will reformat ASAP.

		Roger. 

-- 
** R.E.Wolff@BitWizard.nl ** http://www.BitWizard.nl/ ** +31-15-2600998 **
*-- BitWizard writes Linux device drivers for any device you may have! --*
* I didn't say it was your fault. I said I was going to blame it on you. *
