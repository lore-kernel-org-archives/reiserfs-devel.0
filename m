From: Hans Reiser <reiser@namesys.com>
Subject: Re: The argument for fs assistance in handling archives
Date: Thu, 02 Sep 2004 22:59:48 -0700
Message-ID: <41380854.3020607@namesys.com>
References: <20040826150202.GE5733@mail.shareable.org> <200408282314.i7SNErYv003270@localhost.localdomain> <20040901200806.GC31934@mail.shareable.org> <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org> <20040902002431.GN31934@mail.shareable.org> <413694E6.7010606@slaphack.com> <Pine.LNX.4.58.0409012037300.2295@ppc970.osdl.org> <4136A14E.9010303@slaphack.com> <Pine.LNX.4.58.0409012259340.2295@ppc970.osdl.org> <4136C876.5010806@namesys.com> <Pine.LNX.4.58.0409020030220.2295@ppc970.osdl.org> <4136E0B6.4000705@namesys.com> <14260000.1094149320@flay> <4137BDA7.4040304@slaphack.com> <793789713.20040903024629@tnonline.net> <4137CA17.6060605@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21401-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4137CA17.6060605@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Spam <spam@tnonline.net>, "Martin J. Bligh" <mbligh@aracnet.com>, Linus Torvalds <torvalds@osdl.org>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

David Masover wrote:

> Spam wrote:
> [...]
> |>   I thought reiser4 had its journaling and atomic commits. Am I
> |>   mistaken? I run reiser4 as primary fs on my test systems and it seem
> |>   to work as expected.
>
> consider this:
>
> save_file () {
>     write()    /* what if the write flushes halfway through
>          * then crashes?

reiser4 does protect from this.  reiserfs v3 does not.

>          */
>
>     blah()    /* what if "blah" crashes? */
>     write()
> }
>
> Some apps need consistency across multiple files, but we don't even have
> it on a single file.  You need a new interface to do that.  As you can
> see, reiser4 has absolutely no way of knowing, anywhere in the above
> code, when you're done writing -- and when the file is consistent.
>
> AFAIK, all that has to be done now for this to work is for them to
> finish the userland interface to the journalling and atomic commits that
> already exist for kernel space.  But so far, all that is truly atomic is
> metadata operations -- chmod, mv, mkdir, touch, and rm/rmdir are all
> atomic, so long as you only use them on a single file/dir.  But this has
> been true in reiserfs3, xfs, ext3, and others.

