From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] ReiserFS v3 I/O error handling
Date: Wed, 15 Sep 2004 09:47:45 -0400
Message-ID: <41484801.2000204@suse.com>
References: <41461B2F.7080100@suse.com> <20040915131133.GD5137@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21763-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040915131133.GD5137@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alex Zarochentsev <zam@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Alex Zarochentsev wrote:
| * reiserfs-io-error-handling.diff
| 	- Allows ReiserFS to gracefully handle I/O errors in critical
| 	  code paths. The admin has the option to go read-only or panic.
| 	  Since ReiserFS has no option to ignore the use of the journal,
|         the "continue" method is not enabled.
|
|
|> What reiserfs will do with already dirty blocks on the R/O fs.  Those
blocks
|> remain dirty, yes?
|
|> The whole patch is enough complex, one look is not enough :) I think
Elena may
|> do additional testing to be sure that nothing is broken while
improving i/o
|> handling.

Yes, blocks that are already dirty will remain dirty. This is safe.

Here are the cases:
* Transaction hasn't started yet, and the journal has aborted
~  - Deny the transaction start in do_journal_begin_r, returning -EROFS
* Transaction has started, journal was aborted in the meantime
~  - Finish cleaning up, don't write the commit block, return -EIO
~    from do_journal_end
* Transaction has completed, and aborts during flush_commit_list()
~  - Finish writing, but don't write commit block
* Transaction has completed, and aborts during flush_journal_list()
~  - Finish writing, but don't update journal header

Since this is an error path for I/O errors, NOT internal
inconsistencies, it's safe to continue writing to the disk so long as we
do so with the expectation that whatever we write there will be handled
elsewhere.

One of the tenets of journaling filesystems is that if the transaction
isn't commited, it never existed. The I/O error handling code takes
advantage of this by completing whatever I/O is outstanding, which makes
the code *far* less intrusive. My initial implementation tried cleaning
stuff up, and it's extremely involved for very little gain. Once the
journal has aborted, updates to the journal's state just don't happen.
Yes, blocks get written into it -- but the commit block doesn't. The
transaction isn't commited: It never existed. Outstanding journal
flushes can still flush to the disk, but it won't update the journal
header. The transaction can be replayed the next time the filesystem is
mounted.

I view it like this: An aborted filesystem is no different than one on a
system which has lost power. The journal protects us here. Nothing after
reiserfs_abort() exists, since the journal operations aren't commited.
There will be incomplete transactions and incomplete flushes, but that's
what the journal is there to handle in the first place.

The admin will be able to perform the normal operations before umounting
a filesystem (closing open files, chdir'ing out of it), and the
filesystem will be umountable. The admin can check it, and remount if
they choose.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBSEgBLPWxlyuTD7IRAvyBAJ0XJW7eP6eThwSK6YT9K3hdxlTT0ACfTLxY
LIJEucE1EisIn9VQPXon/dw=
=cQx8
-----END PGP SIGNATURE-----
