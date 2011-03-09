From: Serkan Kaba <serkan@gentoo.org>
Subject: Re: File copy problems kde 4.5 to 4.6.1 with reiser4
Date: Wed, 09 Mar 2011 18:40:43 +0200
Message-ID: <4D77AD8B.7030009@gentoo.org>
References: <201103090918.47762.berny@dwami.com> <AANLkTikRbBP=XeNtvMkN=jYDVcuTZdqAM5bM=5NeAn=q@mail.gmail.com> <4D7774D7.3030908@dwami.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D7774D7.3030908@dwami.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09-03-2011 14:38, Berny wrote:
> I never know that kde was using this splice for copying things.
I don't think kde is using glib but they might have done a similar
change in their libraries.
Unmount test case is weird. I didn't try that, may try later on.
- -- 
Sincerely,
Serkan KABA
Gentoo Developer
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk13rYsACgkQRh6X64ivZaKe2gCfUsQA1Oj681JotTARgHH8Ygjd
pcEAn2LEOJ82F+Fg2GIU7hAQqXX6e+w2
=hW/P
-----END PGP SIGNATURE-----
