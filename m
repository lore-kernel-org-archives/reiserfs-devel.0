From: David Masover <ninja@slaphack.com>
Subject: Re: I've done a very bad mistake
Date: Thu, 01 Jul 2004 23:02:08 -0500
Message-ID: <40E4DE40.7020809@slaphack.com>
References: <200407011523.48481.aotto1968@onlinehome.de> <1088703219.15328.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19484-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1088703219.15328.6.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: redeeman@metanurb.dk
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Redeeman wrote:
| afaik, this only overwrites the device node. recreate it, and you should
| be fine

Last I checked, it doesn't.  For instance, I often do

# cp file.img /dev/fd0
# cp /dev/fd0 file.img.test
# diff file.img file.img.test

to write a floppy from an image, then verify that the floppy matches the
image.

In fact, I think it detects if the destination is a device node and
behaves like 'dd' if it is.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQOTeQHgHNmZLgCUhAQI4HA//aqAFXvrN8avrfzc+eNFN1zIX3m7VFDk9
lll+gMpu9k6poet+40DOL3VFwHMaA/sk6e7MdmYQddYAu8Xk+OGXr/UAV70Hz6pF
juTdBVBSDuNB3xOyDBvrJ9e1hSTw0KmLaxNUvvKC2IoI24V2vLPijsCT0+4THd5i
P3SAmVZY9xGfTGFrt/u82fbfjv8sOYrLVfFVfD3v6M/swEcCqsCVBliJt0zYpLic
v48mcRzmEzGNVxubkd8o/F5EzsOoiHqcA2gZoTDTvFmsToT6anoL6lYeNLbkGuOc
5I5YPnX44V7skU/g+5wXRpLIBXi4NrhYJtwqyY44shNIX+b1DVFG/zHWBOBI9KEz
ImhoufwjFzErmKhBMZS5oyHrErtQru3fLDBWWDrrrN7x8Tdj1uEqFKEHhGucqjvs
ajQ75LqzjmIRewXQw/i+A7q8uB3nReQYTfnLpU0xIql9Xw9Mw+3eB5dnkuuZvOMi
opNRPdbEAxwSPGVybMskyVpaZWLO8gQQDUcOQYa2IUnGsL74qbPswdOkKgsHgwnw
iZyb5Je59BzsgKp2JdKhsZhS9k36F3lMqrmlX1+jupO7g/Ql2K6lw/rMjgqF2EcM
qMoRjy0zhTskQ4jrj9M7Ge5KFBqoEr4yi92etN+SaGtBUDKlIB6Jmta9j50o0XUw
rbnYmnz+JFM=
=JVWe
-----END PGP SIGNATURE-----
