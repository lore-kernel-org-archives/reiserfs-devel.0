From: Pierre Etchemaite <petchema@concept-micro.com>
Subject: Re: Reiser4 breaks (Debian's ?) module-init-tools
Date: Fri, 8 Oct 2004 01:43:34 +0200
Message-ID: <20041008014334.0f18d11e@rayanne>
References: <20041004235826.09ed7a00@rayanne>
	<1097048374.1887.35.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22015-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1097048374.1887.35.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Le mer 06 oct 2004 11:39:35 CEST, Vladimir Saveliev <vs@namesys.com> a =E9c=
rit
:

(Sorry for the delay, I'm very busy those days)

> Hello
>=20
> On Tue, 2004-10-05 at 01:58, Pierre Etchemaite wrote:
> >         Hi,
> >=20
> > On an (almost) fully Reiser4 system, /etc/modprobe.d/ contents seem to
> > be disregarded. When tracing modprobe, each file in this directory is
> > opened as a directory, that looks a lot like the Apache
> > compatibility bug.
> >=20
>=20
> Would you please try whether this patch fixes the problem?
> ftp://ftp.ru.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.9-rc=
3/2.6.9-rc3-mm2/broken-out/reiser4-disable-pseudo.patch
>=20

Yes, it fixes the problem (as expected).

Are you sure they aren't more programs (almost) silently failing ?

What about a patch that logs processes running getdents() on regular
file descriptors, etc. ?

BR,
Pierre.
