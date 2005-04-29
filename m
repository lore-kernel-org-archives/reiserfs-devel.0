From: Hubert Chan <hubert@uhoreg.ca>
Subject: Apple OS X Tiger adds arbitrary metadata support
Date: Fri, 29 Apr 2005 12:26:40 -0400
Message-ID: <87mzrhpn0f.fsf@evinrude.uhoreg.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23941-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Just FYI, according to Ars Technica's review of Apple's Tiger, Apple has
added (preliminary) support for arbitrary (well, not quite arbitrary)
metadata.  It looks like they've decided to use the xattr interface,
though, so their namespace is fragmented.  The reviewer also lists some
problems and limitations of the implementation.  One problem is speed --
if a file has many xattrs, adding more xattrs is time consuming.  The
reviewer also notes that on filesystems that don't support "forks" or
xattrs, Mac OS X will use "._" notation -- that is, the metadata for
file "foo" will be stored in the file "._foo".

The Ars review can be found here:
  http://arstechnica.com/reviews/os/macosx-10.4.ars
They start talking about metadata on page 6:
  http://arstechnica.com/reviews/os/macosx-10.4.ars/6
and it goes on until page 8.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

