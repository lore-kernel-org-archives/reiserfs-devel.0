From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: resize ( expand ) reiserfs3 partition
Date: Thu, 10 Jan 2008 12:39:33 -0500
Message-ID: <47865855.6060205@suse.com>
References: <fm55b3$tsf$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <fm55b3$tsf$1@ger.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Moroder <andreas.moroder@sb-brixen.it>
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Andreas Moroder wrote:
> Hello,
> 
> on our SLES9 server we would like to resize ( expand ) a reiserfs
> partition. Is this possible without any data loss ? ( We have 70 gigs of
> data )

Absolutely.

You just expand your partition and then mount it with "resize=auto".

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFHhlhVLPWxlyuTD7IRArdvAJ9GzYhpBIonxy1o++3nPQhVket+zACfaAwg
T0c3wmkQ51E50GLZLpoXm8Y=
=GzV8
-----END PGP SIGNATURE-----
