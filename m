From: Craig Shelley <craig@microtron.org.uk>
Subject: Reiser 4: Disk Full - Denial of service
Date: Sat, 09 Jul 2005 11:51:23 +0100
Message-ID: <1120906283.6468.12.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-yXJnc9Vd+tmvr8FW6EK2"
Return-path: <reiserfs-list-return-25071-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-yXJnc9Vd+tmvr8FW6EK2
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I just filled up my / partition and this happened:

teratron:/usr/src/kernel/build# ls
bash: /bin/ls: No space left on device

teratron:/usr/src/kernel/build# ls /tmp
bash: /bin/ls: No space left on device

teratron:/usr/src/kernel/build# rm *
bash: /bin/rm: No space left on device

teratron:/usr/src/kernel/build# dmesg
bash: /bin/dmesg: No space left on device

The system was practically useless, unable to spawn any new processes
until some small files were deleted from /tmp using an already running
process (nautilus)
Also, during the the time while the partition was full, the hard disk
was crunching (due to activity) with a regular rhythm.

After recovering from the situation by deleting some files, dmesg
showed:

reiser4[evolution-2.0(8323)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
WARNING: Partial conversion of 1137618: 0 of 4: -28
reiser4[evolution-2.0(8323)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
WARNING: Failed to convert in release_unix_file (1137618)
reiser4[evolution-2.0(8323)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
WARNING: Partial conversion of 1137588: 0 of 2: -28
reiser4[evolution-2.0(8323)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
WARNING: Failed to convert in release_unix_file (1137588)
reiser4[evolution-2.0(8323)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
WARNING: Partial conversion of 1137587: 0 of 2: -28
reiser4[evolution-2.0(8323)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
WARNING: Failed to convert in release_unix_file (1137587)
reiser4[evolution-2.0(8323)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
WARNING: Partial conversion of 1231393: 0 of 3: -28
reiser4[evolution-2.0(8323)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
WARNING: Failed to convert in release_unix_file (1231393)
reiser4[evolution-2.0(8323)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
WARNING: Partial conversion of 1137586: 0 of 2: -28
reiser4[evolution-2.0(8323)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
WARNING: Failed to convert in release_unix_file (1137586)
reiser4[evolution-2.0(8323)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
WARNING: Partial conversion of 1137738: 0 of 2: -28
reiser4[evolution-2.0(8323)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
WARNING: Failed to convert in release_unix_file (1137738)
reiser4[evolution-2.0(8323)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
WARNING: Partial conversion of 1376045: 0 of 3: -28
reiser4[evolution-2.0(8323)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
WARNING: Failed to convert in release_unix_file (1376045)
reiser4[evolution-2.0(8323)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
WARNING: Partial conversion of 1231374: 0 of 4: -28
reiser4[evolution-2.0(8323)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
WARNING: Failed to convert in release_unix_file (1231374)
reiser4[evolution-2.0(8323)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
WARNING: Partial conversion of 1231373: 0 of 2: -28
reiser4[evolution-2.0(8323)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
WARNING: Failed to convert in release_unix_file (1231373)
reiser4[camel-lock-help(31217)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
WARNING: Partial conversion of 1231379: 0 of 3: -28
reiser4[camel-lock-help(31217)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
WARNING: Failed to convert in release_unix_file (1231379)

Keep up the amazing work, and good luck with the merge!
--=20
Craig Shelley
EMail: craig@microtron.org.uk
Jabber: shell@jabber.earth.li

--=-yXJnc9Vd+tmvr8FW6EK2
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBCz6wr5OI9vmOoVqERAjiPAJ9rCjJJnyiEEc0Uhr8tXqIMEWITCgCfayoq
Y65cLoPxeTIwOBpTiPzv64I=
=2kjz
-----END PGP SIGNATURE-----

--=-yXJnc9Vd+tmvr8FW6EK2--

