From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: ACL Support
Date: Thu, 01 Apr 2004 16:48:31 -0500
Message-ID: <406C8E2F.2070304@suse.com>
References: <200404012043.MAA12517@amber.he.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17655-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404012043.MAA12517@amber.he.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Young <myoung@wildernessvoice.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Mike Young wrote:
| Wow Jeff!  That's a great explanation and very helpful too.  Can you
answer
| a couple more questions for me on the v3.x reiserfs?  I'm trying to
| understand the limits right now.  For example, how big of a volume can I
| support?  How large of a file?  And how many files?
|
| I actually have a problem in that I've got files that are 2TB in size--
| nothing bigger, though.

Mike -

The on-disk format for ReiserFS v3 defines the maximum filesystem size
as 2^32 * blocksize, which is currently limited by the size of a page on
the system. So, 16 TB assuming a 4k blocksize. The maximum file size is
2^61-1bytes, but is obviously limited by the maximum size of the
filesystem. The maximum number of files is 2^32.

If you're using a 2.4 kernel, you're not going to be able to handle that
workload using any filesystem, since block devices are limited to 2^32 *
512 bytes = 2 TB. This, in turn, limits all filesystems to 2 TB in size.

Using the 2.6 kernel, the block device limits have been raised, so
ReiserFS can use its maximum capacity.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
jeffm@suse.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFAbI4vLPWxlyuTD7IRAsaSAJwIN8Vv/W+LVO5xA2muNWhAsuusAACfV2sn
eX23G/LcEyflt0svSywvIUM=
=Bi+O
-----END PGP SIGNATURE-----
