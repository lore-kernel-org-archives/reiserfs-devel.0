From: "David Dabbs" <david@dabbs.net>
Subject: RE: Fibration questions
Date: Sun, 18 Jul 2004 02:47:02 -0500
Message-ID: <20040718074618.7F15615C41@mail03.powweb.com>
References: <40FA22A3.5060503@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19673-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40FA22A3.5060503@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Hans Reiser' <reiser@namesys.com>
Cc: reiserfs-list@namesys.com



I see I'm not the only one up late. 


> -----Original Message-----
> From: Hans Reiser [mailto:reiser@namesys.com]
> Sent: Sunday, July 18, 2004 2:12 AM
> To: David Dabbs
> Cc: reiserfs-list@namesys.com
> >
> I think this is too implementation dependent of an optimization to be
> allowed to influence API design.
>

Understood.
 
> There is a need for support for * in filename queries.  I would support
> adding that to sys_reiser4.
> 

When the time comes for investigating such support, would it mean a change
to the 'sys_reiser4 syntax' (therefore the parser)? Other than a brief gloss
of a web page that deals with it I haven't investigated the syscall
syntax/capabilities, so pardon if this is misplaced.

> If FS naming was better designed, filenames would not have extensions.
> I prefer to first better design naming, and then not need to optimize
> the API for extensions.

While the subject of priorities is on the table, is there a 'reiser4
janitors' list' similar to the kernel janitors' list? Reading through the
code I've seen a number of XXX-FIXME-HANS, etc. Would these TODOs, assuming
the comments remain relevant, be (one of) the places for those wising to
contribute to investigate?

David


