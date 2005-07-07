From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: reiserfsck does not actually fix bitmap
Date: Thu, 07 Jul 2005 15:03:19 +0400
Message-ID: <1120734198.3871.134.camel@tribesman.namesys.com>
References: <42CCA0B2.6030701@joshuawise.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25031-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42CCA0B2.6030701@joshuawise.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joshua Wise <joshua@joshuawise.com>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2005-07-07 at 07:25, Joshua Wise wrote:
> Hi folks,
> 
> I just set up a new system, and all was well, but on a boot of the
> system a few days later, I was greeted with reiserfsck complaining that
> the number of free blocks was incorrect, and that it wished to run
> itself with --fix-fixable. It did so, noting that the on-disk and
> correct bitmaps differ. It said that they will be fixed later, as shown:
> 
> Comparing bitmaps..vpf-10630: The on-disk and the correct bitmaps
> differs. Will be fixed later.
> 
> The system rebooted, and it ran reiserfsck -p (or -a, I dunno which)
> once more. Again, it said that the on-disk and correct bitmaps differed,
> and that they would be fixed "later". This repeated until I booted into
> a liveCD and ran reiserfsck from there.  A -p from there shows that
> "Some corruptions on the filesystem were detected. Switching to the
> --fix-fixable mode". When it entered --fix-fixable mode, it again
> mentioned taht the on-disk and correct bitmaps differed, and that it
> would fix them later, but at the end, it said "No corruptions found" and
> made no sign that it actually fixed the bitmaps. Running reiserfsck -p
> again showed no difference, so it seems to me like reiserfsck didn't fix
> the bitmap when it told me it would.
> 
If it showed no bitmap difference anymore - then it is fixed.

> Does anyone have any insights as to how to get reiserfsck to actually
> fix the problem?
> 

I guess that problem is that on -p option reiserfsck gets switched to
quiet mode which supresses some output.
Please run
reiserfsck /dev/hda1 to see whether /dev/hda1 has any problems.


> Thanks,
> joshua
> 

