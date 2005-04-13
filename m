From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: BUG in submit_ordered_buffer at fs/reiserfs/journal.c:616!
Date: Wed, 13 Apr 2005 15:11:00 -0400
Message-ID: <425D6EC4.3010204@suse.com>
References: <20050311224936.GK1220@austin.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23870-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050311224936.GK1220@austin.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linas Vepstas <linas@austin.ibm.com>
Cc: reiserfs-dev@namesys.com, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Linas Vepstas wrote:
> 
> Hi,
> 
> I've been experimenting with automatic bus error recovery in the
> 2.6.11 kernel.  During one of my failed experiments, I tripped over
> a Reiserfs bug, below.  Basically, my error recovery failed, which
> means a SCSI disk went permanently offline, which, admitedly,
> is pretty catastrophic, but shouldn't be a kernel panic.  It seems
> that reiser hits a 'BUG_ON' in this case.
> 
> FWIW, in my limited experience with ext3 in the same exact situation, 
> it seems that ext3 handles this gracefully, returning -EIO to all 
> affected apps accessing the disk.
> 
> Unfortunately, I don't know how to tell you how to reproduce this :)

Hi Linas -

Finally getting a chance to look into this one a little bit more. What
were your test cases? I've seen this bug before, and in doing a quick
trace, it may be possible to hit this if you attempt to write to a file
with a hole and an I/O error occurs while flushing that buffer. When
map_block_for_writepage calls journal_end and it fails, it can still
call reiserfs_get_block for the hole even though the journal has been
aborted. If the buffer is !uptodate (due to the i/o error failure),
you'll hit that BUG.

I'll continue to track this one down, but any more info you can provide
on your test environment would be helpful.

Thanks.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFCXW7ELPWxlyuTD7IRAh4jAJ4zB4eMUxoZjhnaOkoSDZ/yDHMtDACggkXi
y1ESZm40aGqJ0S2SfGLgBBQ=
=yYCv
-----END PGP SIGNATURE-----
