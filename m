From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: http://www.namesys.com/snapshots/2004.08.03-internal.testing/
Date: Wed, 4 Aug 2004 16:49:38 +0400
Message-ID: <200408041649.38622.vitaly@namesys.com>
References: <200406150022.34578.vitaly@namesys.com> <200408041434.41816.vitaly@namesys.com> <20040804105208.GO1284@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19978-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040804105208.GO1284@nysv.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus =?koi8-r?q?T=F6rnqvist?= <mjt@nysv.org>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

On Wednesday 04 August 2004 14:52, Markus T=F6rnqvist wrote:
> On Wed, Aug 04, 2004 at 02:34:41PM +0400, Vitaly Fertman wrote:
> >the previous bakup layout had backup block locations depending on the fs
> >size, in other words every resize operation may need to relocate some
> > nodes in the tree to other blocks if the current ones are needed for the
> > backup -- even on expanding. there are no such problems with the current
> > backup layout.
>
> OK, this is a good enough motivation.
>
> But does it have to be done here with fsck with data loss, is there no
> other way around?

1) copy data off, mkfs or fsck, copy data back ;
2) a convertion program. The one I have been writing is not finished yet.

--=20
Thanks,
Vitaly Fertman

