From: Robert August Vincent II <bobvin@pillars.net>
Subject: Re: Reiser4 and linux 2.6.0
Date: Fri, 1 Aug 2003 20:11:07 -0400
Message-ID: <20030802001107.GA5205@pillars.net>
References: <1059021113.7911.13.camel@localhost> <3F1F66F0.1050406@tupshin.com> <1059024090.9728.22.camel@localhost> <16159.48809.812634.455756@laputa.namesys.com> <3F1FF6DB.2090104@tupshin.com> <20030724152649.GB12647@work.bitmover.com> <3F1FFBF9.2050308@tupshin.com> <20030724155432.GE12647@work.bitmover.com> <20030801161520.GA17083@pillars.net> <16170.38262.819141.42510@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15125-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <16170.38262.819141.42510@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: reiserfs-list@namesys.com

On Fri, Aug 01, 2003 at 08:29:42PM +0400, Nikita Danilov wrote:
> Robert August Vincent II writes:
>  > Could you explain, in simple terms, to somebody who is unfamiliar with
>  > bitkeeper, how to pull the latest 2.6.0 and reiser4 code and do
>  > whatever you did to merge them?
>  > 
>  > I'm not working on any SCM, and therefore downloaded bitkeeper using
>  > the "free" license.
>  > 
>  > But I'm unclear (even after perusing the FAQ and docs) on how to do
>  > what you just described.
>  > 
>  > Perhaps it would be as simple as:
>  > 
>  > bk clone http://linux.bkbits.net/linux-2.5
>  > bk clone bk://bk.namesys.com/bk/reiser4-linux-2.5 linux-2.5
>  > cd linux-2.5/fs
>  > bk clone bk://bk.namesys.com/bk/reiser4
>  > 
>  > But I doubt it...
> 
> It is.

Actually, the above sequence fails on the second command.

> Take a look at the http://www.namesys.com/code.html.

I have.  It tells me how to make a copy of the reiser bk repository.
But does the reiser repository mirror the one at linux.bkbits.net?
Does it have the latest 2.6 code?  Or should I merge the reiser
repository with the one at linux.bkbits.net?

In other words, how do I go about merging the latest code tree from
linux.bkbits.net with the latest code tree from bk.namesys.com ?

> But:
> 
> 1. reiser4 is highly experimental,
> 2. fsck is not yet ready.

Understood.

> so, be careful, don't trust it valuable data and do backup (just for
> case).

I've been following this list for over a year, and have been using
Reiserfs since before Ext3 went stable.

I think you're worried that amateurs will try out the code,
experience problems, and develop an unfavorable view of Reiser4 before
it's production-ready.

Please understand that I'm fully aware of the consequences and I
wouldn't blame you guys if anything goes wrong.

But I'm excited about Reiser4 and I'd like to play around with the
latest code, on a non-production system.
