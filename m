From: Rik van Riel <riel@redhat.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 15:13:47 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0408271456210.10272-100000@chimarrao.boston.redhat.com>
References: <412F7D22.5050101@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20935-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412F7D22.5050101@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: David Masover <ninja@slaphack.com>, Linus Torvalds <torvalds@osdl.org>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Fri, 27 Aug 2004, Hans Reiser wrote:

> It is the tail that should not wag the dog.

That's no reason for dismissing technical questions with
vigorous handwaving.

> New semantics are going to break backups other than dd.  We need a LOT
> of new semantics if we don't want to be inferior to Apple and MS.

Technical objections need to be addressed, otherwise Linux
will end up inferior to Apple and MS.  Whatever choice we
end up making, it should be something that's both workable
and elegant.

It would be really nice if all the technical issues were
worked out on linux-kernel before the files-as-directories
stuff gets merged.  There are quite a few technical questions
in the thread that haven't been answered yet...

-- 
"Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it." - Brian W. Kernighan

