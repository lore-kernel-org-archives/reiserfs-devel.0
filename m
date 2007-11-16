From: Thomas Kuther <gimpel@sonnenkinder.org>
Subject: Re: Reiser4 and loop device problems
Date: Fri, 16 Nov 2007 10:15:32 +0100
Message-ID: <20071116101532.15b3e02d@sirius>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pbZ50ShBm5XZhVTm=hpW213";
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org

--Sig_/pbZ50ShBm5XZhVTm=hpW213
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable


Silly me had the file mounted - forget I mentioned that one could not
fsck reiser4 files.
My apologies.


On 11/16/07, Christopher Sawtell <csawtell@gmail.com> wrote:
> On 11/16/07, Thomas Kuther <gimpel@sonnenkinder.org> wrote:
> > On Fr, 16.11.07 12:02 "Christopher Sawtell" <csawtell@gmail.com>
> > wrote:
> >
> > > > > Can you remember the last kernel that worked?
> > > > >
> > > > > Thanks
> > > > >
> > > > > Dushan
> > > >
> > > > Unfortunately not for sure. I'm not even sure if it ever worked
> > > > at all, to be honest. There were some old threads from 2003
> > > > saying that loop is not supported (yet). Did that ever change?
> > >
> > > Yes.
> > >
> > > imogen ~ # uname -r
> > > 2.6.22.9
> > > imogen ~ # cd /media/Isos/Debian/
> > > imogen Debian # mount -o loop -t iso9660
> > > Debian-Etch-4.0-r1-Binary-1-20070819.iso /mnt/tmp
> > > imogen Debian # ls /mnt/tmp
> > > README.html          README.txt   debian  install      md5sum.txt
> > > tools README.mirrors.html  autorun.bat  dists   install.386  pics
> > > README.mirrors.txt   autorun.inf  doc     isolinux     pool
> > >
> > > But it's broken for linux-2.6.23.1
> > >
> > > If I can be of any further assistance, please do not hesitate to
> > > ask.
> > >
> >
> > So which version of reiser4 patch, progs etc do you use?
> >
> > Edward wrote, it never did. Now.. WTF? :)
>
> Odd isn't it, but the attached log is a pretty convincing
> demonstration to me, and it will mount .iso files fine too. Somebody
> must have corrected what turned out to be a tiny bug and never
> documented it.
>
> However you cannot fsck.reiser4 the filesystem in the file:-
> imogen tester # fsck.reiser4 --check opt.img
> Fatal: The partition (opt.img) is mounted with write permissions,
> cannot fsck it.
> imho that should be fixed sometime.
>
> The patch against 2.6.22.9 is reiser4-for-2.6.22-2.patch.gz
>        size: 619987
> md5sum: f7060338c6b3f59a8b6aeee59e15f7a5
>
> The patch against linux-2.6.23.1 is reiser4-for-2.6.23.patch.bz2
>       size: 447704
> md5sum: 818328d0e50fc90f05832e680562dd4a
>
> ( Just so we all know exactly what I'm doing :-)
>
> The utility programs are reiser4progs-1.0.6.tar.gz
>       size: 799613
>
> btw, There was a bug which showed up if you tried to over fill the
> file system using either bittorrent or rsync. The filesystem used to
> get seriously discombobulated. I haven't been game to try to trigger
> it recently.
>
> Has that been been fixed?
>
> --
> Sincerely etc.
> Christopher Sawtell
>


--=20
Sincerely etc.
Christopher Sawtell

--Sig_/pbZ50ShBm5XZhVTm=hpW213
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)

iD8DBQFHPV+8MQFfAqZTGfwRAgmtAKCN2ovqV1eXvN3RwkOBvk63qIOXggCfdx0d
5uyysORaP2OQ4Zsoazb+fJA=
=VN3X
-----END PGP SIGNATURE-----

--Sig_/pbZ50ShBm5XZhVTm=hpW213--
