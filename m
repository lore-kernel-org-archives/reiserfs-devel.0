From: Jason Stubbs <jstubbs@gentoo.org>
Subject: Re: hans! i found a bug in reiser4 :((((
Date: Wed, 21 Apr 2004 09:38:25 +0900
Message-ID: <200404210938.25385.jstubbs@gentoo.org>
References: <6.1.0.6.2.20040420151137.02ae2008@popfile>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18095-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <6.1.0.6.2.20040420151137.02ae2008@popfile>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wednesday 21 April 2004 04:14, Jeffrey Rice wrote:
> I would also like to confirm the bug with glibc and reiser4.  If I try to
> compile with my /usr as Reiser4, I get an "#include nested too deeply"
> error in syscalls.h.  If /usr is any other fs type, no problems.  It's hard
> to believe the fs should be the cause but it really appears to be the case.

+1

Regards,
Jason Stubbs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iQCVAwUBQIXCgVoikN4/5jfsAQKwWAQAtKAlc98fWOHCmlvoE9SW+PtcvddYifZj
e0kMv0zXF8bytZpfMQi9A/eNgK1Th6+tkUg1YB6VvbnKjW1e1KzfCEX70SkOYwes
SmJdaTclH9Nmmsvhq6elIJQCYBM4rVVs1FYLeOwr8vQw5ZeJYRUrO6ItOQYg8eso
X2wi78eaqVc=
=+ine
-----END PGP SIGNATURE-----
