From: Robert Walsh <rjwalsh@durables.org>
Subject: Journal writes hanging in presence of I/O errors
Date: 08 Aug 2002 10:48:49 -0700
Message-ID: <1028828929.9189.25.camel@spoon.durables.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-fUrBOYPhJ11GvQW8FI+9"
Return-path: <reiserfs-list-return-11143-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: Bryan O'Sullivan <bos@serpentine.com>

--=-fUrBOYPhJ11GvQW8FI+9
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

I'm having a problem with journal writes hanging in the presence of an
I/O error.  I've verified that the block device driver is calling
bh->b_end_io with uptodate set to 0 whenever this I/O error occurs.  The
process doing the write sits in the 'D' state.  Here's its call trace:

  Trace; c0114aca <sleep_on+4a/6c>
  Trace; c01b70b4 <do_journal_begin_r+5c/230>
  Trace; c01b72ce <journal_begin+2a/30>
  Trace; c01a1c6d <reiserfs_get_block+1b9/de8>
  Trace; c011beec <bh_action+4c/84>
  Trace; c011bdcd <tasklet_hi_action+6d/9c>
  Trace; c011bb51 <do_softirq+71/cc>
  Trace; c010890b <do_IRQ+db/ec>
  Trace; c013aa3f <__block_prepare_write+15b/344>
  Trace; c013b382 <block_prepare_write+22/78>
  Trace; c01a1ab4 <reiserfs_get_block+0/de8>
  Trace; c01a46d5 <reiserfs_prepare_write+61/68>
  Trace; c01a1ab4 <reiserfs_get_block+0/de8>
  Trace; c012af65 <generic_file_write+4e9/7dc>
  Trace; c0137bce <sys_write+92/110>
  Trace; c010705f <system_call+33/38>

It never exits from that sleep_on.  I believe it's sleeping on
j_join_wait, but I'm not familiar enough with the reiserfs code to be
100% certain of that, or of who's meant to wake us up.

BTW: I'm using bonnie to test the filesystem when this is happening.=20
When I use 'dt' to test the block device on its own, it does indeed exit
with an error when the I/O error occurs.  I'm using a logical volume
manager that I can inject faults into in order to test filesystem and
driver behavior.

Any ideas?  The ideal behavior would be that the write system call just
fails with EIO.

Regards,
 Robert.

--=20
Robert Walsh
Amalgamated Durables, Inc.  -  "We don't make the things you buy."
Email: rjwalsh@durables.org

--=-fUrBOYPhJ11GvQW8FI+9
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA9Uq8BbZtqSALM5CYRApsXAKDnvvA6GbkiqLmtTQghvh+KLwc8MQCeMKTI
Uikhjmmf6jHWQscoNScZOac=
=mrOE
-----END PGP SIGNATURE-----

--=-fUrBOYPhJ11GvQW8FI+9--

