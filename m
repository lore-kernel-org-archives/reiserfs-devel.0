From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: Carrying Attributes too Far
Date: Sat, 13 Sep 2003 23:53:44 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87d6e4t48n.fsf@labatt.uhoreg.ca>
References: <3F60925F.9000004@namesys.com> <3122307789-BeMail@cr593174-a>
 <20030914015610.GB26701@matchmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <reiserfs-list-return-15663-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com


>>>>> "Mike" =3D=3D Mike Fedyk <mfedyk@matchmail.com> writes:

[...]

Mike> Please concentrate on cross platform file formats.

Nah, this is a filesystems list.  We don't care about file formats. ;-)

Actually, most of the important data will probably still remain in the
file itself, but Reiser4 will use a plugin to extract attributes.  If
the file format supports attributes.  If not, then when you transfer
the file, the recipient wouldn't have gotten the attributes anyways.

Mike> How is this going to be exported with nfs or samba?

My preference would be to make Reiser5 a distributed filesystem, and
make it work under Windows and Mac.  But that's just me.  Life will be
much nicer after Reiser[4|5|6] takes over the world.  ;-)

[...]

>> I'd also like to attach a BeOS style MIME type attribute to
>> everything,

Mike> So now you have to read an attribute just to find out that it's a
Mike> text file, once for each file.  Talk about performance...

Mike> Compare that to just reading the directory listing once.

You must have a magic ls.  My ls doesn't tell me which files are plain
text/binary data/images/audio/etc.

=2D-=20
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/Y+ZMrynHGRJLYfoRAmUQAJ9w1KwHYu7TSRUONi5AlsnsmmD23wCcDBhl
gQ/3E+MUazzyKH1pe60Uw7A=
=nyi2
-----END PGP SIGNATURE-----
--=-=-=--

