From: Rik van Riel <riel@redhat.com>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 25 Aug 2004 20:57:09 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0408252052420.13240-100000@chimarrao.boston.redhat.com>
References: <Pine.LNX.4.58.0408260204050.22259@artax.karlin.mff.cuni.cz>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20556-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0408260204050.22259@artax.karlin.mff.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Cc: Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, 26 Aug 2004, Mikulas Patocka wrote:
> On Wed, 25 Aug 2004, Linus Torvalds wrote:

> > One way to solve it is to just realize that a final slash at the end
> > implies pretty strongly that you want to treat it as a directory. So what
> > you do is:
> 
> Stupid question: who will use it? And why?

I've got a stupid question too.  How do you back up these
things ?

If your backup program reads them as a file and restores
them as a file, you might lose your directory-inside-the-file
magic.

If your backup program dives into the file despite stat()
saying it's a file and you restore your backup, how are the
"file is a file" semantics preserved ?

Obviously this is something that needs to be sorted out at
the VFS layer.  A filesystem specific backup and restore
program isn't desirable, if only because then there'd be
no way for Hans's users to switch to reiser5 in 2010 ;)

-- 
"Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it." - Brian W. Kernighan

