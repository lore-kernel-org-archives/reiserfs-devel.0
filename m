From: Rik van Riel <riel@redhat.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 21:59:58 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0408272158560.10272-100000@chimarrao.boston.redhat.com>
References: <1798850364.20040828021903@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20953-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1798850364.20040828021903@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Spam <spam@tnonline.net>
Cc: Jamie Lokier <jamie@shareable.org>, Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Linus Torvalds <torvalds@osdl.org>, Diego Calleja <diegocg@teleline.es>, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Sat, 28 Aug 2004, Spam wrote:

> > Whereas if you follow the OS's advice, and skip virtual files, then
> > backup and restore will recreate the filesystem, which is what you want.
> 
> > _That's_ storing everything.  It's what you want from a backup.
> 
>   It would be storing everything but the virtual files.

Thing is, there is no way to distinguish between what are
virtual files and what are actual streams hidden inside a
file.  You don't know what should and shouldn't be backed
up...

Hans says there must be a way, somehow, but I haven't seen
him tell this mailing list what exactly it is ;)

-- 
"Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it." - Brian W. Kernighan

