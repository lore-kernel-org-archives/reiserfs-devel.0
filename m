From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: need opinions from sysadmins on where reiser4progs should install
Date: Mon, 21 Nov 2005 16:32:17 +0300
Message-ID: <200511211632.17965.vitaly@namesys.com>
References: <20051120040723.GA1392@148.Red-217-126-33.pooles.rima-tde.net.> <20051120115529.633B1177A@philou.gramoulle.local> <4381728D.7030300@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27046-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4381728D.7030300@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>
Cc: Philippe =?iso-8859-1?q?Gramoull=E9?= <philippe@gramoulle.com>, reiserfs-list@namesys.com

On Monday 21 November 2005 10:09, Hans Reiser wrote:
> Philippe Gramoull=E9 wrote:
>=20
> >Hello,
> >
> >On Sun, 20 Nov 2005 05:07:23 +0100
> >rvalles <rvalles@es.gnu.org> wrote:
> >
> >  | When I run make install on something and haven't specified a prefix =
on
> >  | configure, I expect /usr/local to be used. If I wanted /, I'd have
> >  | specified that on configure time. If it installed in / by default, it
> >  | would, often, hit the "sacred package-system managed area" of the VFS
> >  | tree annoying people like me to a very great extend, so please don't.
> >
> >While i totally agree with you for standard packages, well i based my ch=
oice
> >on actual experience of the last past six years of use with reiserfs V3.
> >
> >I can't remember how many times i heard Namesys team say " Install the l=
atest
> >& greatest reiserfsck", how many times distro thought they knew reiserfs=
progs
> >internals better than Namesys and customized it to the point where it wo=
uld
> >eventually break.
> >
> >Of course, i can live with a manual install of reiser(fs|4)progs, so i d=
on't
> >really mind, but talking of support, it can make quite a difference to N=
amesys
> >in terms of support, and annoyance with bug reports that could have been=
 easily
> >avoided.
> > =20
> >
> Ok, I propose the following: search the standard locations for where it
> is currently, tell the user, ask the user if they want to rename those

the proper service is already done in package managers. if one needs it,=20
he can use one of them.=20

> versions to *.old if the install of the new one succeeds, and then

this breaks the installed software consistency and may screw the package=20
manager up...

> prompt for the install location with /sbin as the suggested default.  I
> think that unlike other user installed programs, fsck does not belong in
> /usr/local.  I think Philippe's point that old versions are dangerous is
> quite valid.

install to the system default through a system package manager;

install to the local default from source to not break the system installed
software consistency;

provide a way to install where a user wants if he knows what he does and=20
if he remembers what and how has been installed on a particular system;

> >Final decision will still be Namesys call, but hopefully this whole thre=
ad gave
> >them some valuable input to make the best decision.
> >
> >Thanks,
> >
> >Philippe
> >
>

--=20
Vitaly
