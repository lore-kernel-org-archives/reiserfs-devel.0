From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Deleting a 5 GB directory in Reiser4 hangs system(s)
Date: Mon, 28 Jul 2014 22:12:26 +0400
Message-ID: <1825802.TSAWuTl8Lm@intelfx-laptop>
References: <CAM12Q5RGOuEMyVhTPcVcLDGAri6H9-NbBKOF2T_PXfq0=kMVoQ@mail.gmail.com> <f651f508fe39c0bf8484b2996012d16c@mail.velocitynet.com.au> <CAM12Q5RLQKTm15Sw4=NT0tUVq2LVbo90onGnq9fy6G1zhNd5fQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3416446.MYXbIaWIHp"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=KTXwQNF7jk7c6aVTtNPbB7V7FhjerI23qUtNeZv/F5Y=;
        b=O205e+BxjOspYNfAYNUjQgWQZS1kX3zlpxT8lgiizHYfpSJ02TekL42mEVYYXGtdX2
         HBnLUVWY/kqF1ZnvR7+VQlkm2+lRvEkOzc6gur+Yv0VRRSTzMzxgXjyFUPSdSk9C4zbs
         S/dO+kZEEv+6JNIQrAKZT8ZmrueMwOY/AQ1ShZLcR1Bm/ui1ccjRAVm9NDHZR6ExoU+g
         ka+HfCZvH+Gecd2K7YM/O1ioElrwWqKRZDYWD/T7HeSzYlI7HPd4pnesuyRbWkpyu3AZ
         /Pon+6XgL1sAh2Lg9NDOt2+RQDhkzft2+qJM2coNkGRSwh7fDya5hBiSujrdSbz0mALf
         ScPA==
In-Reply-To: <CAM12Q5RLQKTm15Sw4=NT0tUVq2LVbo90onGnq9fy6G1zhNd5fQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Jose R R <Jose.r.r@metztli-it.com>, doiggl@velocitynet.com.au


--nextPart3416446.MYXbIaWIHp
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Monday 28 July 2014 at 10:45:03, Jose R R wrote:=09
> Niltze, doiggl-
>=20
> On Sat, Jul 26, 2014 at 11:49 PM,  <doiggl@velocitynet.com.au> wrote:=

> > Hello,
> > - Run following commands in another terminal while doing a rm comma=
nd in
> > the other.
> > # iotop --only
> > - also does # dmesg show any messages in another terminal
> > --Glenn
> >
> > [1]
> > This command shows only show processes or threads actually doing I/=
O
> > # iotop --help
> >
> > Usage: /usr/sbin/iotop [OPTIONS]
> >
> > DISK READ and DISK WRITE are the block I/O bandwidth used during th=
e
> > sampling
> > period. SWAPIN and IO are the percentages of time the thread spent
> > respectively
> > while swapping in and waiting on I/O more generally. PRIO is the I/=
O
> > priority at
> > which the thread is running (set using the ionice command).
> >
> > Controls: left and right arrows to change the sorting column, r to =
invert
> > the
> > sorting order, o to toggle the --only option, p to toggle the --pro=
cesses
> > option, a to toggle the --accumulated option, i to change I/O prior=
ity, q
> > to
> > quit, any other key to force a refresh.
> >
> > Options:
> >   --version             show program's version number and exit
> >   -h, --help            show this help message and exit
> >   -o, --only            only show processes or threads actually doi=
ng I/O
> >   -b, --batch           non-interactive mode
> >   -n NUM, --iter=3DNUM    number of iterations before ending [infin=
ite]
> >   -d SEC, --delay=3DSEC   delay between iterations [1 second]
> >   -p PID, --pid=3DPID     processes/threads to monitor [all]
> >   -u USER, --user=3DUSER  users to monitor [all]
> >   -P, --processes       only show processes, not all threads
> >   -a, --accumulated     show accumulated I/O instead of bandwidth
> >   -k, --kilobytes       use kilobytes instead of a human friendly u=
nit
> >   -t, --time            add a timestamp on each line (implies --bat=
ch)
> >   -q, --quiet           suppress some lines of header (implies --ba=
tch)
> >
>=20
> Example: Reiser4-formatted /dev/sda10 partition has old data that I
> copied over with (cp -a) but which I now want to remove with (rm -rf)=
.
> From my current Debian system I mount /dev/sda10 to a local mount
> point and do on one shell window:
>=20
> nice rm -rf /mnt/sda10/copied-onto-reiser4-data-dir
>=20
> on another shell I follow your suggestion:
>=20
> iotop --only
>=20
> (output)
> ----------------------------------------------------------
> reiser4: sda10: found disk format 4.0.0.
> reiser4: sda10: using Hybrid Transaction Model.
> reiser4[rm(3352)]: parse_node40
> (fs/reiser4/plugin/node/node40.c:672)[nikita-494]:
> WARNING: Wrong level found in node: 1 !=3D 0

Hello,

this looks like a filesystem corruption.

Could you please run fsck.reiser4 (if needed, with --build-fs switch)
and retry everything this?

If the corruption persists, please, post your kernel version, config
and tell which reiser4 patch have you used.

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /

> reiser4[rm(3352)]: delete_object_cryptcompress
> (fs/reiser4/plugin/file/cryptcompress.c:3734)[edward-430]:
> WARNING: cannot truncate cryptcompress file  425684: -5
> reiser4[rm(3352)]: parse_node40
> (fs/reiser4/plugin/node/node40.c:672)[nikita-494]:
> WARNING: Wrong level found in node: 1 !=3D 0
> reiser4[rm(3352)]: reiser4_cut_tree_object
> (fs/reiser4/tree.c:1790)[nikita-2861]:
> WARNING: failure: -5
> reiser4[rm(3352)]: delete_object_cryptcompress
> (fs/reiser4/plugin/file/cryptcompress.c:3734)[edward-430]:
> WARNING: cannot truncate cryptcompress file  425688: -5
> -----------------------------------------------------------
>=20
> and yet on another shell I execute:
>=20
> dmesg
>=20
> and I take a snapshot:
>=20
> < https://pbs.twimg.com/media/Bto5EF0CYAAhwhQ.png:large >
>=20
> waited 15 minutes but the process nice rm -rf hung -- and executing:
>=20
> kill -9 <process id>
>=20
> does not work either and the system fan strains with the unkillable p=
rocess.
>=20
> Odd? Yes I know, but it only occurs on old data copied over onto a
> newly formatted reiser4 partition. There is no issue with new data
> that I create (say 5GB or more) once my root Debian system is
> operating on a Reiser4 file system.
>=20
>=20
> Best Professional Regards.
>=20
> 
--nextPart3416446.MYXbIaWIHp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPWkooACgkQxUKljSIMAnBcBwEA0XwapS1IxrY++E/vvhBPg/Bv
PqCFkSxcpXwlT9/GeR0BANhSXwUiL73mgd6h6LOil5AcUMJz7fVTX+fmK98jfjgY
=HsFU
-----END PGP SIGNATURE-----

--nextPart3416446.MYXbIaWIHp--

