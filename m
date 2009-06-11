From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: reiser4-kmp-default query
Date: Thu, 11 Jun 2009 09:51:20 -0400
Message-ID: <4A310BD8.90802@suse.com>
References: <21849.202.168.22.19.1244727030.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <21849.202.168.22.19.1244727030.squirrel@webmail.velocity.net.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

doiggl@velocitynet.com.au wrote:
> Hello
> Will there be a new reiser4-kmp-default module available from the opensuse
> build service for the Linux 2.6.30 kernel, once the new kernel filters
> down through the build service, and if needed the
> reiser4-for-2.6.xx.patch.gz are available.
> (references) http://lkml.org/lkml/2009/6/9/710
> Thanks for the info Glenn

Yes, I've already merged it against 2.6.30. We've been tracking the
upstream prerelease kernels actively, so the actual 2.6.30 release
wasn't really a major event. The biggest differences usually happen with
an -rc1.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkoxC9gACgkQLPWxlyuTD7LVCACdFWLE1I+7QBJGkAxd/g/1nvdx
E0AAnAldRHfawu4V6WOA1pN6SlDuszBS
=ywP6
-----END PGP SIGNATURE-----
