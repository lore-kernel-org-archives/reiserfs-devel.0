From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: Debian and non-free
Date: Sun, 25 Apr 2004 19:47:32 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <874qr7y60b.fsf@uhoreg.ca>
References: <20040425145238.GQ19049@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18218-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

>>>>> "Markus" =3D=3D Markus T=F6rnqvist <mjt@nysv.org> writes:

Markus> Hi IANADD and all that, so where can I read about why Reiser4 is
Markus> unsuitable for even non-free?

debian-legal mailing list.

Markus> The way I read the license of Reiser4 is that it's GPL but one
Markus> can write plugins, derivative works of GPL, but keep the sources
Markus> by paying money?

Yes.  Namesys is allowed to dual-license their code, since they own it
(and/or have been assigned the copyright by those who wrote it).  So if
the GPL is not suitable for a company, then they can give Namesys
money, and obtain an alternative license.

This is the same as what TrollTech does with the Qt library.  (As well
as a few other companies, with their software.)

Or companies can just keep the binary, and their sources, private
i.e. for internal use only.  That kind of use is allowed by the GPL.

Markus> This seems like an internal conflict in the license itself;
Markus> without having paying money as a forced bribe of sorts to keep
Markus> the source closed, it would seem like a BSD-style license. BSD
Markus> should be ok by Debian Free even.

I don't understand what you are saying here.  BSD is much more
permissive than GPL.

Markus> So why is it disqualified?

Some people have reservations with some of the clarifications to the
GPL that Namesys has added.  (I have not read the clarifications in
detail, and I don't follow d-legal (yet), so I can't comment.)

Markus> Debian is often seen as the distro for people who like stability
Markus> and security.  Reiser4 has stabilized by the bucket and at
Markus> latest views will bring along the strictest of security.

Debian is also very well known for being picky about copyright and
freedom.

Markus> It would be a shame if Debian users, such as I, would have to
Markus> continue bootstrapping Debian onto Reiser4 instead of just
Markus> installing.  And there are a lot of Debian users out there as a
Markus> target audience.

Markus> Does Debian have anything against third party installers which
Markus> would use Reiser4? Probably not?

No.  There are many Debian-based distros, such as Knoppix, Libranet,
Lindows (or whatever it's called today), etc.  Debian has nothing
against them, and sometimes even encourages them (especially if they
contribute back to the community.)

Markus> Considering the centuries it would take for Debian to validate
Markus> Reiser4 for installer-inclusion.

I actually wouldn't be surprised if the installer for sarge+1 included
Reiser4.  All that's really needed is for Reiser4 to get into the
stable kernel, and someone to write (good) support for debian-installer.

--=20
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

