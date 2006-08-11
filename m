From: Craig Shelley <craig@microtron.org.uk>
Subject: A Word of Warning about Linux Software Raid
Date: Fri, 11 Aug 2006 19:09:46 +0100
Message-ID: <1155319786.8121.43.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-JmoilcXv4B6Jvv2mkjSN"
Return-path: <reiserfs-list-return-29577-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-JmoilcXv4B6Jvv2mkjSN
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi all,

I have a little story that made me learn some very important lessons
about Linux Software Raid1 (Mirroring).

A local power outage caused my system to turn off in a very rough way.
The power didn't cleanly go off, instead it toggled on and off a few
times quickly before finally staying off.

When the power was restored my reiser4 partitions were a bit poorly, and
required some attention with fsck.reiser4.

Ever since this event, reiser4 warnings have often been displayed on the
console on unmount when shutting down/rebooting. Each time I saw the
messages, I ran fsck.reiser4 which sometimes resulted in errors being
found and fixed. Not knowing what partition was causing the problem was
a bit annoying since I have 4 reiser4 partitions.

Yesterday, running fsck.reiser4 resulted in not being able to boot the
system. Further runs of fsck.reiser4 would sometimes result in further
errors being found, and a few minutes later resulted in no errors being
found. At this point I began to wonder if my SATA controller had gone
faulty since the hardware was appearing to be time-variant.

Eventually the problem was diagnosed to be caused by the data on the two
mirrored disks not being identical. It seems that the kernel does not
check the integrity of the data on mirrored raid, and returns a "mix" of
data from each disk as it is accessed. Over time bad shutdowns/crashes
lead to differences between the data on the two mirrored disks, and this
can eventually have catastrophic consequences.


I re-synced the disks using the following commands:  (let me know if
there is a nicer way)

prometheus:~# cat /proc/mdstat
Personalities : [linear] [raid0] [raid1]
md0 : active raid1 hdc1[1] hda1[0]
      4883648 blocks [2/2] [UU]
...

prometheus:~# mdadm --manage --fail /dev/md0 /dev/hdc1
mdadm: set /dev/hdc1 faulty in /dev/md0
prometheus:~# mdadm --manage --remove /dev/md0 /dev/hdc1
mdadm: hot removed /dev/hdc1
prometheus:~# mdadm --manage --add /dev/md0 /dev/hdc1
mdadm: hot added /dev/hdc1

prometheus:~# cat /proc/mdstat
Personalities : [linear] [raid0] [raid1]
md0 : active raid1 hdc1[2] hda1[0]
      4883648 blocks [2/1] [U_]
      [=3D=3D=3D=3D>................]  recovery =3D 22.4% (1098368/4883648)
finish=3D3.0min speed=3D20364K/sec
...


fsck.reiser4 could then be run to properly fix the errors.

I checked several other systems that I admin, and after re-syncing the
mirrored partitions on each system, errors were found on their
filesystems.=20

It would be nice if in a similar way to how the kernel can hot-add disks
to the mirror, copying the data across in the background, that it could
also be told to run a background consistency check on the raid array,
and report/fix errors as it goes.
Are there any tools to do this or similar?

Although this is not a reiser4 issue, I thought it was important that I
make everyone aware of it.

Regards,

--=20
Craig Shelley
EMail: craig@microtron.org.uk
Jabber: shell@jabber.earth.li

--=-JmoilcXv4B6Jvv2mkjSN
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBE3Mfq5OI9vmOoVqERAjqYAKCXUOn7WGcbLv3GNM3SWUp2bV3NBwCfcviS
zUD8vr9arQyItzE5ZUZcmSk=
=WkeY
-----END PGP SIGNATURE-----

--=-JmoilcXv4B6Jvv2mkjSN--

