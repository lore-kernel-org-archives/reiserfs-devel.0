From: Thomas Kuther <gimpel@sonnenkinder.org>
Subject: Re: Reiser4 and loop device problems
Date: Thu, 15 Nov 2007 23:10:53 +0100
Message-ID: <20071115231053.5066b94e@sirius>
References: <20071115224457.2202be3e@sirius>
	<a08621850711151349m6ae91e74led14485dd41c2f8f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I9qju7sG.JF_b7wE1OJYt+f";
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <a08621850711151349m6ae91e74led14485dd41c2f8f@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org

--Sig_/I9qju7sG.JF_b7wE1OJYt+f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Do, 15.11.07 22:49 "Dushan Tcholich" <dusanc@gmail.com> wrote:

> Can you remember the last kernel that worked?
>=20
> Thanks
>
> Dushan

Unfortunately not for sure. I'm not even sure if it ever worked at all,
to be honest. There were some old threads from 2003 saying that loop is
not supported (yet). Did that ever change?

Regards,
Tom

=20
> On Nov 15, 2007 10:44 PM, Thomas Kuther <gimpel@sonnenkinder.org>
> wrote:
> > Hi,
> >
> > in recent reiser4 it is not possible to loopback mount a file
> > located on a reiser4 partition
> >
> > * kernel 2.6.24-rc2-git5
> > * reiser4progs 1.0.6
> > * reiser4 from 2.6.24-rc2-mm1with following series
> >
> >         sync_sb_inodes-propagate-errors.patch
> >         reiser4-sb_sync_inodes.patch
> >         reiser4-export-remove_from_page_cache.patch
> >         reiser4-export-find_get_pages.patch
> >         make-copy_from_user_inatomic-not-zero-the-tail-on-i386-vs-reise=
r4.patch
> >         reiser4.patch
> >         jens-broke-reiser4patch-added-to-mm-tree.patch
> >
> > * filsystem created with
> >         $ mkfs.reiser4
> > * mounted with noatime
> > * no cryptcompress or anything non-default
> >
> > $ mount -o loop -t
> > iso9660 /tmp/systemrescuecd-x86-0.4.0.iso /mnt/cdrom ioctl:
> > LOOP_SET_FD: Invalid argument
> >
> > Regards,
> > Tom
> >

--Sig_/I9qju7sG.JF_b7wE1OJYt+f
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)

iD8DBQFHPMPyMQFfAqZTGfwRAiVdAJ44U2j5KEhaJs2dSD5pQ/143xo0NQCePCoz
gyn0mIPRj4r8U/+5P07eUDU=
=4mK+
-----END PGP SIGNATURE-----

--Sig_/I9qju7sG.JF_b7wE1OJYt+f--
