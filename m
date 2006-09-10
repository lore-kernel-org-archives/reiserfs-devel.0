From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4: mount -o remount,ro / causes error on reboot
Date: Sun, 10 Sep 2006 15:12:00 -0500
Message-ID: <45047190.2040101@slaphack.com>
References: <ee1gcu$dgb$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29844-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ee1gcu$dgb$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter <sw98234@hotmail.com>
Cc: reiserfs-list@namesys.com

Peter wrote:
> Using: gentoo
> kernel 2.6.17.11 with beyond patchset
> reiser patch 2.6.17-3
> reiser4progs 1.0.5
> 
> At the end of the gentoo shutdown script is a short function which
> remounts / as ro.

There's also one in the Gentoo startup script, which attempts to remount 
/ ro, then remount it rw.  I commented that out, because it was causing 
similar problems.  I figure if it runs sync when it shuts down, that's 
good enough.

Still, it's an annoying problem, I think it's a kernel oops.  Namesys, 
what kind of information would be helpful?
