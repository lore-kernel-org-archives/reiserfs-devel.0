From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: The argument for fs assistance in handling archives
Date: Fri, 03 Sep 2004 13:41:10 -0400
Message-ID: <200409031741.i83HfASY017164@laptop11.inf.utfsm.cl>
References: <helge.hafting@hist.no>
Return-path: <reiserfs-list-return-21442-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Helge Hafting <helge.hafting@hist.no> 
   of "Fri, 03 Sep 2004 10:22:55 +0200." <413829DF.8010305@hist.no> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Helge Hafting <helge.hafting@hist.no>
Cc: Oliver Hunt <oliverhunt@gmail.com>, Hans Reiser <reiser@namesys.com>, Linus Torvalds <torvalds@osdl.org>, David Masover <ninja@slaphack.com>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Helge Hafting <helge.hafting@hist.no> said:

[...]

> The only new thing needed is the ability for something to be both
> file and directory at the same time.

Then why have files and directories in the first place?

>                                       Some tools will need
> a update - usually only because they blindly assume that a directory
> isn't a file too, or that a file can't be a directory too.  Remove the
> mistaken assumption and things will work because the underlying system
> calls (chdir or open) _will_ work.

But with some weird restrictions: No moving stuff around between files, no
linking, some "files" can't be deleted (how would you handle removing the
principal stream of a file?). Some stuff you'd love to do (is, in fact, the
reason for this all) just can't be allowed (i.e., J. Random Luser setting
his own icon for system-wide emacs). So the tools/scripts/users/sysadmins
will have to be painfully aware that some of the files aren't, and some of
the directories aren't either. Major pain in the neck to use, if you look
closer.  Add extra kernel complexity. For little (if any) gain.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
