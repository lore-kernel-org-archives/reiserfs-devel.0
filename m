From: Rogier Wolff <R.E.Wolff@BitWizard.nl>
Subject: Fwd: Re: Reiser FS performance thingy.
Date: Thu, 7 Aug 2003 20:58:54 +0200
Message-ID: <20030807205854.A20124@bitwizard.nl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15239-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiser@namesys.com, green@namesys.com, mfedyk@matchmail.com, reiserfs-list@namesys.com, copy@harddisk-recovery.nl


> OK Rogier, please search through the archive, and post the URL of your
> previous report.  That will be most helpful.

I searched my own mail archive, remembering that I got an Email
from someone named Hans. Do you know him? :-)

		Roger. 

----- Forwarded message from Hans Reiser <reiser@namesys.com> -----

From: Hans Reiser <reiser@namesys.com>
To: Rogier Wolff <R.E.Wolff@BitWizard.nl>
Date: Wed, 07 Aug 2002 00:03:00 +0400
Subject: Re: Reiser FS performance thingy.
X-Spam-Status: No, hits=-100.0 required=5.0 tests=A_FROM_IN_AUTO_WLIST version=2.01

Rogier Wolff wrote:

>Hi Hans,
>
>We've got a big filesystem on some pretty fast disks running reiserfs:
>
>Filesystem            Size  Used Avail Use% Mounted on
>/dev/md0              603G  466G  137G  78% /recover5
>
>/dev/md0 on /recover5 type reiserfs (rw)
>
>Just a couple of minutes ago, we happened to have only 60G left on
>that filesystem, and suddenly performance went down the drain. Like
>write 500k per second, while normally we're able to read (and write)
>around 100Mb per second off the disks.
>
>We know that you're not supposed to use the last 10% of a disk because
>of performance reasons, but this seems like an enormous penalty.
>
>My impression is that the "search for a free block" routine in
>reiserfs somehow uses the wrong starting point. It is customary to
>start searching where you found a free block last time and not say "at
>the ideal point if you consider the directory entry". Then you might
>end up searching 500G worth of block free flags for a spot for EVERY
>block allocated....
>
>The processes involved in writing to that partition were using LOTS of
>CPU time in system mode. Often top would tell me that over 180% of one
>CPU was spent in system mode.
>
>As you can see, we've solved the problem by doing a little cleaning,
>but you may want to look into this for the future.... 
>
>
>Thanks for the fast fsck. :-)
>
>
>		Roger. 
>
> 
>
Proper solutions from us to your problem include enhanced bitmap 
scanning code (see 2.4.20 when it comes out), and repacking (see 
Reiser4.1 when it comes out).

-- 
Hans




----- End forwarded message -----

-- 
** R.E.Wolff@BitWizard.nl ** http://www.BitWizard.nl/ ** +31-15-2600998 **
*-- BitWizard writes Linux device drivers for any device you may have! --*
* I didn't say it was your fault. I said I was going to blame it on you. *
