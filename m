From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] ReiserFS v3 I/O error handling
Date: Mon, 13 Sep 2004 18:11:59 -0400
Message-ID: <41461B2F.7080100@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21726-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hey all -

One of the most common complaints I've heard about ReiserFS is how
graceless it is in handling critical I/O errors.

ext[23] can handle I/O errors anywhere, with the results being up to the
system admin to determine: continue, go read only, or panic.

ReiserFS doesn't offer the admin any such choice, instead panicking on
any I/O error in the journal.

Attached are four patches, against 2.6.9-rc2:
* reiserfs-cleanup-buffer-heads.diff
	- Cleans up handling of buffer head bitfields - uses
	  the kernel supplied FNS_BUFFER macros instead.
* reiserfs-cleanup-sb-journal.diff
	- Cleans up accessing of the journal structure, prefering
~          to create a temporary variable in functions that access
~          the journal structure non-trivially. Should make 0 difference
~          at compile time.
* reiserfs-write-lock.diff
	- Fixes two missing reiserfs_write_unlock() calls on error paths
~          that are unrelated to the last patch.
* reiserfs-io-error-handling.diff
	- Allows ReiserFS to gracefully handle I/O errors in critical
	  code paths. The admin has the option to go read-only or panic.
	  Since ReiserFS has no option to ignore the use of the journal,
~          the "continue" method is not enabled.

These patches have seen a lot of testing in the SuSE Linux Enterprise
Server 9 kernel, and are considered ready for mainline.

Hans - please take a look.

Resent: Since the namesys.com mail server refuses messages over 40k,
I've posted the patches at
ftp://ftp.suse.com/pub/people/jeffm/reiserfs/kernel-v2.6/io-error/

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBRhsvLPWxlyuTD7IRAqa7AJ9ZJa+HnOGYU7OIouWMu34H2mU0MQCgn0H5
QBdLo95dLiXsQdwojQSHAos=
=kPTJ
-----END PGP SIGNATURE-----
