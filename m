From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: reiser4progs 0.5.4 for Debian
Date: Tue, 08 Jun 2004 22:28:21 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <871xkppire.fsf@uhoreg.ca>
References: <20040603194120.GD4990@nysv.org> <20040607193305.GA4854@raptus.homelinux.org>
 <20040607200203.GL4990@nysv.org> <ca4168$342$1@sea.gmane.org>
 <20040608184559.GM4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19108-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

License> "Finally, nothing in this license shall be interpreted to allow
License> you to fail to fairly credit me, or to remove my credits such
License> as by creating a front end that hides my credits from the user
License> or renaming mkfs.reiser4"

>>>>> "Markus" =3D=3D Markus T=F6rnqvist <mjt@nysv.org> writes:

Markus> On Tue, Jun 08, 2004 at 03:02:32PM +0530, Amit Shah wrote:
Amit> This isn't DFSG-free.

Markus> So is the case that Debian must somehow say they will honor
Markus> Hans' request to make it GPL/DFSG free?

No.  Debian's actions do not affect the DFSG free-ness of a license.

Markus> Well.. how can it not be DFSG free if it says that it's GPLv2

It is GPLv2 with "clarifications".

Markus> and Stallman agrees with what Hans said?

Stallman agrees with Hans' right to dual-/triple-/etc. license.  I
haven't heard his opinion on disallowing the removal or hiding of
credits.  Disallowing the removal of copyright notices is a standard
restriction, but credits isn't that clear.

Disallowing the renaming of mkfs.reiser4 could be a problem -- if
someone writes a hobby filesystem from scratch (or based on some ideas
from Reiser4), but uses significant (or even insignificant, but still
enough for copyright to be claimed) code from mkfs.reiser4, he may be
compelled to keep his program named "mkfs.reiser4", even though his
filesystem is not compatible in any way with Reiser4.  This violates
DFSG clause 3 ("Derived works").

IANAL, but to me, disallowing creating a frontend that hides the
credits seems more like a _use_ restriction than a _copy_ restriction,
and hence smells more like a EULA than a copyright license.  The author
of the front end does not have to do any copying or modification of
mkfs.reiser4 in order to create the front end.

Markus> Or is Debian more about DFSG than GPL?

Yes.  Debian and the FSF seem to have slightly different opinions on
what "Free" is.  For example, the FSF's GNU FDL (Free Documentation
License) is said to be non-DFSG-free.  But the GPL with no other
modifications or clarifications or interpretations is generally
regarded as DFSG-free.

--=20
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

