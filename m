From: David Masover <ninja@slaphack.com>
Subject: Re: "Metas"
Date: Fri, 16 Apr 2004 17:16:13 -0500
Message-ID: <40805B2D.6080300@slaphack.com>
References: <20040416192014.32348.qmail@web25007.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18016-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040416192014.32348.qmail@web25007.mail.ukl.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Narcoleptic Electron wrote:
[...]
| It seems that the most widely supported name thus far
| is "...".

As far as '...', since I haven't had an opinion yet -- I believe that a
'...' would be nice, but the usage of '.' and '..' is so generic
(current/parent dir) that we want to make sure '...' is just as generic
and universally useful.  Otherwise, we may end up with things like
'...................' in a few years.

Also, I can't see ... as being any easier than ..metas (or, of course,
.metas).  At the shell, it's typing "<dot> <dot> <dot>" instead of
"<dot> m <tab>" or even "<dot> <dot> m <tab>".  Anywhere but the shell,
and there's really no point, unless we're afraid of hitting some limit
on filename length that I'm not aware of -- in which case, this is not
the place to optimize.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQIBbLXgHNmZLgCUhAQJN0Q//aGv8BLyqW/LzsdHSl3MxXLoBmT8ah/W+
hGQn+j+IUaCLuSyslE9Z6ICRGQIHYnU+VjkAoFeRNHMXkSTxBamcOa4GnuPrAwg+
D0CJeKYy2S9f1YsoWSQKL+TIz78UfmWua4eEDOaDeMFqtZPIH30qLw3RMiGu15yd
ToODavP3SZQXItYGuq15JSs+5rsm/I/D5V7GbCSVRdYj/u44sj38Oqz0p2zU/wd0
qsgZfo4PTDk38m26BJE1yq5R9uzW2/TdQX4k0UKNjl4tqwjrQ4zaRx3dQEWfec/B
vUdXjN4XJ3Ytmddvk2Qb1Drs70DZimhMS6DkGTYN3acrxVr0G+dub/F6vOxt6Nng
oN0LYzpJQ1oD7HImx1gNSFmfhiuhT51iO6qfAqJFik8KrD2PVBzDMXa8ShYggfry
mkf0EpRpP2n3DNBFGcfdv23PwzbByXrsXxopKNk73b5pbQ+WwWVfqao8Enl8/ASK
+KLV0UHgfGD+AcLte4kbJl+k6eVrUQsnBw8v//1EQYCxFG1vPUixV7UrR3eGKYBI
g07DiynqWDwetad8eYCMPOeKUBTXRfa57W/edvkHtOjLlqfaeUyfue4Jxx5yqvps
nbpMpuRf0T4bumJDcWJW4n6DibrhOi1uoCgdu/PzH1lFiWt6NnJEva4ovgGZ4O3Y
JisNcVJAcrs=
=fInv
-----END PGP SIGNATURE-----
