From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 10 Sep 2004 14:15:38 -0400
Message-ID: <200409101815.i8AIFc5i005300@localhost.localdomain>
References: <reiser@namesys.com>
Return-path: <reiserfs-list-return-21687-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Hans Reiser <reiser@namesys.com> 
   of "Fri, 10 Sep 2004 10:51:27 MST." <4141E99F.5060303@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Timothy Miller <miller@techsource.com>, Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>, Jamie Lokier <jamie@shareable.org>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Hans Reiser <reiser@namesys.com> said:
> Timothy Miller wrote:

[...]

> > You know, if tools all need to be rewritten anyway to deal with the 
> > file metadata "directory", then why not change the symbol that 
> > delimits the metadata key?

> because it is useful that it is only a style convention.  Changing the 
> symbol makes it mandatory to distinguish metafiles from files.

If they are really different than directories, it should be clear what is
what, IMVHO. If they aren't different, they have no place here. Trying to
break hoary Unix tradition (files and directories are separate) while
pretending nothing has changed (see, a file can be handled just like a
directory) just doesn't cut it.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
