From: michael chang <thenewme91@gmail.com>
Subject: Re: Executability problem
Date: Thu, 1 Sep 2005 10:31:10 -0400
Message-ID: <b14e81f005090107314061f741@mail.gmail.com>
References: <20050830152859.45e0b010.Kris.VanBruwaene@vrt.be>
	 <17174.43568.268660.581234@zeta.clusterfs.com>
	 <20050901133725.06b5d3c5.Kris.VanBruwaene@vrt.be>
	 <b14e81f0050901071269f9a23c@mail.gmail.com>
	 <20050901162300.6516ac34.Kris.VanBruwaene@vrt.be>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25792-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050901162300.6516ac34.Kris.VanBruwaene@vrt.be>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kris Van Bruwaene <Kris.VanBruwaene@vrt.be>, Reiserfs List <reiserfs-list@namesys.com>

On 9/1/05, Kris Van Bruwaene <Kris.VanBruwaene@vrt.be> wrote:
> michael chang <thenewme91@gmail.com> schreef:
>=20
> > On 9/1/05, Kris Van Bruwaene <Kris.VanBruwaene@vrt.be> wrote:
> > > Looks like you've hit it. How come it's noexec here and exec/defaults=
 in /etc/fstab ??
> >
> > How are you mounting the filesystem? E.g. from a command line, or from
> > an init script; as root or as a user, etc.
>=20
> It usually gets mounted at boot time, I suppose by an init script
> (I'm using Knoppix). But I just did (as root):
> root@A00012344:/home/kris# mount -o remount /home
> root@A00012344:/home/kris# cat /etc/fstab | grep home
> /dev/hda3 /home reiserfs defaults,exec,user,auto 0 0
> root@A00012344:/home/kris# cat /etc/mtab | grep home
> /dev/hda3 /home reiserfs rw,noexec,nosuid,nodev 0 0
>=20
> ...and it's still noexec!?

try
"mount -o remount,exec /home"
or=20
"umount /home; mount /home;"
(or both)

As for the knoppix init scripts... they're pretty restrictive.  Like
mounting things read only, AFAIK.

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
