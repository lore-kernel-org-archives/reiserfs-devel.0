From: Christian Trefzer <ctrefzer@gmx.de>
Subject: Re: [PATCH] reiser4: fix readv
Date: Thu, 14 Sep 2006 12:59:25 +0200
Message-ID: <20060914105753.GA20160@hermes.uziel.local>
References: <200609132212.54871.vs@namesys.com> <20060914092829.GA13737@hermes.uziel.local> <eebb8l$jg6$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Return-path: <reiserfs-list-return-29881-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <eebb8l$jg6$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Peter <sw98234@hotmail.com>
Cc: reiserfs-list@namesys.com

--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

On Thu, Sep 14, 2006 at 10:35:02AM +0000, Peter wrote:
> This does not patch against 2.6.17-3 patchset however. Any possibility
> this may be related to some startup issues as noted on other threads here?

I have seen the issues at bootup you noticed some time ago, but only
once after the root fs had been mounted in a different way, i.e. laptop
hdd stuffed into a USB case and connected to my desktop, mounted to
/mnt/something.

The most annoying problems that have been fixed for me were related to
gentoo's postfix and spamd startup scripts. For some strange reason,
they did not detect properly that postfix had been started / spamd had
been stopped. Now everything seems kosher - I survived a few
suspend/resume cycles without the hickups that have become common during
the last few months. Sadly, I had more serious trouble to worry about,
otherwise I had bugged the list myself : P

Kind regards,
Chris

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iQIVAwUBRQk2C6nY3eLOiwZcAQrmPg/8DXItGYHIl8y4psQumNO5O5jSpNd/w8Jx
HQpzirdpiyfyKGZEK1p/pCCGVUueE+ny0NcqlIcA4zB/xQdsTi2Hlb/4kQ6O43sT
G4NQHJ27zei7eWTUfyO+C7or9eBXR/0P6O1zf9OPRAb86+MkMsiaxS3+8AHFIg1I
ZWcLJZBa4jgeGao67HJHHknOlDUfDjcQS2TOmQZSPYAENtiB4E/ZBZ9mLvS+cKe9
ZrlhMmVT+WA1U4b8tSeTRWO1jZT0tlnD+Tpw0OMBJEKkZwS1MrSoW1g7LwEfHcQw
qXyVhJrTq/FLrvAQPVSFL8f9ld+s8wHk+TQnzFcMyM8IhgClFxk8wQUpJA+Cl95s
sKV8qM0YW+1GDUN1mS9hh2cuG3a4/kvHv63CCnGjJXzrgPenQ+EZIJzY4or6c7GJ
MhEqISMaBFV200yh06KS7MjmMjxtM6R2CUR0PkFzGjktw358SbvwGkdFQF9LUaI0
3uC1SdEYo/I29YJ8+Z/Ao9dsMtXQU7tHRIYscjF2wAi0a4TP6hMCPq4f+GNkk9tn
IVUd+/DQWPpfELGFmUefiTCZrK9bpW9EJApyRqZLPC/mCbECxmn2dOEAOuviGOIK
KSTWqCQh13GDT/3tlGqCgI4zrE60SQinRYlCQkDqYx6zY5ngfagHAwLgxedLLpTz
MIR7DNBc000=
=PNRk
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--

