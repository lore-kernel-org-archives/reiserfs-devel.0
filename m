From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: http://www.namesys.com/snapshots/2004.08.03-internal.testing/
Date: Tue, 3 Aug 2004 18:19:51 +0400
Message-ID: <200408031819.51600.vitaly@namesys.com>
References: <200406150022.34578.vitaly@namesys.com> <200408031750.00291.vitaly@namesys.com> <20040803135805.GK1284@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19943-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040803135805.GK1284@nysv.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus =?koi8-r?q?T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

On Tuesday 03 August 2004 17:58, Markus T=F6rnqvist wrote:
> On Tue, Aug 03, 2004 at 05:50:00PM +0400, Vitaly Fertman wrote:
> >No kernel patch is needed for the disk format change, however fsck may
> >report about some corruptions on an existent fs if a block was allocated
> >for some data and has become a backup one. Fsck.reiser4 --build-fs is
> >able to fix it of course, although the data in these blocks are lost the=
n.
>
> What kind of probabilities and amounts of data are we talking about?

The first gig has 22 backup blocks and they are distributed expotentially.
The first backup copy was probably almost always used for other needs.

--=20
Thanks,
Vitaly Fertman

