From: David Masover <jedi@ninja.dynup.net>
Subject: pseudo files (Re: V4 status)
Date: Wed, 03 Dec 2003 19:33:30 -0600
Message-ID: <3FCE8EEA.8060407@ninja.dynup.net>
References: <16333.14692.61778.304155@pc7.dolda2000.com>	<3FCD47C4.50500@ninja.dynup.net>	<3FCE39B8.20307@namesys.com> <16334.15412.686909.927196@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16221-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16334.15412.686909.927196@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

cool, thanks.

>That's unfortunately very hard to do if you are using usual system calls
>(like readdir(2), or open(2)), because they are tunneled through VFS
>that enforces some semantics.
>  
>
Enforces as in, if I enter the name of a directory, it adds a / to it 
before it passes to the filesystem?
I know it doesn't chop off trailing slashes (except in Reiser4, for 
obvious reasons).
Or, as this has a serious potential for becoming offtopic, can you point 
me to some reading material?

>Another problem ("ls seems to know it's a file") is with user level
>programs that are sometimes too smart.
>  
>
Maybe I'll try to fix that.  Intelligence seems to be the easiest thing 
to remove from a program.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBP86O6gisZLIF6uqOAQKepQ//Vl/JRzKc7NkzWDi1KuIjR6D5/tljQlOD
O3ZYhv42Ugfk3J+HEF61ObeahPUqjpBXiEV9WKKp/m39EmdF3xyO7FvfiUwtwOVG
yLvhz/dE8WaUD4MQPVO/E0qZ+/cVb0qzfuBBdeGrTgfb/2F3oUIkiWjI7ftkpfaZ
spljQljQgO5fyvkaTYsjJ30hEJKBUHcYyMQ101FuSKOpuV0ZSrHIGlYaVC+8TJMl
DKdx0rfkoBAFEtgwkeoigYslBUurfJbscHLNVMIlsI3rhufIJ5sn3OEyl8animI0
XFG6ljDATMnGYYy2g7pat226a2l9skzEsMtcCH/XrWweX17QRCgZdOZSkzKosaXX
paeX4Qn0l64Q4eH4mc5p8Rsx1qWe/pQW8wZouCrgfwaZl2dMxHJtFZNxGVcp+A9/
nHVXRv24mLIQ1jAIMIk+O8so/YQTvFEHbu18BxgTKPNuDsyKPDgr0EguTwHf907w
tGMi931qtaoLuPXSE38/e0et5r9+fOLB9lE+uUNmV6xxFtNh3dMlStbdzuZ8wfYa
cd5sTq9F7Irm7TPxRBd7TTjREEcQYfhyZelmkuZI9eA7aU4WD6RDYziGp87mmevD
NjHzD6D1lKJGX8NW84Nxh/KP8N93LceG6282u9krYxQAY7x47L9AgGsRG/g8zfyw
0+qY2yoVngE=
=bdb/
-----END PGP SIGNATURE-----

