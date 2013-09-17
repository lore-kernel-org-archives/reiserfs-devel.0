From: Mathieu Belanger <m@thieu.so>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Tue, 17 Sep 2013 21:15:10 +0000
Message-ID: <20130917211510.Horde.Zc6miMwWvs-M3goxK91zdw1@mail.thieu.so>
References: <20130917181531.Horde.9SQoJsAfOsciOtEfGaP2jA1@mail.thieu.so>
 <5238B2FF.5060900@gmail.com>
 <CAL2jS+kR_NmF-vc2UqnJyCodh2_F3LdciAtsTXgcp=4QKCXauQ@mail.gmail.com>
 <5238BD79.6030005@gmail.com>
 <CAL2jS+nhaFh-axsDiLj4puDnJMmLrcj1m1qbovVhewDroc+uqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=_v8NU95Z1J9cn1s_RyFWoZw3";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CAL2jS+nhaFh-axsDiLj4puDnJMmLrcj1m1qbovVhewDroc+uqQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Evgeniy <iron.udjin@gmail.com>
Cc: Chris Gentile <cnjgentile@gmail.com>, Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org

This message is in MIME format and has been PGP signed.

--=_v8NU95Z1J9cn1s_RyFWoZw3
Content-Type: text/plain; charset=; format=flowed; DelSp=Yes
Content-Disposition: inline

Uploading to my GIT

I have cloned the kernel and added a branch reiser4-for-3.11-rc4..  
Should pop there once it's uploaded  (will take a while as it's fresh  
and the kernel git origin is big and uploading at +-100KiB/s.

https://github.com/DestroyFX/reiser4/branches

I fixed the .for_sync stupidity I have done initially... might work ok  
and DON'T try on anything that have stuff that you want to keep ;)

PS : I did not reboot/test after re-adding .for_sync.

--=_v8NU95Z1J9cn1s_RyFWoZw3
Content-Type: application/pgp-signature
Content-Description: PGP Digital Signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJSOMZeAAoJEG24p/Ii9MVYf9IP/1SfGIIL3AuiE6LseDWmHtje
P0Kcwh+E8Z//2VmshoqdHRRzSKkbig2o5dvdrHfr1lP2816v87B2viqbfzp4x+Q3
uUZfpAOC+blh67tF12vB74FTnr7nx2BKRY74n5TdjGBBoIPy//KjiwDDG4khDyp/
84TK29qE+KMg36g0kUDv6P3VK4LDn0ebL1NRJibjS5PLvtt+GjauliVZExxWq4ta
uppHj93er5ysMf0O8bOtCVIoa/JILlgTNYfHFnYGS+2sTduy8FC6EsffZjn9UjoF
gAsAzp+UZYcEGGm31yLzxo10nRhDWApUofSiWRKXYVexExwLbSOm5sTZ1tzAO7D0
NWNw0s0u66pxt2RNX8UFR/lKNCqOJZ4mAWwuxwps16WH0pQkSYbEfp/swTelELiM
S8vrKRqlA4PEnjvaqCh8Mry2JDhYiOADkTaPGKdLfayyk7fLVovwHnxk0MiP+wau
pnh7DCJtbn2u8FzDUZy72NzlWR3gtTUWnLlfqAkOBnWvgy7PE9K+nWiuZF3NOO5+
ahRNlrYYjZ4zUFuA2Dq5QDUFk8jcZRVeAEFaN09/RBIcXEztjfufWsy/6dNle1UB
EvD/EpfJRb7YyBILuEdGluRe72m8Tw3kMnI+TA3p/ciWl96dI6LJ+GctlFZWl5Kg
B+F4yUP3hMk906q8NmM+
=QSEs
-----END PGP SIGNATURE-----

--=_v8NU95Z1J9cn1s_RyFWoZw3--
