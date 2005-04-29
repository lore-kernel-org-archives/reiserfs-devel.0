From: David Masover <ninja@slaphack.com>
Subject: Re: Apple OS X Tiger adds arbitrary metadata support
Date: Fri, 29 Apr 2005 13:11:52 -0500
Message-ID: <427278E8.9080905@slaphack.com>
References: <87mzrhpn0f.fsf@evinrude.uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23945-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87mzrhpn0f.fsf@evinrude.uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

They've also added support for one of the main features we were talking
about with our plugins/metadata:  instantaneous, up-to-date searches.

Basically, they catch any modification to the FS and pass it on to the
search feature, which indexes only what has been changed.  Then, all
open "search folders" are automagically updated.  Any new search is
lightning-fast, but no matter when the search is run, it's automatically
up-to-date.

This gives me a bit of deja-vu, because the way users will be treating
their data now sounds a bit like one of the more database-like features
of reiser's "future vision" paper.  It amounts to one of gmail's
slogans:  Search, don't sort.  Why have a folder hierarchy at all, and
go to the trouble of setting up and sorting such a tree, when you can
have the OS automatically sort things into "folders" based on what you
need at the time?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQnJ453gHNmZLgCUhAQIopQ//ToeyM5y3wGfr+2OvjJShsdCKkzAIbVHL
f5VwYlk4b5/n6YkpyXHzYEZGE9AsuDlaVv+XgyjUYGYqH9IWsrEqCwYE2cck6RSa
eJaRuHR8FMokNWm2sgJ7D2py21tq3eO8BBI76gIgGHpG4DgCcR5jLuiD1ayueu6V
8ipzLBajGOQQmWCLjzRrODSv4m0w/uy/dT7uEtw4d9NhO2iYwh8hjCY4+5oIVB6k
6T+CNBDALELR73vwGo7j86PeBILpkFXALBHdJUVQADI2RxXpCsI/BS4/mBH/ua7B
lcOkF5w+DXdoXo6ni4DVjo+2dLhHImrN5fxwIH6jlvqeq+VkBVTA6sakpaZ7Dbiu
emjEgBr0ZpMaa6fZvHR2/4h6F5/gO14t/2Z+e33IDSqGtZSsgRnRnjUyXFcB6i0D
5BUX7XUeGNIf0wP+Py6nRgsGTTOusSZZCqmYJpzW1aIJ9Fi2L8Aw1LqnaQlWGwbr
pca06RZwkMExZ+SDNEfoGiS/HENlq1cBb8XwlKLYE7PeDOKo5y3eHuIK7n2/iL5L
UxSOODI4aqgbFs6DNyorm07Mi322N1hUC7+ojLDQPtlc+gnFVZQJUZ+qokRtdZyw
Mm4Thfi3ic1Q3EbY3y9iHS7d24kdbRGLsonLuWYwFxlOyUEjRuv36AtbX2yzoXV4
wttlRGl1jbw=
=V2X2
-----END PGP SIGNATURE-----
