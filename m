From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: partition cannot be mounted from grub
Date: Thu, 21 Sep 2006 10:02:19 -0400
Message-ID: <45129B6B.6090005@suse.com>
References: <eet9jg$463$1@sea.gmane.org> <eetanq$6ij$1@sea.gmane.org> <eetru8$vjq$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29964-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <eetru8$vjq$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter <sw98234@hotmail.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Peter wrote:
> Two suggestions.
> 
> 1) I have found that grub files in r3 have to be copied using -o notail on
> the mount command. If you do not use notail, the files are not able to be
> read by grub.
> 2) do not try and create a grub boot while in the r3 partition. Make sure
> the partition is unmounted, then boot from a live cd and run grub from
> there.

I'm curious what version of grub caused you to come to these
conclusions. Grub has been using the REISERFS_IOC_UNPACK ioctl for ages.
It's the same thing lilo uses and causes those files to only use
indirect blocks (ie: no tails). If you've been running into this problem
with any recent version of grub, it's a bug.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFFEptrLPWxlyuTD7IRAlsHAJ9GvQ/jJDKbWmCuAlmJxcwcl66gJwCgot5t
qQBPRVmv5OWTwJ2VPX4facE=
=x/4R
-----END PGP SIGNATURE-----
