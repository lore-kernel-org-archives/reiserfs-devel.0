From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: silent semantic changes with reiser4
Date: Sat, 28 Aug 2004 19:14:53 -0400
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <200408282314.i7SNErYv003270@localhost.localdomain>
References: <jamie@shareable.org>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: Message from Jamie Lokier <jamie@shareable.org> 
   of "Thu, 26 Aug 2004 16:02:02 +0100." <20040826150202.GE5733@mail.shareable.org> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Jamie Lokier <jamie@shareable.org> said:

[...]

> When a simple "cd" into .tar.gz or .iso is implemented properly, it
> will have _no_ performance penalty after you have first looked in the
> file, so long as it remains in the on-disk cache.  And, the filesystem
> will manage that cache intelligently.

Nonsense. The .iso or .tar or whatever would have to be kept un-isoed or
un-tarred in memory (or on disk cache) for this to be true, and that takes
quite a long time. Each time you want to peek anew at linux/Makefile, the
whole tarfile will have to be read and stored somewhere, and that is just
too slow for my taste. The .tar format is optimized for compact storage,
the on-disk format of a filesystem is optimized for fast access and
modifiability. Now go ahead and enlarge a file on your .iso/.tar a bit...it
will take ages to rebuild the whole thing. There is a _reason_ why there
are filesystems and archives, and they use different formats. If it weren't
so, everybody and Aunt Tillie would just carry .ext3's around, and would
wonder what the heck all this fuss is about.

> Imagine: for looking at source files and such, you probably won't
> bother untarring in future, and you won't bother keeping untarred
> source trees in your home directory for easy access to things you look
> at often.  Why waste the space?  You could install whole applications
> as a .tar and run them from within it, with no performance penalty.

Perpetuum mobile is a nice idea too.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
