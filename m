From: Pavel Machek <pavel@suse.cz>
Subject: Re: file as a directory
Date: Sun, 28 Nov 2004 20:01:50 +0100
Message-ID: <20041128190150.GF1214@elf.ucw.cz>
References: <2c59f00304112205546349e88e@mail.gmail.com> <41A1FFFC.70507@hist.no> <20041125230937.GA2909@elf.ucw.cz> <20041128185334.GA5329@hh.idb.hist.no>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22606-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20041128185334.GA5329@hh.idb.hist.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Helge Hafting <helgehaf@aitel.hist.no>
Cc: Helge Hafting <helge.hafting@hist.no>, Amit Gud <amitgud1@gmail.com>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Hi!

> > > You won't get .tar or .tar.gz support in the VFS, for a few simple reasons:
> > > 1. .tar and .tar.gz are complicated formats, and are therefore better
> > >   left to userland.  You can get some of the same effect by using a shared
> > >   library that redefines fopen() and fread() though.  It'll work fine for
> > >   the vast majority of apps that happens to use the C library.
> > 
> > It is not same effect -- with shared library you get no caching. And
> > that hurts a lot.
> > 
> The compressed file is still cached, and the library can cache
> file contents in a shared mapping.  It does not have to
> be a per-process thing.

Okay, that way you can get it per-user but not system-global...

								Pavel
-- 
People were complaining that M$ turns users into beta-testers...
...jr ghea gurz vagb qrirybcref, naq gurl frrz gb yvxr vg gung jnl!
