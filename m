From: Brad Boyer <flar@allandria.com>
Subject: Re: silent semantic changes with reiser4
Date: Sat, 28 Aug 2004 12:18:15 -0700
Message-ID: <20040828191815.GA20865@pants.nu>
References: <Pine.LNX.4.58.0408261217140.2304@ppc970.osdl.org> <Pine.LNX.4.44.0408261607070.27909-100000@chimarrao.boston.redhat.com> <20040826204841.GC5733@mail.shareable.org> <20040826205218.GE1570@legion.cup.hp.com> <20040827101956.B29672@infradead.org> <20040828035629.GE1285@jeremy1>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21013-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040828035629.GE1285@jeremy1>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Allison <jra@samba.org>
Cc: Christoph Hellwig <hch@infradead.org>, Jamie Lokier <jamie@shareable.org>, Rik van Riel <riel@redhat.com>, Linus Torvalds <torvalds@osdl.org>, Diego Calleja <diegocg@teleline.es>, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Fri, Aug 27, 2004 at 08:56:29PM -0700, Jeremy Allison wrote:
> I am well aware of what netatalk does. However netatalk
> isn't as widely used as Samba. Things they can get away
> with would cause our user community to flay us alive.
> 
> We need a proper solution, not a nasty hack.
> 
> That's like me telling you to "learn from *BSD". You have
> different user constituencies, you have to serve yours,
> I have to serve mine.

While I do think that there are some hacks in netatalk, the
hacks there are not nearly as bad as the hacks that made it
into the kernel to support exporting a native Mac filesystem.
Take a look at the fork code in the hfs filesystem from 2.4
or before for exporting to netatalk.  It's disgusting, and
mostly because there is no easy way to export the resource
fork and extra metadata that is essential to the client. The
2.6 code doesn't have that anymore, but I don't think it
actually works with netatalk either. Perhaps someone can
correct me on that, but I don't see how it could work.

I would hope that something comes out of this whole discussion
that will allow a much better interface between the hfs/hfsplus
code in the kernel and netatalk.

	Brad Boyer
	flar@allandria.com

