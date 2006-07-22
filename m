From: Mike Benoit <ipso@snappymail.ca>
Subject: Re: reiser4 status (correction)
Date: Sat, 22 Jul 2006 12:56:13 -0700
Message-ID: <1153598173.6659.219.camel@ipso.snappymail.ca>
References: <44BFFCB1.4020009@namesys.com> <44C043B5.3070501@slaphack.com>
	 <44C093D2.1040703@namesys.com>
	 <1153514509.6659.41.camel@ipso.snappymail.ca>
	 <44C141C4.1030802@slaphack.com>
	 <1153517853.6659.56.camel@ipso.snappymail.ca>
	 <44C157D2.5060202@slaphack.com>
	 <1153525982.6659.108.camel@ipso.snappymail.ca>
	 <44C191FD.4010302@slaphack.com>  <44C1BD65.8070204@namesys.com>
	 <1153558557.6659.152.camel@ipso.snappymail.ca>
	 <44C21B3A.9050000@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-yVT18hvv0p3Vo2E9kDcu"
Return-path: <reiserfs-list-return-29146-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44C21B3A.9050000@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>

--=-yVT18hvv0p3Vo2E9kDcu
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2006-07-22 at 07:34 -0500, David Masover wrote:

> The compression will probably mostly be about speed.  Remember, if
> we're=20
> talking about people who want to see tangible, visceral results,
> we're=20
> probably also talking about end-users.  And trust me, the vast
> majority=20
> of most of my data (as an end-user) is not very compressible.
>=20

Sure, mine too. Between the many gigs of MP3s and movies I have stored
on my HD, only about 10-20GB is the OS, Email, and documents/source
code. Even just compressing that small portion though I could probably
save between 5-10GB. The difference is though I can do a df before, and
a df after, and I can instantly see I got my moneys worth. Same with
encryption.=20

With the repacker it is much more difficult (for average users) to time
how long a program takes to load some file (or launch), before the
repacker and after. Especially since caching comes in to play.=20

Also, according to this little poll on one of the compressed FUSE sites
you linked to, more people are looking to compression for space saving,
then for speed:
http://parallel.vub.ac.be/~johan/compFUSEd/index.php?option=3Dpolls&task=3D=
results&pollid=3D31


>=20
> No, mostly we're talking about things like office documents, the=20
> majority of which fit in less than a gigabyte, and multimedia (music,=20
> movies, games) which will gain very little from compression.  If=20
> anything, the benefit would be mostly in compressing software.
>=20
> > less tangible like fragmentation percentages and minor I/O throughput
> > improvements. I used to work at a large, world wide web hosting company
> > and I could see making a case to management for purchasing Reiser4
> > compression would be pretty easy for our shared servers. Instantly
> > freeing up large amounts of disk space (where .html/.php files were the
> > vast majority) would save huge amounts of money on disk drives,
> > especially since most of the servers used RAID1 and adding new drives
> > was a huge pain in the neck. Making a case to purchase a repacker would
> > be much, much more difficult.
>=20
> Hmm, the problem is, if storage space is really the big deal, it's been=20
> done before, and some of these efforts are still usable and free:
>=20
> http://parallel.vub.ac.be/~johan/compFUSEd/
> http://www.miio.net/fusecompress/
> http://north.one.pl/~kazik/pub/LZOlayer/
> http://apfs.humorgraficojr.com/apfs_ingles.html
>=20
> And while we're on the topic, here's an FS that does unpacking of=20
> archives, probably about the same way we imagined it in Reiser4=20
> pseudofiles/magic:
>=20
> http://www.nongnu.org/unpackfs/
>=20
> But regardless, as far as I can tell, the only real, tangible benefit of=20
> using Reiser4 compression instead of one of those four FUSE filesystems=20
> is speed.  Reiser4 would compress/decompress when actually hitting the=20
> disk, not just the FS, and it would also probably use in-kernel=20
> compression, rather than calling out to userspace on every FS operation.
>=20
> But you see, if you're talking about speed, 10% is a respectably big=20
> improvement, so I could see selling them on a repacker at the same time.
>=20

Most of those FUSE file systems you linked to scare me. This is from the
APFS web page:

"Permissions do not work!
Do not worry, it is not your fault, permissions are not implemented yet.
It is like all files had rwxrwxrwx mode.

I have lost all my data! How do I get it back?
=46rom the backup, obviously."

FUSE is great, but can it even come close to matching the performance of
in-kernel file systems? Not only that, but if you want to compress a
directory you have to go through about a 12 step process of moving the
files, setting up a mount point, and moving the files back.=20

Will Reiser4 not allow us to mount with compression enabled then
enable/disable compression on a per file/per directory basis?=20


> Maybe bundles are a good idea...
> Maybe there should be a Reiser4 Whitepaper Value Pack, once everything=20
> on the whitepaper is done?
>=20
> > See, customers who used lots of CPU were easy to up-sell to a dedicated
> > server because page load times were tangible and if they didn't move we
> > would be forced to shut them off. However customers who used gobs of
> > disk space were much more difficult to up-sell to dedicated servers
> > because it didn't affect themselves or other customers in a tangible
> > way. They wouldn't notice any difference by moving to a much more
> > expensive dedicated server.
>=20
> Sounds like more a marketing problem than a technical one.  Couldn't you=20
> just charge more on the virtual server?  Or start charging by the megabyt=
e?

You could, and we did charge by the megabyte, only after they exceeded
the limit of their package. However web hosting is a fiercely
competitive market, so we were constantly adjusting our packages to
include more disk space, more bandwidth, more features for the same
amount, or lower prices, just to compete. The way many "shared hosting"
companies work is each server is waaay over sold, at least in the disk
space department. We would have anywhere from 500-1500 accounts on one
server, usually with only one or two 80-120GB SCSI RAID1 arrays, if the
average package offered 500MB of disk space, the vast majority of
customers couldn't even come close to reaching their maximum disk usage.
Thats pretty much the only way you make money with $10-20/month
packages.

If you add up the cost of SCSI drives (x2 for RAID), SCSI controllers,
replacement costs every 2-3yrs, the time to install them, you could
easily charge $100/server for the compression plugin. It would pretty
much be a no brainer for a huge number of the web hosting companies out
there to go this route. The company I worked for probably wouldn't blink
an eye at dropping $5K to equip just one of its many data centers. If
Namesys offered "site licensing", I could see installing compression on
our customers dedicated servers as a value added service that they could
profit from also.

Compression would be a huge win for these companies, especially since
90% of the data on these servers is HTML/PHP/PERL files that change very
rarely.=20

I don't doubt the benefits of the repacker, but from a business
perspective the repacker is something that runs transparently in the
background, once you install it, things magically speed up then you
never hear from it again as it does its job. Out of sight, out of mind.
Whereas the compression/encryption plugin are always in your face, every
time you run df, or enter a passphrase to gain access to your files, you
know its there and working. Its something you'll tell your friends
about. After you first run it, the repacker just fades away in to the
background and you forget about it.

Charging only for commercial use of the repacker/compression/encryption
plugin would be a great middle ground.=20

--=20
Mike Benoit <ipso@snappymail.ca>

--=-yVT18hvv0p3Vo2E9kDcu
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBEwoLcMhKjsejwBhgRAvfzAJ9NOaRRG9ll8QJ3DYm10Xot2jWWuACgoYpZ
lAfS6RUxpOgEeedvP4ERXnU=
=+vQt
-----END PGP SIGNATURE-----

--=-yVT18hvv0p3Vo2E9kDcu--

