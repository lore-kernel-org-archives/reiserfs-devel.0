From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: "reiserfsck --fix-fixable" says corrected; but doesn't
Date: Mon, 17 Apr 2006 00:13:19 -0400
Message-ID: <200604170013.19665.neal.p.murphy@alum.wpi.edu>
References: <4441BEA6.3020103@gmail.com> <4441D542.8020000@gmail.com>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28502-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4441D542.8020000@gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Sunday 16 April 2006 01:25, Paul Pluzhnikov wrote:
> Paul Pluzhnikov wrote:
> > Running with '--fix-fixable' finds the same errors, and says
> > that it fixed them; but running again finds the same problem again.
>
> Additional clues: the FS (being version 3.5) does not support files over
> 2GB.
>
> All 3 files with the problem are a result of a (recent) program
> attempting to create a file that is larger than 2GB.

Yup. This hit me a few weeks ago. The general concensus is that 3.5 is so old, 
it should've been upgraded long ago. I guess not too many people follow the 
"if it ain't broke, don't fix it" adage.

At best it's a major PITA. At worst it's s security risk, as anyone who can 
write large files can cause DoS and potentially data loss and/or corruption.

The problems don't become really apparent until the file gets close to 4GB in 
attempted size. Seems the 3.6 driver, even though it knows it is writing to a 
3.5 FS, doesn't return an error to the user program when it reaches 3.5's 2GB 
limit.

You're lucky; you got kernel messages. I only got a silent reboot once; the 
rest of the time, the system completely hung. But I was able to rebuild the 
tree and get the FS to a stable condition and back it up to other drives, 
then reformat to 3.6. I only had 60GB or so to split up among three locations 
(one of which is a Win-XP laptop) to back it up.

I would suggest fscking another time or two. If that doesn't get you access to 
the FS, you might try rebuilding the tree. But first, determine how 
expendable your data are; if you can afford to lose it, plug away. If not, 
wait for one the experts here to pipe up.

Hmmm, it was my /home, too. Coincidence? LOL.

Neal
