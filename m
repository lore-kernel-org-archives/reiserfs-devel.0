From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: On plugins, on-disk formatting and such
Date: Mon, 12 Apr 2004 12:19:45 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87zn9hjhi6.fsf@uhoreg.ca>
References: <20040410100701.GE5229@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17872-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

>>>>> "Markus" =3D=3D Markus T=F6rnqvist <mjt@nysv.org> writes:

[...]

Markus> 2) Is metadata stored anywhere? If I want to organize all my
Markus> libs in one fibre, I make it so, I reboot and do I then have to
Markus> reset the fibration for the directory? Is it possible to have
Markus> persistency here? Wouldn't a wrong fibration type make the files
Markus> inaccessible?  Is this addressed in the Reiser4 API somehow?

I have a similar question (or possibly the same question, except from a
developer's point of view, rather than a user's):

Are plugins able to request storage space other than what is available
for the file data itself?  I would assume this would be the natural way
to do indexing: store the file contents in the regular fashion, and
keep an index on the side.

And if the answer to that question is yes, then the next question is:
are plugins able to request multiple storage streams (e.g., if it needs
to store multiple indexes)?

--=20
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

