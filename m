From: "Fred -- Speed Up --" <speedup@free.fr>
Subject: Re: Reiser4 bitmap & replication handling
Date: Thu, 22 May 2003 19:17:45 +0200
Message-ID: <006401c32086$105ea350$b300a8c0@xpstation>
References: <002d01c31efe$5da8b5d0$b300a8c0@xpstation> <3ECA87E1.7070906@namesys.com> <001701c31fb4$69e14090$b300a8c0@xpstation> <3ECBE935.3000401@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14209-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Here are Hans's interesting answers to my previous post, thank you Hans ;)
Just a little question : when do you plan to update the kernel patch, which
is 3 month old ?

Fred

> >Maybe some really big files handling performance improvements, to near
XFS
> >performance in this domain. I'm not really concerned, but some specific
> >systems may need such features only offered by XFS. Do you plan to
release
> >different versions of the filesystem's plugins to adapt to different
systems
> >ans situations ?
>
> Large file performance is not really considered the hard thing in FS
> design (unless you do data journaling or atomicity, in which case we are
> twice as fast).

> >>Reiser4 inconsistently performs very very fast.  We have no doubt that
> >>we can make that consistent but it is a lot of measuring and tweaking
> >>and measuring and tweaking.....
> >Sorry but ... what do you mean by "unconsistently" ? Does this mean you
only
> >consider avarage performance, ignoring worse cases ?
>
> I mean we have lots of crud left to clean out of the code.  If you test
> it in a way that avoids the crud, we are fast, if you hit the crud we
> are slow.  Decrudding is in progress.;-)

> >Another question, do you want to release Reiser4 so that it will be
> >presented on LinuxTag because :
> >1- The developement team is mainly composed of german people
> >2- Suse will have a very big area on the show
> >3- The release date just accorded to the LinuxTag opening
> >4- All of you especially like LinuxTag :-D
>
> I like LinuxTag, and I am speaking there, and if we can release it then
> without rushing the code, it will be nice.  No promises, the code ships
> when the code is ready and not before....

