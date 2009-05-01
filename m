From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] reiserfs: Expand i_mutex to enclose lookup_one_len
Date: Fri, 01 May 2009 16:36:31 -0400
Message-ID: <49FB5D4F.5090600@suse.com>
References: <49FB1F20.8040400@suse.com> <20090501125627.e13ff38f.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090501125627.e13ff38f.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, viro@ftp.linux.org.uk, a.beregalov@gmail.com, david@unsolicited.net, "Rafael J. Wysocki" <rjw@sisk.pl>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Andrew Morton wrote:
> On Fri, 01 May 2009 12:11:12 -0400
> Jeff Mahoney <jeffm@suse.com> wrote:
> 
>>  2.6.30-rc3 introduced some sanity checks in the VFS code to avoid NFS
>>  bugs by ensuring that lookup_one_len is always called under i_mutex.
>>
>>  This patch expands the i_mutex locking to enclose lookup_one_len. This was
>>  always required, but not not enforced in the reiserfs code since it
>>  does locking around the xattr interactions with the xattr_sem.
> 
> cool, so this will fix all those backtraces people have been reporting
> coming out of the reiserfs xattr code lately?

Yes.

>>  This is obvious enough, but it survived an overnight 50 thread ACL test.
> 
> That sounds a bit pessimistic.  I think I'll s/but/and/ ;)

Yeah, that's more accurate. :)

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkn7XU4ACgkQLPWxlyuTD7JOAgCfcVV+kowmYbaBKNCZG7BfNx3V
9dwAoKGB7Uu2RkwXtkpaaCi2ADtQszC1
=B4is
-----END PGP SIGNATURE-----
