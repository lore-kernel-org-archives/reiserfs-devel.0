From: Pavel Machek <pavel@ucw.cz>
Subject: Re: silent semantic changes in reiser4 (brief attempt to document the idea of what reiser4 wants to do with metafiles and why
Date: Tue, 7 Sep 2004 22:59:11 +0200
Message-ID: <20040907205911.GA17555@atrey.karlin.mff.cuni.cz>
References: <41323AD8.7040103@namesys.com> <20040831131201.GA1609@elf.ucw.cz> <413E170F.9000204@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21589-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <413E170F.9000204@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Andrew Morton <akpm@digeo.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@osdl.org>, reiserfs-list@namesys.com

Hi!

> >What about choosing just "..." instead of "metas"? "metas" is string
> >that needs translation etc, while "..." is nicely neutral.
> >
> >cat /sound_of_silence.mp3/.../author
> >
> >does not look bad, either...

> "..." is pretty good, but I think it has been used by others, but I 
> really forget who.  I could live with "...", but I think "metas" and 
> "..metas" will collide less often.  Apparently Meta is a finnish name or 
> something, so Linus does not like it.  The exact string is really not 
> very important to me.  I agree that "..." is elegant.

Well, "..." is mostly used by script kiddies -- they usually have
their rootkit collection there :-).

It would be nice to decide on one escape into "meta" namespace,
uservfs and similar projects probably should be converted to use same
escape.

[Uservfs currently uses things like cat /tmp/foo.tgz#utar/bar.gz#ugz
... essentially using # as another separator. It should probably be
converted to use same meta escape].

								Pavel


