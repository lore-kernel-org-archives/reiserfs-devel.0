From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4: mount -o remount,ro / causes error on reboot
Date: Tue, 12 Sep 2006 21:48:16 -0500
Message-ID: <45077170.1070301@slaphack.com>
References: <ee1gcu$dgb$1@sea.gmane.org> <ee77ng$3o1$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29862-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ee77ng$3o1$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter <sw98234@hotmail.com>
Cc: reiserfs-list@namesys.com

Peter wrote:
> On Sun, 10 Sep 2006 17:01:18 +0000, Peter wrote:
> all snip...
more snip...

> Sorry to report this as an r4 bug, although it's interesting to note that
> the 1.12.4 baselayout did NOT cause this problem in reiserfs3.6

Mine was doubtlessly a Reiser4 bug, as it resulted in either an oops or 
a panic, I'm not sure which.  I think it was an oops, and after that 
oops, the disk is inaccessible.  Since it's a root FS, this is a 
problem!  The init scripts should not be able to cause this, no matter 
how buggy they are.

If you would like more information, I can try to reproduce this (it's 
been awhile, I don't even remember the versions) and grab what logs I 
can (log to network, maybe)...

I haven't done this already, because everything works now, and no one's 
asked me to yet.
