From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Problem with the latest auto snapshot
Date: Sun, 13 Jun 2004 16:43:44 +0300
Message-ID: <20040613134344.GK4990@nysv.org>
References: <200406122131.25974.henning-04@die.informatik.uni-siegen.de> <20040612194649.GF4990@nysv.org> <200406131537.54853.henning-04@die.informatik.uni-siegen.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19166-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200406131537.54853.henning-04@die.informatik.uni-siegen.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Cc: reiserfs-list@namesys.com

On Sun, Jun 13, 2004 at 03:37:54PM +0200, Henning Westerholt wrote:
>i'm using the same reiser4 config like you.

Weirdness.

>I just rebuild the partition, and start a small compile job. After them i 
>started a fsck. It reported a new fatal error about a broken node. I attached 
>the output from fsck. I could reproduce this error two times. 

The only question that I can think of is this.
Did you umount the partition?

There is supposedly a bug in current reiser4progs concerning mountpoints,
so it doesn't refuse to fsck a mounted partition.

That is bad.

>Error: On-disk used blocks and really used blocks differ.
>Free block count 2354038 found in the format is wrong. Sould be 2441757.

Could this be because the partition is in use?
If it's trafficking data all the time and fsck can't catch up?

I vaguely remember an ancient discussion with Nik Danilov about having
online fsck and he said something about the kernel/fs never being
able to trust userspace data about disk usage or something...

>I could reproduce this error too. If i remember it correctly, i have had this 
>problem with the 03.26 snapshot before.
>
>I start now a kde-3.2.3 compile run, lets see if the new code survive this..

Does it still stall?

Are the only real corruptions visible at fsck time?

-- 
mjt

