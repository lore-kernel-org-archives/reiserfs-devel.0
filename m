From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] reiserfsprogs: fix use after free with fsck_progress
Date: Fri, 23 Apr 2010 09:47:05 -0400
Message-ID: <4BD1A4D9.3030508@suse.com>
References: <4BC789C2.4030207@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4BC789C2.4030207@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward.shishkin@gmail.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04/15/2010 05:48 PM, Jeff Mahoney wrote:
>  fsck_progress uses fs to get the log file handle but fs is freed before
>  fsck_progress is caleld when it's about to print the "finished" message.
> 
>  When glibc is run with:
>  MALLOC_CHECK_=3
>  MALLOC_PERTURB_=69
> 
>  as is the default on newer versions of openSUSE, it poisons freed memory
>  to detect conditions like this. As a result, reiserfsck segfaults on these
>  systems.
> 
>  This patch fixes fsck to close the file system after printing the completion
>  message.
> 
>  Edward, I'm working on adding support to check extended attributes, so please
>  hold off on an update until I post those patches early next week.

BTW, until this fix is released in an actual update, it can be worked
around by just un-setting the two variables mentioned above.

- -Jeff

- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/

iEYEARECAAYFAkvRpNkACgkQLPWxlyuTD7IfJACgp/qHg+2Rb+Qo57NwdH4m84Nn
z3IAniFX5QBBe3C/uGoN9B0IFSye5awG
=7Num
-----END PGP SIGNATURE-----
