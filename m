From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [patch 0/3] reiserfs xattr fixups
Date: Tue, 05 May 2009 16:14:44 -0400
Message-ID: <4A009E34.10006@suse.com>
References: <20090505193014.926371851@suse.com> <20090505201305.GM8633@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090505201305.GM8633@ZenIV.linux.org.uk>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: ReiserFS Devel <reiserfs-devel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Al Viro wrote:
> On Tue, May 05, 2009 at 03:30:14PM -0400, Jeff Mahoney wrote:
>>  This series consists of three patches:
>>
>>  1) rework the bit of locking after Al's privroot lookup patch
>>  2) Fix up security xattrs so they don't apply to other xattrs
>>  3) Clean up the privroot hiding since we now cache the privroot early
> 
> Applied and pushed to for-next

Thanks.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkoAnjQACgkQLPWxlyuTD7L6/gCfWy7fkY4B9wHyGmQZm4oZB0AG
udwAoI9+kobU+lNPPmBhJRXZ/F9ffSyQ
=EUQL
-----END PGP SIGNATURE-----
