From: David Masover <ninja@slaphack.com>
Subject: Re: snapshot, checkpoints
Date: Fri, 11 Jun 2004 16:04:49 -0500
Message-ID: <40CA1E71.9050309@slaphack.com>
References: <20040527065259.99429.qmail@web51306.mail.yahoo.com>	<1085641393.1915.199.camel@tribesman.namesys.com>	<20040527092727.GO4990@nysv.org>	<20040604131005.hmvps8wcw4sccgcs@www.wagland.net>	<200406041925.i54JPZgp025255@turing-police.cc.vt.edu>	<40C14E9C.4000706@slaphack.com>	<116CD3CA-B709-11D8-A933-000A95CD704C@kungfoocoder.org>	<40C78D86.2060305@slaphack.com> <20040610065427.622450fb@rayanne> <40C7EFB9.1040609@namesys.com> <40C8DD73.7080100@slaphack.com> <40C91895.5090009@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19148-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40C91895.5090009@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Pierre Etchemaite <petchema@concept-micro.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Hans Reiser wrote:
[...]
| Yes, views are an important step towards "Filesystem-based cvs", see
| clearcase as an example.  Transaction infrastructure, substantially

url please?  Or I'll google.

| Currently we support atomic sets of fs operations, although this is
| immature code (meaning reiser4 works reliably but the api is still in
| progress, etc.).

I think this can actually be done in userland, outside (on top of) the
fs.  That's not the better way, just something practical for people who
don't want to wait for (or use) the new api.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQMoecHgHNmZLgCUhAQKIAA/9GWZBmn9rFL4QYfPNr5UpMQz0e6s1Aor/
LDFu/CDKcb2KnRAkGdoxCKr2WdxvPPUxieUNXQAdpEejn1SQ+6mSTzE0HRzab1HJ
+O95bseF3eSb+mLiFC7CepQoviXUb/w1lzRww5v0f4s8biXv60qdkq+ZSK4a8CWP
PD/sB4S0prfK/y/k+mSRAqFBZzxohnmK03Iz3qbaN8MrRsP7Thns+DEIG6RuzKoz
H+fYwvUDUszkHXSG3CbyWUPSIT613lHcDbtfL52wpK+3722BM1hbiIw+aob07GIg
UwFgXD6Okhy6BURNQykbmu2uHQYKQSd+zRZujd/b6QoWGGFe75cUlTUTdxawUUsM
vvVQ6M7FN8BQ5Lj+/Oqtt8A9hjjMVIulJsP4zzxWrLpc8+JPi2WnO/x+beGVSbob
kfqvN8eHMpgwkqVl4wtyIQ+yuDxtLcfYIjyp7BLW82wuXRhMt5jwgzw/FUgmfiAI
O3VD2Bjbb8ndNFl++R29AQKtt9+n8od2vlLXLPK+/7hpSH82ymDXlA22/a8nekgk
ofhwYQYYWI+z7YAS6nyMtXvxK79Cr9ep1lGsc+aEZGeu1mJorJ6WMI3kNsw8a+nT
Mx2ntBJeI8YV7XPjQVKZb7Bz5DipUklrMkfrmrgQwOvwAKpY/BQwa2970myx6hJd
hQlzWDXy27g=
=CA6N
-----END PGP SIGNATURE-----
