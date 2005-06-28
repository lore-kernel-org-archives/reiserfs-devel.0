From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 plugins
Date: Mon, 27 Jun 2005 17:06:34 -0700
Message-ID: <42C0948A.1080903@namesys.com>
References: <42BB7B32.4010100@slaphack.com> <200506240334.j5O3YowB008100@laptop11.inf.utfsm.cl> <20050627092138.GD11013@nysv.org> <20050627124255.GB6280@thunk.org> <42C0578F.7030608@namesys.com> <20050627212628.GB27805@thunk.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24729-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050627212628.GB27805@thunk.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Theodore Ts'o <tytso@mit.edu>
Cc: Markus T?rnqvist <mjt@nysv.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, David Masover <ninja@slaphack.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Steve Lord <lord@xfs.org>, vitaly@thebsh.namesys.com

What happens when the ext3 inode tables get hit by sector damage? Like
us, ext3 has data munging if you hit the wrong thing, its just that our
sources of data munging are different in the details.  Details matter
though, and so we are improving with each release, and V4 does have some
real improvements.  I hope the next major release will have atomic
transactions that don't have that niggling 5% left undone that prevents
them from being fully there, and then reiser4 can seriously advance the
field of reliability in filesystems rather than just playing catchup.

Good luck with ext3,

Hans

Theodore Ts'o wrote:

>However, logically speaking, if a filesystem is designed such that in
>certain cases, the fsck program has to brute-force search every single
>disk block looking for data structures that _look_ like they might be
>part of the filesystem data, well, that's always going to be more
>error prone than one where the filesystem metadata is in
>easily-predicted locations.  It sounds like you've added some more
>checks in reiser4, and that's definitely a good thing.  Time will tell
>whether they are sufficient or not.
>
>Regards,
>
>						- Ted
>
>
>  
>

