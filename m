From: Jeremy Allison <jra@samba.org>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 25 Aug 2004 18:22:30 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040826012230.GA19957@jeremy1>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825152805.45a1ce64.akpm@osdl.org> <112698263.20040826005146@tnonline.net> <Pine.LNX.4.58.0408251555070.17766@ppc970.osdl.org> <1453698131.20040826011935@tnonline.net> <20040825163225.4441cfdd.akpm@osdl.org> <20040825233739.GP10907@legion.cup.hp.com> <20040825234629.GF2612@wiggy.net> <1093480940.2748.35.camel@entropy>
Reply-To: Jeremy Allison <jra@samba.org>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1093480940.2748.35.camel@entropy>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicholas Miell <nmiell@gmail.com>
Cc: Wichert Akkerman <wichert@wiggy.net>, Jeremy Allison <jra@samba.org>, Andrew Morton <akpm@osdl.org>, Spam <spam@tnonline.net>, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Wed, Aug 25, 2004 at 05:42:21PM -0700, Nicholas Miell wrote:
> 
> Anything that currently stores a file's metadata in another file really
> wants this right now. Things like image thumbnails, document summaries,
> digital signatures, etc.

Which is exactly how Windows apps have started to use streams.

> As to how to do it, I think the Solaris interface is reasonably decent.
> The overview is at http://docs.sun.com/db/doc/816-0220/6m6nkorp9?a=view

I agree. This is an interface Samba can live with I think. I
was thinking of implementing it anyway, just so I could piss
off the Linux kernel developers by saying "oh if you need proper
Windows semantics on Samba you have to use an advanced OS like
Solaris, Linux doesn't cut it" :-) :-).

> The only real problem I have with their design is the calling them
> attributes and using "at" everywhere. 

Yep - they're different from xattrs. The easiest way to remember
this is that file streams are seekable and get a fd, xattrs aren't
and don't :-).

Jeremy.
