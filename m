From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: Thu, 10 Oct 2002 20:57:53 +0200
Message-ID: <200210102057.53120.Dieter.Nuetzel@hamburg.de>
References: <Pine.LNX.4.33L2.0210100853240.1670-100000@localhost.localdomain> <20021010195338.138dffcf.philippe.gramoulle@mmania.com> <3DA5C0D3.4000503@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11648-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DA5C0D3.4000503@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>, Philippe =?iso-8859-1?q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: teodarren@myrealbox.com, reiserfs-list@namesys.com

Am Donnerstag, 10. Oktober 2002 20:02 schrieb Hans Reiser:
> Philippe Gramoull=E9 wrote:
> >Hi,
> >
> >Yes, that's what i meant by "not *out of the box* snapshots".
> >
> >We quite never played with LVM as it adds another software layer and i
> > didn't feel it was mature enough at the time we put everything in
> > production but given the benefits we might want to give it a try.
> >
> >BTW, Hans, what you would recommand : LVM or EVMS ?
> >
> >Thanks,
> >
> >Philippe
> >
> >
> >On Thu, 10 Oct 2002 21:31:29 +0400
> >
> >Hans Reiser <reiser@namesys.com> wrote:
> >  |  >Netapp as well have tons of features that  linux boxes +PV210S can=
't
> >  |  > do :Clustering
> >  |  >
> >  |   >volume copy, out out the box snapshots,etc..
> >  |
> >  |   Linux has snapshots if you use lvm, but it is true that  Netapp
> >  | makes a good product.
>
> I lack the expertise to advise on this.  There has been a lot of
> controversy on this.  Keep an eye out for lvm2 to come out.

Read about it on LKML.
LVM is dropped with 2.5.41+.
LVM2 comes under the "hood" of EMVS.

=2DDieter
