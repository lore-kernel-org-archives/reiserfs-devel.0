From: Shawn <core@enodev.com>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: 24 Jul 2003 10:32:16 -0500
Message-ID: <1059060736.18049.2.camel@localhost>
References: <3F1EF7DB.2010805@namesys.com> <3F1F6005.4060307@tupshin.com>
	 <1059021113.7911.13.camel@localhost> <3F1F66F0.1050406@tupshin.com>
	 <1059024090.9728.22.camel@localhost>
	 <16159.48809.812634.455756@laputa.namesys.com>
	 <3F1FF6DB.2090104@tupshin.com>  <20030724152649.GB12647@work.bitmover.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15030-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030724152649.GB12647@work.bitmover.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Larry McVoy <lm@bitmover.com>
Cc: Tupshin Harper <tupshin@tupshin.com>, Nikita Danilov <Nikita@Namesys.COM>, Hans Reiser <reiser@Namesys.COM>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, reiserfs mailing list <reiserfs-list@Namesys.COM>

Wow, it seems rather involved just to get a udiff against bk-cur. Pull
kernel sources with reiser4 mods, then pull fs/reiser4/*, then generate
a diff.

Well, at least I understand it now...

On Thu, 2003-07-24 at 10:26, Larry McVoy wrote:
> On Thu, Jul 24, 2003 at 08:10:19AM -0700, Tupshin Harper wrote:
> > Nikita Danilov wrote:
> > 
> > >Shawn writes:
> > >> Looks like the 2.5.74 is the last one of any respectable size. I'm
> > >> thinking someone forgot a diff switch (N?) over at namesys...
> > >> 
> > >> Hans? Time to long-distance spank someone?
> > >
> > >Can you try following the instructions on the
> > >http://www.namesys.com/code.html (requires bitkeeper)?
> > >
> > >Nikita.
> > >
> > I'm sorry, but I don't have a bitkeeper license. Please let me know if a 
> > fixed patch is available.
> 
> If someone can tell me what it is that you need and I'll do it and send you
> a patch.  I'm cloning that tree now.
