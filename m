From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 03 Sep 2004 15:17:49 -0400
Message-ID: <200409031917.i83JHodv010368@laptop11.inf.utfsm.cl>
References: <cef-lkml@optusnet.com.au>
Return-path: <reiserfs-list-return-21443-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Stuart Young <cef-lkml@optusnet.com.au> 
   of "Fri, 03 Sep 2004 20:41:18 +1000." <200409032041.22128.cef-lkml@optusnet.com.au> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stuart Young <cef-lkml@optusnet.com.au>
Cc: linux-kernel@vger.kernel.org, Helge Hafting <helge.hafting@hist.no>, Theodore Ts'o <tytso@mit.edu>, Jeremy Allison <jra@samba.org>, Jamie Lokier <jamie@shareable.org>, Trond Myklebust <trond.myklebust@fys.uio.no>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Rik van Riel <riel@redhat.com>, Christer Weinigel <christer@weinigel.se>, Spam <spam@tnonline.net>, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, Linus Torvalds <torvalds@osdl.org>, reiser@namesys.com, hch@lst.de, Linux Filesystem Development <linux-fsdevel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com

Stuart Young <cef-lkml@optusnet.com.au> said:

[...]

> Hence why I was suggesting the idea of disposable data in streams. As
> long as people KNOW it's disposable, but useful to keep around as it cuts
> down the time needed to do stuff, then apps will start to pick up
> transporting streams properly. Least then (hopefully) no real information
> will get lost that is important. Once transporting streams becomes
> commonplace, then perhaps streams can be used for more useful things.

How will you prevent people putting the "real" data under some random
stream, "just because it is a prettier name"? (Yes, I've seen Windows users
exporting everything because they found the folder + hand icon
prettier...).  Short answer: You can't. And if you did, then it would be
(another) hell to go through when you start using streams for "useful
data".

[...]

> The point of such information in my examples is that a stream can store
> information in a particular format (ie: an index) that is common to one
> indexing app/library.

Great. Now you just need to convince everybody and Aunt Tillie to use that
same format.

>                       Such an index can be used by ANY app that knows the
> index format to search the document. This is almost exactly what MS will
> do (if they haven't done it already) with the File Indexing Service. As
> it's ONE library, then any new user app that creates data can add index
> creation by adding one library. And any app that wants to search these
> indexes would need only to add one library, not every library for every
> format that it wants to search. It's essentially an n^2 vs 2n problem.

Doable if you can just go and force a format/stream layout/application
suite on each and every user. Won't happen in Linux (and I'm happy for
that).
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
