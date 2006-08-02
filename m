From: "Horst H. von Brand" <vonbrand@inf.utfsm.cl>
Subject: Re: metadata plugins (was Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion)
Date: Wed, 02 Aug 2006 14:45:07 -0400
Message-ID: <200608021845.k72Ij7us009749@laptop13.inf.utfsm.cl>
References: <vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932145AbWHBSpa@vger.kernel.org>
In-Reply-To: Message from "Vladimir V. Saveliev" <vs@namesys.com> 
   of "Tue, 01 Aug 2006 20:43:33 +0400." <1154450613.10043.136.camel@tribesman.namesys.com> 
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: =?iso-8859-2?Q?=A3ukasz?= Mierzwa <prymitive@pcserwis.hopto.org>, LKML <linux-kernel@vger.kernel.org>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Vladimir V. Saveliev <vs@namesys.com> wrote:
> On Tue, 2006-08-01 at 17:32 +0200, =C5=81ukasz Mierzwa wrote:
> > Dnia Fri, 28 Jul 2006 18:33:56 +0200, Linus Torvalds <torvalds@osdl=
=2Eorg> =20
> > napisa=C5=82:
> > > In other words, if a filesystem wants to do something fancy, it n=
eeds to
> > > do so WITH THE VFS LAYER, not as some plugin architecture of its =
own. We
> > > already have exactly the plugin interface we need, and it literal=
ly _is_
> > > the VFS interfaces - you can plug in your own filesystems with
> > > "register_filesystem()", which in turn indirectly allows you to p=
lug in
> > > your per-file and per-directory operations for things like lookup=
 etc.

> > What fancy (beside cryptocompress) does reiser4 do now?
>=20
> it is supposed to provide an ability to easy modify filesystem behavi=
our
> in various aspects without breaking compatibility.

If it just modifies /behaviour/ it can't really do much. And what can b=
e
done here is more the job of the scheduler, not of the filesystem. Keep=
 your
hands off it!

If it somehow modifies /on disk format/, it (by *definition*) isn't
compatible. Ditto.

> > Can someone point me to a list of things that are required by kerne=
l =20
> > mainteiners to merge reiser4 into vanilla?
>=20
> list of features reiser4 does not have now:
> O_DIRECT support - we are working on it now
> various block size support

Is this required?

> quota support
> xattrs and acls

Without those, it is next to useless anyway.
--=20
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
