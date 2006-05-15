From: Christian Trefzer <ctrefzer@gmx.de>
Subject: [FYI]: Two compiler warnings in fs/reiser4/plugin/object.c with gcc-4.1.0
Date: Mon, 15 May 2006 16:53:23 +0200
Message-ID: <20060515145323.GC8977@zeus.uziel.local>
References: <20060515130450.GB8977@zeus.uziel.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Return-path: <reiserfs-list-return-28617-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20060515130450.GB8977@zeus.uziel.local>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Christian Trefzer <ctrefzer@gmx.de>
Cc: reiserfs-list@namesys.com

--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

fs/reiser4/plugin/object.c:120: Warnung: Initialisierung von inkompatiblem =
Zeigertyp
fs/reiser4/plugin/object.c:320: Warnung: Initialisierung von inkompatiblem =
Zeigertyp

(in english: Warning: initialization from incompatible pointer type)

file_plugin file_plugins[LAST_FILE_PLUGIN_ID] =3D {
	[UNIX_FILE_PLUGIN_ID] =3D {
<snip>
		.as_ops =3D {
			.writepage =3D reiser4_writepage,
			.readpage =3D readpage_unix_file,
			.sync_page =3D block_sync_page,
			.writepages =3D writepages_unix_file,
			.set_page_dirty =3D reiser4_set_page_dirty,
			.readpages =3D reiser4_readpages,
			.prepare_write =3D prepare_write_unix_file,
			.commit_write =3D	commit_write_unix_file,
			.bmap =3D bmap_unix_file,
120:		.invalidatepage =3D reiser4_invalidatepage,
			.releasepage =3D reiser4_releasepage
		},
<snip>
	[CRC_FILE_PLUGIN_ID] =3D {
<snip>
		.as_ops =3D {
			.writepage =3D reiser4_writepage,
			.readpage =3D readpage_cryptcompress,
			.sync_page =3D block_sync_page,
			.writepages =3D writepages_cryptcompress,
			.set_page_dirty =3D reiser4_set_page_dirty,
			.readpages =3D reiser4_readpages,
			.prepare_write =3D prepare_write_common,
320:		.invalidatepage =3D reiser4_invalidatepage,
			.releasepage =3D reiser4_releasepage
		},

Another warning mentions _possibly_ uninitialized use of a variable:

fs/reiser4/plugin/space/bitmap.c: In Funktion =BBload_and_lock_bnode=AB:
fs/reiser4/plugin/space/bitmap.c:817: Warnung: =BBcjnode=AB k=F6nnte in die=
ser Funktion uninitialisiert verwendet werden
(=BBcjnode=AB could be used uninitialized in this function)

Kind regards,
Chris

--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iQIVAwUBRGiV412m8MprmeOlAQKRAhAAvMaGhKjNe2Kl7AnBswZJWsTa5eP2vId+
GhAOssdvdUMgMWVK9L6KFN0DkdY605raepLJgCjB8orzpp7oXra8BviJOLTYMT18
gRDpESLlsPwvu81LwQu0xj5IO44EzKuEw7FnOwx1ThPbJ5ChCF9jFyg/MAxaEUVA
spFcDbd5EO2hIjEe4mtbRH4avgohCNuCaVuU+ebzRkna4/jVIU49VGyGlCVRUvre
4ULsywPOsPZH2vXnaMu9zLDbuGCAiHzVsHR9UB9r8LXRuLd7fydoeOkrGbBgVwPm
yDr/9yRXlm1E6+hK2X5tJcTDty8rrgs8xSkMwc9UI8UMo89k32zFTzmUTJx9NSe4
yCPeBpQ2c5Y/HdpZg+k21GDRjJg+30KnGMi2Pnt4PTTS3QRgaHbNCDl9rAY3Deaj
jWeEumQ6d0BHJKF276BhUelRrnoDven0FzBEUDOHQwZJvHMrEkuCPEevJIWwGVL5
dzAf+GSV9UdSjExwSbJNwPbTFXeE6e01ztBm9HEmAMy05tzxdEWQ9G61KYYHleIo
L31U7J5kYVCOGPUSbAgpe+5qVxfmBkDWpp2OQvGKolQG/V/DcZDzMrh6FAAVAAps
gSBLqam50o3ddJIP8VOkpfqTz183heUJRkPf0oYcUOUcwUC5lCtXxUUs4g2R7JLR
Z5z3RSxXH6Y=
=IW+9
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--

