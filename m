From: Jason Holt <jason@lunkwill.org>
Subject: Re: secure delete?
Date: Tue, 23 Mar 2004 21:03:40 +0000 (UTC)
Message-ID: <Pine.LNX.4.44.0403232055580.26868-100000@potato.zayda.com>
References: <405FD7C2.5030605@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17413-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <405FD7C2.5030605@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com


Secure deletion would be a very nice addition to the security features r4 has 
to offer.  After our discussions on the difficulty of getting things like 
shred to work with journalling filesystems, I wrote up a demo that I showed at 
a UUG meeting.  It's here:

http://www.lunkwill.org/tmp/delete/

I get different results every time I run it(!), but usually the last run
(where we create 6 files) produces lots of text on the "disk" even after
shredding.  I suspect that reiserfs would behave the same way.

So some way to ask the fs not to leave extra copies of blocks laying around,
or to securely delete the copies that it makes would be quite useful.

						-J

