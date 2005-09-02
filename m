From: michael chang <thenewme91@gmail.com>
Subject: Re: Executability problem
Date: Fri, 2 Sep 2005 11:45:53 -0400
Message-ID: <b14e81f005090208452b9d3382@mail.gmail.com>
References: <20050830152859.45e0b010.Kris.VanBruwaene@vrt.be>
	 <17174.43568.268660.581234@zeta.clusterfs.com>
	 <20050901133725.06b5d3c5.Kris.VanBruwaene@vrt.be>
	 <b14e81f0050901071269f9a23c@mail.gmail.com>
	 <20050901162300.6516ac34.Kris.VanBruwaene@vrt.be>
	 <b14e81f005090107314061f741@mail.gmail.com>
	 <20050901163621.51d70dd1.Kris.VanBruwaene@vrt.be>
	 <b14e81f00509011934fe3d0d2@mail.gmail.com> <4317F778.4010104@vrt.be>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25822-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4317F778.4010104@vrt.be>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kris Van Bruwaene <Kris.VanBruwaene@vrt.be>, Reiserfs List <reiserfs-list@namesys.com>

On 9/2/05, Kris Van Bruwaene <Kris.VanBruwaene@vrt.be> wrote:
> michael chang wrote:
> >On 9/1/05, Kris Van Bruwaene <Kris.VanBruwaene@vrt.be> wrote:
> >>michael chang <thenewme91@gmail.com> schreef:
> >>>"mount -o remount,exec /home"
> >>>
> >>Bingo:
> >>root@A00012344:/home/kris# mount -o remount,exec /home
> >>root@A00012344:/home/kris# cat /etc/mtab | grep home
> >>/dev/hda3 /home reiserfs rw,nosuid,nodev 0 0
> >>exit
> >>[~]# ./tst
> >>Hello world
> >
> >Of course, that still doesn't answer why Knoppix is mounting a
> >reiserfs partition as noexec even when the fstab says otherwise...
> >unless you changed the fstab and then not reboot afterwards?
> >
> Of course not. All I did was add "exec" to the /home line in fstab withou=
t
> rebooting, but the "defaults" was there all the time.

IIRC, options in fstab are only read on boot, unless you're a regular
user mounting a partition with the "user"/"users" thingie...

> Another thing that puzzles me is: shouldn't "mount -o remount"
> read fstab as well?

AFAIK, no. "umount /mountpoint;mount /mountpoint" might. Logically,
you'd want to change fstab, and have the distro boot off that fstab.=20
But then again, KNOPPIX is a live-cd -- this'd be painful.  Not to
mention AFAIK Knoppix autodetects partitions and creates a fstab on
boot; meaning that changes usually don't survive reboots.  Knoppix may
have modified defaults to mount noexec by default.  It might be easier
to use a different distro, installed on a HD, if possible (maybe
Ubuntu or Debian?).

Someone want to go verify and complain to the Knoppix people?  I think
the noexec thing, if enabled, is a security feature, though, and so
partitions are mounted ro/noexec/etc. by default.  Basically to
prevent idiotism, I suppose.

> >But at least that's a decent "workaround", for lack of a better wording.
> Right. Thanks again!
No problem.

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
