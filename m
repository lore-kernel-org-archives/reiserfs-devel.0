From: robs@op.net
Subject: Re: bug report
Date: Tue, 29 Apr 2003 04:41:32 -0400 (EDT)
Sender: robs@max15g
Message-ID: <Pine.LNX.4.53.0304290436500.138@max15g>
References: <Pine.LNX.4.53.0304281636140.366@max15g> <20030429054902.GA16939@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13894-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030429054902.GA16939@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com


Update:  I have it working.  I had to make a new separate journal device,
happened to use /dev/hdb3, then had to run:

reiserfstune --make-journal-standard -j /dev/hdb3 /dev/hdb1

etc.  Had to do it several times.  Tried it with "--no-journal-available"
but it would tell me I had a "separated journal device".  (or something like
that.)  That was the key thing I was not sure how to know what to do.
Couldn't find anything about that message anywhere in the docs. :)

Thanks again.

Rob S.



On Tue, 29 Apr 2003, Oleg Drokin wrote:

> Hello!
>
> On Mon, Apr 28, 2003 at 04:40:49PM -0400, robs@op.net wrote:
> > Having difficulty recovering a damaged ReiserFS.
> > Tried stuff- reiserfsck, reiserfstune, etc.  Seems to lead into an infinite
> > loop of things to try but don't work- ie: do x, but x needs y, but y needs
> > z, but z needs x.
> > Not sure what you need to know.
> > "reiserfstune" man page talks about "kernel patched with special
> > 'relocatable journal support' patch"
>
> Well, unfortunatelly you provided not enough info at all.
> We'd like to know:
> what was your problem, how did you decide that reiserfs is damaged? Quote any relevant
> messages from kernel/reiserfsprogs. Do you know how you get it damaged?
> what reiserfsck version do you have? What steps have you already performed?
> What is the kernel version?
>
> Bye,
>     Oleg
>
