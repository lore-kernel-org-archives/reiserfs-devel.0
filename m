From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Re8: Reiserfs3 is crashing - where/whom to report?
Date: Tue, 20 Jan 2009 18:07:14 -0500
Message-ID: <49765922.6000607@suse.com>
References: <49750FC1.23700.2C929@JaFojtik.seznam.cz>, <49761CA5.613.41328D@JaFojtik.seznam.cz>, <49761DEE.2000204@gmail.com> <49764028.21407.CBEC48@JaFojtik.seznam.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <49764028.21407.CBEC48@JaFojtik.seznam.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jaroslav Fojtik <JaFojtik@seznam.cz>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jaroslav Fojtik wrote:
> Dear Edward,
> 
>> "HDD with blocksize" is a poor phrase. HDD has a property "sector size".
>> Blocksize is a property of filesystem.
> Sorry. I mean HDD with filesystem with blocksize.
> 
> 
>> No, it doesn't, if you mean to reproduce a crash with reiserfs
>> formatted by "mkreiserfs -b 1024": I know how to reproduce it.
> Now it is clean.
> 
>   It was a very stupid thing to allow unstable stuff in reiserfs in public
> without any warning and pretend that everything is OK.

Why would you want a file system with a different block size anyway? 4k
is nearly universal as a block size, and it also happens to match the
page size on most linux systems. Going down just slows your system down.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkl2WSIACgkQLPWxlyuTD7LYpwCfbNAOFJIuv6o8Ne+EVINatarG
110An28wbBerkf4OFLTQPm73qIIIpsZY
=EP2n
-----END PGP SIGNATURE-----
