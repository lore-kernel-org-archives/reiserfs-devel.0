From: David Masover <ninja@slaphack.com>
Subject: Re: Howto make reiser-3.6 a bit more standby friendly?
Date: Tue, 23 Aug 2005 08:37:37 -0500
Message-ID: <430B26A1.4080003@slaphack.com>
References: <194f62550508230539a1c81d9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25619-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <194f62550508230539a1c81d9@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Clemens Eisserer <linuxhippy@gmail.com>
Cc: reiserfs-list@namesys.com

Clemens Eisserer wrote:
> Hi there,
> 
> I am currently tinkering a idn-router which a harddrive which should
> mostly be in stand-by.
> However it seems the drive is rather unimpressed by a 5s timeout
> setting specified with hdparm and goes in standby very seldom although
> the computer is runnig 100% idle (even no isdn-services started or
> anything else).
> 
> Could this be because of some journal-writeback stuff or anything like
> that? Is there a way to tune ReiserFS for more standby-friendliness?

Have you tried "-o noatime"?

Also, Reiser4 is much more standby-friendly.  If you've got the RAM, it
won't touch your disk too much.

