From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 14:17:03 -0400
Message-ID: <200408261817.i7QIH35O002702@localhost.localdomain>
References: <helge.hafting@hist.no>
Return-path: <reiserfs-list-return-20937-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Helge Hafting <helge.hafting@hist.no> 
   of "Thu, 26 Aug 2004 10:31:54 +0200." <412D9FFA.6030307@hist.no> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Helge Hafting <helge.hafting@hist.no>
Cc: Matt Mackall <mpm@selenic.com>, Nicholas Miell <nmiell@gmail.com>, Wichert Akkerman <wichert@wiggy.net>, Jeremy Allison <jra@samba.org>, Andrew Morton <akpm@osdl.org>, Spam <spam@tnonline.net>, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Helge Hafting <helge.hafting@hist.no> said:
> Matt Mackall wrote:

[...]

> >Find some silly person with an iBook and open a shell on OS X. Use cp
> >to copy a file with a resource fork. Oh look, the Finder has no idea
> >what the new file is, even though it looks exactly identical in the
> >shell. Isn't that _wonderful_? 

> It is what I'd expect.

Great. That means that all the tools of the trade stop working. Sounds like
show-killer feature to me.

>                         Now, use cp -R to copy  the file
> _with its directory_,

Either it is a file or a directory. Make up your mind. If you have no clear
distinction, you'll only get messed up. Badly.

>                       and see if that fares better.  If not - bad
> implementation of fs and/or cp.  The way I see file-as -directory
> is that _file_ operations (like the reads issued by cat) only
> work on the file part.  You want the directory part?  Use
> directory operations such as those "cp -R" use.

Excuse me, I must grab my sickness bag here.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
