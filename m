From: viro@parcelfarce.linux.theplanet.co.uk
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 03:03:50 +0100
Sender: <viro@www.linux.org.uk>
Message-ID: <20040827020350.GF21964@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.44.0408261607070.27909-100000@chimarrao.boston.redhat.com> <Pine.LNX.4.58.0408261315110.2304@ppc970.osdl.org> <412E69D2.50503@namesys.com> <Pine.LNX.4.58.0408261625180.2304@ppc970.osdl.org> <412E769B.1090508@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20866-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <412E769B.1090508@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Linus Torvalds <torvalds@osdl.org>, Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thu, Aug 26, 2004 at 04:47:39PM -0700, Hans Reiser wrote:

> Sometimes you want the nonlocal effects and sometimes you don't, and by 
> decomposing streams into smaller primitives we can let users choose as 
> they want.

Right.  Now, would you kindly post the detailed technical analysis of your
wonderful design that handles that stuff safely?  With proof of correctness,
please.  Since we are expected to take your code and use it as "Uber"
replacement for the existing one, it surely would not be too much to expect,
would it?

And no, "we have a nice presentation somewhere on namesys" does not
qualify.

I apologize for the obvious posting in a thread already full of noise,
but I would like to make *very* sure that lack of ripping you another
one does *not* mutate into "no objections from viro" in a lovely thread
on SlashDot in a week or so.
