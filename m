From: William Jared Roberts <wjr6@email.byu.edu>
Subject: Re: Bugs?
Date: Sun, 17 Aug 2003 13:22:49 -0600
Message-ID: <01KZKIROVK1W90R3WK@EMAIL1.BYU.EDU>
Return-path: <reiserfs-list-return-15348-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lkthomas@sml.dyndns.org
Cc: reiserfs-list@namesys.com


> are you meaning that remount it manually ?
> also, I know the problem will happen during startup and shutdown, sigh...
> 

No.  You can have the kernel initially mount the partition read-write.  IIRC,
you can use rdev and/or kernel command-line options to acheive this effect. 
It's just a band-aid for the real problem though, if you really need to get into
your box.

