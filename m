From: David Masover <ninja@slaphack.com>
Subject: Reiser4 InterMezzo reimplementation?
Date: Wed, 14 Jul 2004 21:34:43 -0500
Message-ID: <40F5ED43.9020400@slaphack.com>
References: <200407150025.30908.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19624-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407150025.30908.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1




I always liked some of the ideas behind InterMezzo -- particularly,
using it as a secure alternative to NFS and being able to have a huge
cache.  In fact, it can be exactly as fast as local FS access for cached
files.

Unfortunately, InterMezzo seems (very) poorly maintained, and may not
play nice with Reiser4.  Could a Reiser4 plugin be written to do this?

I know this was mentioned before, and it was marked for a later version
(5, 6, 7, or something) -- but could some basic functionality be written
quickly that would be extensible enough to be able to "upgrade" to this
new version?

(Think if someone were to add ..meta to reiser3, but not plugins,
dancing trees, or anything else.)

CODA would work, AFS would work.  Lustre or InterMezzo would work if
they were available in a stable form for the 2.6 kernel.  I just think
it'd be faster with reiser4 as the cache.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQPXtQ3gHNmZLgCUhAQJ3ZBAAjZ9QhiETD6ENXc/nzPc1a0zysQxcaRcg
q1utQYvuXBl7xkvQEPAh6wYjJXfjfXzqLG+mw6v1dwY1FHHzUVBF7cFw783Xc/0D
+WenecCoxaobbrTf+Mbp+RIeNMxtHbKMcNVEc1CHWQbmx+vlrlZ/Hg9fIXTN6ows
6rjkmzeLPmnQ8iArphBNP/OytB0BoesQANrF5psXyvtlgpf7YiVDMI9sdywwA08V
lszhRtLhP8kwUM04n+/vDOvhrTMvVz+rF7mbRVNU7LhsZ1vqhFYXj9WmYchG4eGV
vOff4zrJKw8FyyBTSphLmvpcs/JCxUDL+ZZYILzH528ZH6suO/uIeta2GLoCeNp4
ims3tBGdFjuthIJpduK3Bd+xW8KHExb8Iexono2bMmFToQu1U9WTNB4u22KK73lO
kkSjJBvObU8Az4tBaWHIOyetkZIaoRGtBZwrDtWhQrl++HWZlnTG5NgndOSy38/w
LNCwjUwZktWy5cgp+mnaR8cjZL7pCFbE93s7tWWlvb+S3k8ViujoCOxP9TT/BHuz
VXKGZDcmmROElri11IrsTbo4m0QmLgYrqNTYWR0p8ACxlOkB9dFxDYz7wAtwP1a0
zfBuou/vsY9unaw2Eg5g5SnBXTEPHZ0vvI1PDYqaau7SW/HOfONuRba2cMrDO9fU
tVFXzZETsBI=
=9GWr
-----END PGP SIGNATURE-----
