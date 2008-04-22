From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Does Reiser3 really support data=journal mode?
Date: Tue, 22 Apr 2008 14:32:11 -0400
Message-ID: <480E2F2B.9060301@suse.com>
References: <20080422141756.GC22899@duck.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20080422141756.GC22899@duck.suse.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jan Kara wrote:
>   Hello,
> 
>   I've just looked into the Reiserfs code in 2.6.25 kernel and from the code
> it seems as data=journal mode isn't really handled any specially from
> data=writeback mode. So does Reiserfs really support journaling of data?
> If no, then we should remove the mount option. If yes, then I really wonder
> where is the distinction from data=writeback mode... Thanks for an answer in
> advance.

Check out reiserfs_commit_page() for the code where it is attached to a
transaction. Then it's handled identically to dirty metadata when the
transaction is committed.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIDi8qLPWxlyuTD7IRAgd3AJ4h6aJRexiVTVC5ykRsqnRIwjdT9QCfcgRV
oOXg9E+0h01zCQ5XjZQWJ24=
=wHK4
-----END PGP SIGNATURE-----
