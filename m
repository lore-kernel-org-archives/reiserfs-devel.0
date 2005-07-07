From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfs: reformat code with Lindent
Date: Thu, 07 Jul 2005 16:12:54 -0400
Message-ID: <42CD8CC6.4000808@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25041-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hey all -

Just out of curiousity, does anyone outside of Chris and I have
outstanding patches against ReiserFS? I ask because the tree has been
relatively stable for some time and I wonder if it may be time to submit
a Lindent patch to clean up the code and reformat it to adhere to the
kernel style guidelines.

I've posted a patch[1] that is only the output of the Lindent script.
Ideally, there should be some string formatting in there as well, but
I'd like to split them up into separate pieces so we know each chunk is
correct. Sorry I couldn't attach it - it was rejected by the list since
it is over 128k in size.

Opinions?

- -Jeff
[1]:
ftp://ftp.suse.com/pub/people/jeffm/reiserfs/kernel-v2.6/cleanups/2.6.13-rc2/01-reiserfs-lindent.diff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFCzYzFLPWxlyuTD7IRAgrZAJ0YpbRkSz7XoGKOyal62s1qTGdw/wCcCNQx
aFRMUp8q8+cRQ6XluvE5zgg=
=ZYGV
-----END PGP SIGNATURE-----
