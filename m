From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: deleting file crashes kernel 2.6.8 / reiserfs 3.6
Date: Sat, 04 Mar 2006 14:15:50 -0500
Message-ID: <4409E766.9090305@suse.com>
References: <200603041339.14922.Hannes.Krueger@uibk.ac.at> <4409C5EC.9080109@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28211-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4409C5EC.9080109@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Hannes.Krueger@uibk.ac.at, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
> Jeff, is this attrs related?

No. The kernel version is 2.6.8. The attrs changes weren't introduced
until mid-2.6.15. Also, the lockup is definitely not the pattern we've
been seeing with attrs-related problems.

Hannes -

Can you please run the following command and post (or send to me) the
resultant file? The list will most certainly not allow a file of that
size through, but it should get to me just fine.

debugreiserfs -p <dev> | gzip -c > fsmetadata.gz

This exports the metadata tree from your file system. No data will be
sent with it. Having an image of your file system should help debugging.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFECedmLPWxlyuTD7IRAmt6AJsE5wwQpJhKaPz/qtaDUKj+i7RyPgCeOjFY
ATuy+ntmSepWooi6xj0/ga0=
=acGV
-----END PGP SIGNATURE-----
