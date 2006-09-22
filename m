From: Thomas Kuther <gimpel@sonnenkinder.org>
Subject: Re: r4 observations
Date: Fri, 22 Sep 2006 14:49:30 +0200
Message-ID: <20060922144930.64117aaf@SiRiUS.home>
References: <ees2cj$15h$1@sea.gmane.org>
	<200609211502.01497.vs@namesys.com>
	<eetseh$vjq$2@sea.gmane.org>
	<20060922140244.33865730@SiRiUS.home>
	<ef0kra$aqj$3@sea.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary=Sig_aA79tHrUmwGMMQAgAFCDWZQ;
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <reiserfs-list-return-29972-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ef0kra$aqj$3@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Sig_aA79tHrUmwGMMQAgAFCDWZQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 22 Sep 2006 12:27:23 +0000 (UTC)
"Peter" <sw98234@hotmail.com> wrote:

> On Fri, 22 Sep 2006 14:02:44 +0200, Thomas Kuther wrote:
>=20
> > On Thu, 21 Sep 2006 11:18:41 +0000 (UTC)
> > "Peter" <sw98234@hotmail.com> wrote:
> >=20
> >> On Thu, 21 Sep 2006 15:02:01 +0400, Vladimir V. Saveliev wrote:
> >>=20
> >> > Hello
> >> >=20
> >> > On Wednesday 20 September 2006 22:47, Peter wrote:
> >> >> I booted from a non-reiser4 partition in order to make a backup
> >> >> of my main / which was a r4 partition.
> >> >>=20
> >> >> After the backup, I unmounted the drive explicitly, then
> >> >> rebooted.
> >> >>=20
> >> >> I did not use the backed up drive for anything except tar-ring
> >> >> its files.
> >> >>=20
> >> >> On next boot to the r4 / partition, all kinds of file not found
> >> >> errors occurred. I booted again to my non-r4 partition, and ran
> >> >> fsck.reiser4 --check -y there were fatal errors on my r4 /.
> >> >>=20
> >> >> The backup was fine. I downgraded back to reiserfs which does
> >> >> not exhibit this problem.
> >> >>=20
> >> >> I have not experienced any problem with other r4 partitions.
> >> >> Just /. /home, /tmp, /src, etc. are fine.
> >> >>=20
> >> >> Unfortunately, I don't have time to keep wondering where the
> >> >> problem is or why. Perhaps it's the kernel or the init scripts.
> >> >> Nonetheless, the instability of whatever the problem is is
> >> >> unnerving.
> >> >>=20
> >> >=20
> >> > Please provide information about which kernel and which reiser4
> >> > did you use. Am I correct that you were trying to run gentoo on
> >> > reiser4?
> >>=20
> >> Yes, Vladimir. When making the backup, I was not running Gentoo at
> >> all. I was running Slackware 10.2. I booted into Slackware with the
> >> beyond patchset (ck superset) based on 2.6.17.11 with the reiser4
> >> 2.6.17-3 patch. All of the work on backup mount and unmount was on
> >> Slackware. It was when rebooting back into Gentoo (with the init
> >> and base layout which DID NOT CAUSE a boot problem) that the fatal
> >> errors occurred. Interestingly, and maybe this is helpful, only
> >> the / partition seems to be affected. I have observed no
> >> problematic behavior with any of the other three partitions I used
> >> r4 for. In fact, even though I downgraded / to reiserfs3, the
> >> other r4 partitions work fine. Please let me know if I can provide
> >> additional information.
> >>=20
> >=20
> > 2.6.17-beyond includes -ck1 which includes fcache which is totally
> > evil for reiser4. The old fscache patch in .17-ck1 tends to kill
> > reiser4 /usr here (I assume your /usr is in / then) when
> > rebooting/umounting the partition. Also newer -mm is evil and
> > umount on /usr completely fails here, i have to hard reset the box,
> > but here the partitions stay alive, with the older fcache i had to
> > --build-sb and --fix it, and then remerge all stuff that was lost.
> > Oh and this happens even i didn't enable fcache in kernel config,
> > just the existance of the patch is enough.
> > Strangely it's reproducably and only /usr. So if you run the /usr
> > folder on a reiser4 partition, do NOT use -mm, or at least good luck
> > trying to break out fcache. Reversing the fcache patch from -beyond
> > is easy, just get the broken-out from -ck and patch -R it.
> >=20
> > HTH
> > Tom
>=20
> Thanks for the tip, Tom! You're the second person (unless you're the
> same one on the gentoo forums) to mention this. I suspect, with your
> use of the word evil, you're the same! :)
>=20
> Nonetheless, I lost patience, and did not want to be in a changing
> beta situation as kernels, patches, etc. are all changing at
> different rates of speed. I found this bug both annoying and
> disconcerting. I have one r4 partition left, and since it's not /
> there appear to be no problems.
>=20
> I assume the various parties involved are all aware of this?
>=20

Yes, that was me :)
As i seemed to be the only person hitting that bug, i didn't mention it
here on the list nor on LKML. I just warned the users in the -beyond
and -no sources threads some releases ago ... .17-beyond1 thread
IIRC... and stopped using fcache patched kernels, because i like
my /usr/portage flying on a reiser4 partition ;)

Regards
Tom

--Sig_aA79tHrUmwGMMQAgAFCDWZQ
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFFE9vaaMf8HmTow1YRAmqIAKCWiGFkRUP4iXimODzgU4b91MrMHACgmMd1
FPoiN0U6qHHX4cj1Qs+4qn0=
=jZFR
-----END PGP SIGNATURE-----

--Sig_aA79tHrUmwGMMQAgAFCDWZQ--
