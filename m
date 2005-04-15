From: David Masover <ninja@slaphack.com>
Subject: Re: resizer?
Date: Fri, 15 Apr 2005 17:56:40 -0500
Message-ID: <426046A8.5020804@slaphack.com>
References: <4250BAA0.6000708@slaphack.com> <20050404085301.GA6211@backtop.namesys.com> <4251EFB3.8070803@slaphack.com> <425D50FE.20501@namesys.com> <425DF0AA.9020804@slaphack.com> <425FF7EB.80505@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23885-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <425FF7EB.80505@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Alex Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
> The current repacker code uses the allocate on flush code and the
> transaction code, and walks through the tree sorting it, walking in both
> directions.

I don't think we even have to sort it for a resizer (not repacker).
Faster that way.

That's almost exactly what I read from the website/whitepaper; most of
my message was my interpretation of that.  The reason I wrote it out is
that it still seems too simple.

By "the tree", we're talking about the storage tree, right?  Do we have
to do anything to the semantic tree?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQmBGqHgHNmZLgCUhAQILOxAAjs3xpREGU+rdoFiSmqQEtELzxSfgU9OM
H3BKtvXFXvhJFwrvJApCutQebMb2FjpTZ+bV7tkdgZ2c4KIL5Qm6PMBO07YSrZLG
LSeDCyDu4GN9kJbw6IwLK1iq9xMsGF+DiMfqGg5C6Lr+mYyTPVnr4EEV63QuVCtU
hrljURE6aza/52KMjbFwGeHFUfwxT8yu9qowDTg/7/oR4pbujmpLESi6aHlyjIrn
kzf00sT5yoJ9Uk8p6lZfAa7tR1jhRTQ+E9fDJTbor6XdpsUt/kRN4ViHdM1+OQge
BA2MVKeolrSm2pRPLWJlIj24D+zHLwYUaMknvuOt0ZP0lsQShHzu9nQIAUCuANyN
IHbRDL4fsxgWc0zza4cDrgEyuMUKAmv5tOFEthSMNm+6ZWR8/0WbXovUP1pouM+k
woJfF0LCT2hzud95gy31qNctqRqYoZG4YXf4a+5ofRn0C7GxJGk1LiqYV8oFwHJ8
weIxzxfJpz1ecuyHbFq5fetsgH1kuyyGr3SSy9eJOQ8yyYwD+im4dp09vOc3jIDO
Uu72D0sGOlsPwTP9fjD6OB/+NrAJH7RQO9DP9yIP2LQvexzRgH16JJgI0K6X9j3s
k7fW8R+lHyMUfaTflImmrT0Q2H4C/reoWNlMbV7CEh32g2yp6idFVRfinOXT9pd/
rnKuf+0yz80=
=XXnZ
-----END PGP SIGNATURE-----
