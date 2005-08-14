From: michael chang <thenewme91@gmail.com>
Subject: Re: Reiser4 and ACLs
Date: Sun, 14 Aug 2005 08:31:27 -0400
Message-ID: <b14e81f005081405316a06995c@mail.gmail.com>
References: <42FEC9F1.9040709@perkel.com>
	 <20050814080812.GA22983@king.bitgnome.net>
	 <42FF388F.3010506@perkel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25455-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42FF388F.3010506@perkel.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marc Perkel <marc@perkel.com>
Cc: reiser@namesys.com, reiserfs-list@namesys.com

On 8/14/05, Marc Perkel <marc@perkel.com> wrote:
>  So - what's the story with that? Why no ACLs in a system built on a
> dadtbase?

Database.  And you *could* ask, I suppose, why there are no
compression or other plugins available in a system based on plugins.=20
Why there is no repacker when there is supposed to be an interface for
one and is one of the main reasons Reiser4 is so wonderful.  Why...

The reason? Time.  Money.  Resources.

And indeed, the bare bones of Resier4 (the only part the -mm team
wanted) are ready for vanilla inclusion.  The problem is we can't go
any further until this is done -- otherwise, a huge bug that crops up
could end up going undetected for a long time, and fixing it could end
up being a huge task that could take ages.  Reiser4 is undertested and
underfunded.  Vanilla could change that.

Note, this is all speculation.

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
