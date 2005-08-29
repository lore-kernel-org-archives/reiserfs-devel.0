From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: reiser fs slow on mksf and mount
Date: Mon, 29 Aug 2005 15:44:42 -0400
Message-ID: <431365AA.8060709@suse.com>
References: <1125074717.5549.44.camel@localhost.localdomain>	 <430F4B91.7030909@namesys.com>	 <1125076138.5549.65.camel@localhost.localdomain>	 <1125076558.5549.72.camel@localhost.localdomain>	 <430F5226.50701@namesys.com> <1125080213.5549.100.camel@localhost.localdomain> <4310BF35.3060603@suse.com> <43136493.40405@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25709-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43136493.40405@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: mingz@ele.uri.edu, "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
> Did you ever look into my question about device congestion, and whether
> raising that limit would fix the bitmap loading time issue?

I haven't really had the time recently. I'll look into it, but it
doesn't change the fact that we're wasting RAM on huge filesystems.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFDE2WqLPWxlyuTD7IRAt8SAJ0b9JGq+vLlc4OXB+RSQUJsJIsfigCdFPVh
6UHE2ZO/z2cdXu/sQrkEYSY=
=Gvd6
-----END PGP SIGNATURE-----
