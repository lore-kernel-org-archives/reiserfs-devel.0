From: Marcelo Pacheco <marcelo@macp.eti.br>
Subject: Re: Reiser4 and linux 2.6.0
Date: Fri, 1 Aug 2003 14:16:52 -0300
Message-ID: <200308011416.52844.marcelo@macp.eti.br>
References: <3F1EF7DB.2010805@namesys.com> <20030801161520.GA17083@pillars.net> <3F2A94F1.2010502@tupshin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15124-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F2A94F1.2010502@tupshin.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tupshin Harper <tupshin@tupshin.com>
Cc: reiserfs mailing list <reiserfs-list@Namesys.COM>

If you still have that small patch, I'll take it. Beats downloading old 2.5 
code just to get a copy of a few files.

The I can pull the other repositories which should be much smaller.

I can't wait to get my test system toasted with Reiser4.

Marcelo

On Friday 01 August 2003 13:27, Tupshin Harper wrote:
> Robert August Vincent II wrote:
> >Could you explain, in simple terms, to somebody who is unfamiliar with
> >bitkeeper, how to pull the latest 2.6.0 and reiser4 code and do
> >whatever you did to merge them?
> >
> >I'm not working on any SCM, and therefore downloaded bitkeeper using
> >the "free" license.
> >
> >But I'm unclear (even after perusing the FAQ and docs) on how to do
> >what you just described.
> >
> >Perhaps it would be as simple as:
> >
> >bk clone http://linux.bkbits.net/linux-2.5
> >bk clone bk://bk.namesys.com/bk/reiser4-linux-2.5 linux-2.5
> >cd linux-2.5/fs
> >bk clone bk://bk.namesys.com/bk/reiser4
> >
> >But I doubt it...
>
> Larry was kind enough to send me the patch of his results of this merge,
> but unfortunately it suffered from the same incompleteness problems that
> the recent diffs on the namesys ftp site do. They apply cleanly, but
> they completely omit the contents of the fs/reiser4 directory which has
> the bulk of the code. It seem that the problem resides with the reiser
> folks. Maybe they have some more complicated structure involving two
> trees. Not sure, but a correct patch looks like it has to come from the
> reiser4 team.
>
> -Tupshin

