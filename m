From: William Jared Roberts <wjr6@email.byu.edu>
Subject: Re: Bugs?
Date: Sun, 17 Aug 2003 13:16:12 -0600
Message-ID: <01KZKIJHEMC28Z7LWO@EMAIL1.BYU.EDU>
Return-path: <reiserfs-list-return-15347-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

> WARNING: Flushing like mad: (number)
>  reiser4[mount(17)]: commit_current_atom
> (fs/reiser4/txnmgr.c:1023)[nikita-3176]:
> 
> I couldn't even login to my new reiser4 linux, anyone have idea why ?
> 

Yes, I reported the same problem a couple weeks ago, but got no response.  For
me, the error occurs on startup when the initscript is remounting / from
read-only to read-write.  I was never able to "solve" the problem, but I can
kind-of work around it by commenting out the remount in my initscript and having
the kernel mount / read-write initially (using rdev).  Sadly, the same problem
manifests itself on shutdown sync, so it's never able to complete a "proper"
shutdown.

