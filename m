From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: reiser4.spec query in opensuse buildservice
Date: Fri, 26 Jun 2009 10:36:53 -0400
Message-ID: <4A44DD05.5040007@suse.com>
References: <d4603b7979e1bb9e9c0e0b96e0fe1713@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <d4603b7979e1bb9e9c0e0b96e0fe1713@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

doiggl@velocitynet.com.au wrote:
> Hello
> I have some questions about reiser4.spec for package reiser4-kmp package in
> the opensuse buildservice 
> 
> Since the following has been released, does anything require changing in
> the reiser4.spec i.e from .29 to .30. 
>   reiser4-for-2.6.30.patch.bz2  
> 
> The last changelog entry says "Updated against 2.6.30-rc8" does that need
> to reflect just 2.6.30
> If so, can you update the reiser4.spec please.

No, it doesn't. There weren't any applicable API changes post-rc8.

> Is the _rc8_ name part in compiled file
> reiser4-kmp-debug-0.1_2.6.30_rc8_6-28.2.x86_64.rpm still required ?

That's added as part of the KMP process and indicates which kernel it
was built against. The version in the spec file in 0.1. It should
probably get incremented, but there's no real gain for doing so.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkpE3QUACgkQLPWxlyuTD7IFpACfbbQfgYA6KW4AaoH/6YLECa5P
lD0An1ikd0YVAA0JGWMvZJkvHLKdK/+6
=kXLU
-----END PGP SIGNATURE-----
