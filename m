From: Frank van Maarseveen <frankvm@xs4all.nl>
Subject: Re: The argument for fs assistance in handling archives (was: silent semantic changes with reiser4)
Date: Mon, 6 Sep 2004 14:54:56 +0200
Message-ID: <20040906125456.GA32248@janus>
References: <20040826150202.GE5733@mail.shareable.org> <200408282314.i7SNErYv003270@localhost.localdomain> <20040901200806.GC31934@mail.shareable.org> <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org> <1094118362.4847.23.camel@localhost.localdomain> <20040902203854.GA4801@janus> <20040906075603.GB28697@thundrix.ch> <20040906080845.GA31483@janus> <20040906124357.GB27133@MAIL.13thfloor.at>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21516-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040906124357.GB27133@MAIL.13thfloor.at>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank van Maarseveen <frankvm@xs4all.nl>, Tonnerre <tonnerre@thundrix.ch>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Linus Torvalds <torvalds@osdl.org>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Mon, Sep 06, 2004 at 02:43:57PM +0200, Herbert Poetzl wrote:
> hmm, sounds reasonable, but what if root accesses it?
> (or somebody with the 'right' capability)
> 
>  - it might be strange if even root is not able to
>    open device nodes or execute files from an archive

Yes, but if the file is owned by or writable for non-root then
you've got a security problem. So, unless owned by root and not
writable (readable, executable?) for anyone else "nodev" and
'nosuid" are mandatory.

> 
>  - it might lead to interesting situations if the
>    archive is opened by root, but accessed by an user
>    (thinking of caches and such)

See the above.
Alternatively, each process could have its own vfsmount (please don't
shoot me for suggesting this ;-)

-- 
Frank
