From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: resize ( expand ) reiserfs3 partition
Date: Thu, 10 Jan 2008 12:44:56 -0500
Message-ID: <47865998.7010809@suse.com>
References: <fm55b3$tsf$1@ger.gmane.org> <47865855.6060205@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <47865855.6060205@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Moroder <andreas.moroder@sb-brixen.it>
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jeff Mahoney wrote:
> Andreas Moroder wrote:
>> Hello,
> 
>> on our SLES9 server we would like to resize ( expand ) a reiserfs
>> partition. Is this possible without any data loss ? ( We have 70 gigs of
>> data )
> 
> Absolutely.
> 
> You just expand your partition and then mount it with "resize=auto".

As a followup, if you're using a device which can be resized online you
can also online resize reiserfs with "-oresize=auto,remount"

- -Jeff
- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFHhlmYLPWxlyuTD7IRAuBBAJ9RMY+adWcqZmutAhci8tV3h+Qd/ACfd3iz
HfBsRkYDOVTa0FUXJ1ImyrY=
=PSyG
-----END PGP SIGNATURE-----
