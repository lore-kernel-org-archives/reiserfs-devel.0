From: Rik van Riel <riel@redhat.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 10:45:13 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0408271043090.10272-100000@chimarrao.boston.redhat.com>
References: <412EEB75.1030401@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20919-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412EEB75.1030401@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: David Masover <ninja@slaphack.com>, Linus Torvalds <torvalds@osdl.org>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Fri, 27 Aug 2004, Hans Reiser wrote:

> Why are you guys even considering going to any pain at all to distort 
> semantics for the sake of backup?  tar is easy, we'll fix it and send in 
> a patch. 

It's not as easy as you make it out, and not just because
there are a few dozen backup programs that need fixing.

The problem is more fundamental than that.  Some of the
file streams proposed need to be backed up, while others
are alternative presentations of the file, which should
not be backed up.

Currently I see no way to distinguish between the stuff
that should be backed up and the stuff that shouldn't.

That problem needs to be resolved before we can even start
thinking about fixing archivers...

-- 
"Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it." - Brian W. Kernighan

