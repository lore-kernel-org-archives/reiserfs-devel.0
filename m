From: David Masover <ninja@slaphack.com>
Subject: Re: Fibration questions
Date: Wed, 21 Jul 2004 23:08:13 -0500
Message-ID: <40FF3DAD.6020100@slaphack.com>
References: <40FE0B47.3010600@slaphack.com> <20040721063607.1A09015C92@mail03.powweb.com> <20040721083232.GA4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19733-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040721083232.GA4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1




Markus T=F6rnqvist wrote:

| I think it'd be a great idea and people would get to learn the code
| by really working it.

I do!  I do!

I've been stumbling around the reiser4 code, trying to make sense of
things.  It looks very clean, very well implemented, sort of allright
documentation -- no idea where to start.

| This would make it easier for people to implement stuff like the
| aforementioned Lustre subset, new plugins, chdir to -x files or something.

I'm thinking of doing said Lustre subset as a more generic facility.  I
definitely want reiser4 support, though, and it'd be really nice to:

- - support remote 'metas' dirs as if they were local
- - have our own area inside 'metas' which is always local, to allow
things like forcing particular files to always be in the cache
- - have almost no speed difference between local cache reads and local fs
reads
- - allow separate caching of different logical pieces of a file, to
sanely allow files which are directories
- - share an fs between a cache and entirely local files

Most of that would be best implemented as some form of plugin.

First question:  Can I manually enable/disable a particular plugin for a
particular directory?  (like how cryptocompress is supposed to be...)

Second question:  Would such a setting be recursive?  Can I tell it
whether to recurse or not?


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQP89rHgHNmZLgCUhAQIbWg//estyCCE5Ae0/YiSS1SXU0ZOevSSTy3Aa
HtoGRlWCbkXWQhkpyrnyE4rMdjqDyaFuCIEh9bq3yuzIT0azHajW2nRzur8ffzmn
allFZtPtNsMRh4w3kRuQR37s1I0BXs4zQLGstWb4KveyHp/QxegtZ1JLSiS8Jd3w
rqaI4UusIHmVTLBJAK5ilVFcor98p14zG9NphPrsht0HDa0LXeGBKsDb9yQ1Db2F
bWYqliZW5V/+z4JrGuHSBeqbgR+tSla5gRWHhVuDTe8s24cVAzq+Oks7m2Dxw1D3
JKA1UiCRfWG0jpBjRMrZV37TaFHN9OCgFqQVK8VFreojuuGkPxfqOH2/64LhnYXh
4AexfMB5+IUQHSU+rjWQ58Hm0Lv+VYXyupo2snvig4xZUi7P2RaSK0/zLNSZ61jy
Hor+mlxn0/Qsk8GLZG3JO5loVPrdq4cYeDcx8jUaOQRV5IzeWubt7hRgscjed+HI
P+w5pkFRXwEK1cqPn+R8BFHGqF2M/AMfmNgY3vEnRaNGrtQ/c4p05ZxQa8DBxWuT
A0rnpZlkBkrQM2sGGUd71EzNQJIPLSxMmKiZOJH1UNo4m36IvGCdPmec3cgLQwud
WsXAPS1pxlMbqKAIv7t2VV4X2sWJP7xNHTE7hEG0DqQ6c3T4eSEaenUjWq6Y92rf
XwoUS85igeM=3D
=3DjPhu
-----END PGP SIGNATURE-----
