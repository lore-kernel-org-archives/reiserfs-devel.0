From: Thomas Kuther <gimpel@sonnenkinder.org>
Subject: Re: Reiser4 and loop device problems
Date: Fri, 16 Nov 2007 10:14:43 +0100
Message-ID: <20071116101443.08b3919e@sirius>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6oQKqfME2oES7fma3lfZy8s";
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org

--Sig_/6oQKqfME2oES7fma3lfZy8s
Content-Type: multipart/mixed; boundary="MP_/Z=zuX=kMc52xwk3ycpRuNCA"

--MP_/Z=zuX=kMc52xwk3ycpRuNCA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

FWD to list.

On 11/16/07, Thomas Kuther <gimpel@sonnenkinder.org> wrote:
> On Fr, 16.11.07 12:02 "Christopher Sawtell" <csawtell@gmail.com>
> wrote:
>
> > > > Can you remember the last kernel that worked?
> > > >
> > > > Thanks
> > > >
> > > > Dushan
> > >
> > > Unfortunately not for sure. I'm not even sure if it ever worked at
> > > all, to be honest. There were some old threads from 2003 saying
> > > that loop is not supported (yet). Did that ever change?
> >
> > Yes.
> >
> > imogen ~ # uname -r
> > 2.6.22.9
> > imogen ~ # cd /media/Isos/Debian/
> > imogen Debian # mount -o loop -t iso9660
> > Debian-Etch-4.0-r1-Binary-1-20070819.iso /mnt/tmp
> > imogen Debian # ls /mnt/tmp
> > README.html          README.txt   debian  install      md5sum.txt
> > tools README.mirrors.html  autorun.bat  dists   install.386  pics
> > README.mirrors.txt   autorun.inf  doc     isolinux     pool
> >
> > But it's broken for linux-2.6.23.1
> >
> > If I can be of any further assistance, please do not hesitate to
> > ask.
> >
>
> So which version of reiser4 patch, progs etc do you use?
>
> Edward wrote, it never did. Now.. WTF? :)

Odd isn't it, but the attached log is a pretty convincing
demonstration to me, and it will mount .iso files fine too. Somebody
must have corrected what turned out to be a tiny bug and never
documented it.

However you cannot fsck.reiser4 the filesystem in the file:-
imogen tester # fsck.reiser4 --check opt.img
Fatal: The partition (opt.img) is mounted with write permissions,
cannot fsck it.
imho that should be fixed sometime.

The patch against 2.6.22.9 is reiser4-for-2.6.22-2.patch.gz
       size: 619987
md5sum: f7060338c6b3f59a8b6aeee59e15f7a5

The patch against linux-2.6.23.1 is reiser4-for-2.6.23.patch.bz2
      size: 447704
md5sum: 818328d0e50fc90f05832e680562dd4a

( Just so we all know exactly what I'm doing :-)

The utility programs are reiser4progs-1.0.6.tar.gz
      size: 799613

btw, There was a bug which showed up if you tried to over fill the
file system using either bittorrent or rsync. The filesystem used to
get seriously discombobulated. I haven't been game to try to trigger
it recently.

Has that been been fixed?

--=20
Sincerely etc.
Christopher Sawtell

--MP_/Z=zuX=kMc52xwk3ycpRuNCA
Content-Type: text/plain; name=showit
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=showit

imogen media # mkdir tester
imogen media # cd $_
imogen tester # dd if=3D/dev/hda8 of=3Dopt.img
4883697+0 records in
4883697+0 records out
2500452864 bytes (2.5 GB) copied, 185.435 s, 13.5 MB/s
imogen tester # mount
/dev/hda3 on / type ext2 (rw,noatime)
proc on /proc type proc (rw,nosuid,nodev,noexec)
sysfs on /sys type sysfs (rw,nosuid,nodev,noexec)
udev on /dev type tmpfs (rw,nosuid)
devpts on /dev/pts type devpts (rw,nosuid,noexec)
/dev/hda5 on /usr type reiser4 (rw)
/dev/hda6 on /home type reiser4 (rw)
/dev/hda7 on /var type reiser4 (rw)
/dev/hda8 on /opt type reiser4 (rw)
/dev/hda9 on /media type reiser4 (rw)
shm on /dev/shm type tmpfs (rw,noexec,nosuid,nodev)
usbfs on /proc/bus/usb type usbfs (rw,noexec,nosuid,devmode=3D0664,devgid=
=3D85)
nfsd on /proc/fs/nfs type nfsd (rw,noexec,nosuid,nodev)
/dev/hda1 on /boot type ext2 (rw,noatime)
imogen tester # mount -o loop -t reiser4 opt.img /mnt/tmp
imogen tester # ls -l /mnt/tmp/
total 6
drwxr-xr-x 4 root root  5 Aug 12 19:34 Acrobat7
drwxr-xr-x 9 root root 11 Aug 28 18:30 RealPlayer
drwxr-xr-x 2 root root 13 Dec 19  2003 adobesvg-3.01
drwxr-xr-x 2 root root  3 Aug 12 19:34 bin
drwxr-xr-x 2 root root  2 Oct 11 22:18 lost+found
drwxr-xr-x 4 root root  4 Aug  8 01:30 netscape
drwxr-xr-x 7 root root  8 Sep 22 11:20 sun-jdk-1.5.0.12
drwxr-xr-x 7 root root  8 Oct  4 23:29 sun-jdk-1.6.0.03
drwxr-xr-x 8 root root  8 Oct 16 02:03 sun-jre-bin-1.6.0.03


--MP_/Z=zuX=kMc52xwk3ycpRuNCA--

--Sig_/6oQKqfME2oES7fma3lfZy8s
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)

iD8DBQFHPV+IMQFfAqZTGfwRAj66AJ4g9HpNVd67/l1cGJwlmmGL/NOq1QCfQoBS
09se7+BaD4C5iyXZG8LNLcc=
=pVH1
-----END PGP SIGNATURE-----

--Sig_/6oQKqfME2oES7fma3lfZy8s--
