From: Christer Weinigel <christer@weinigel.se>
Subject: Re: silent semantic changes with reiser4
Date: 08 Sep 2004 00:28:20 +0200
Sender: wingel@zoo.weinigel.se
Message-ID: <m3r7pdiuij.fsf@zoo.weinigel.se>
References: <200409071530.i87FUCP1003927@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21600-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200409071530.i87FUCP1003927@laptop11.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Spam <spam@tnonline.net>, Christer Weinigel <christer@weinigel.se>, David Masover <ninja@slaphack.com>, Tonnerre <tonnerre@thundrix.ch>, Linus Torvalds <torvalds@osdl.org>, Pavel Machek <pavel@ucw.cz>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Horst von Brand <vonbrand@inf.utfsm.cl> writes:

> > > 1. Do we want support for named streams?
> > 
> > >    I belive the answer is yes [...]
> 
> There are many people around here who disagree (that is precisely the heart
> of the discussion). I for one don't think Linux has to get $RANDOM_FEATURE
> just because $SOME_OTHER_OS has got it. Either the feature stands on its
> own _in the context of POSIX/Unix/Linux_ (possibly as an extension or
> modification of said standards) or it isn't worth it.

Ok, noted. :-)

I myself am not very interested in generic named stream support in
Linux.  But since we have support for filesystems with named streams
and people are interested in getting at those streams (if nothing else
thanq to serve streams from an NTFS file system via Samba on a dual boot
machine), we'd better do it well, instead of with ugly hacks.

> We need to sort out exactly how far it makes sense to go, by showing
> concrete, down to earth uses for whatever substructure we want. Then show
> the effect can't be easily gotten through tools for power users or faking
> it for unsuspecting users via GUI, and that overall the complexity and
> performance cost is less than the win. Note that the success of the Unix
> way is in large part due to its use of few, simple concepts that can be
> combined endlessly; and tools following the same strategy. Adding extra
> concepts that current tools can't naturally handle has to be considered
> with extreme care.

Regarding this section and all you wrote before, I definitely agree.
Simplicity wins hands down every time.

  /Christer

-- 
"Just how much can I get away with and still go to heaven?"

Freelance consultant specializing in device driver programming for Linux 
Christer Weinigel <christer@weinigel.se>  http://www.weinigel.se
