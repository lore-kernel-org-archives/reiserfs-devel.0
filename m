From: Russell Coker <bofh@coker.com.au>
Subject: Fwd: Re: [reiserfs-list] Reserved Blocks
Date: Mon, 16 Sep 2002 17:29:19 +0200
Message-ID: <200209161729.19198.bofh@coker.com.au>
Reply-To: Russell Coker <bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11474-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS <reiserfs-list@namesys.com>

BTW  Can someone please configure the mailing list to allow postings from my 
regular email address?

----------  Forwarded Message  ----------

Subject: Re: [reiserfs-list] Reserved Blocks
Date: Mon, 16 Sep 2002 17:13:52 +0200
From: Russell Coker <russell@coker.com.au>
To: Valdis.Kletnieks@vt.edu, Sam Vilain <sam@vilain.net>
Cc: "'reiserfs-list'" <reiserfs-list@namesys.com>

On Mon, 16 Sep 2002 16:50, Valdis.Kletnieks@vt.edu wrote:
> If you're worried about security enough to not want users doing a
> denial-of-service attack by filling the disk, then DON'T HAVE a
> world-writable directory on a partition that will cause trouble if it gets
> full.

Alternately use quotas, speaking of which, do Quotas work on ReiserFS without
additional patches yet?  Quotas really are an essential feature.

> Among other things, if there's a world-writable directory on the same
> filesystem, you get exposed to a whole raft of hard-link attacks that
> simply Wont Work if (for example) /tmp is a separate filesystem.  You'd

Solar Designer's OpenWall kernel patch addresses this issue by prohibiting
hard links to files with a different UID being created in a directory that
has the sticky bit set.  http://www.openwall.com/linux/

OpenWall is ported to the recent 2.4.x kernels and some 2.5.x kernels in the
form of the Linux Security Modules (LSM) kernel patch.
http://lsm.immunix.org/

Also the LSM patch includes NSA Security enhanced Linux.  In the default SE
Linux policy a user in the default un-priviledged role (user_r) with the
defalt security domain for that role (user_t) will not be allowed to even
stat /etc/shadow or other files with the type shadow_t, and will not be
allowed to link files with type etc_t (which includes /etc/passwd).

A machine with an adequate security setup and with correctly configured
 quotas should be able to operate correctly with hostile local users even if
 it only has a single file system.

If anyone disagrees then I will be happy to setup a test machine and
 challenge them to prove me wrong.


Russell Coker


PS  SE Linux is why I haven't done much Bonnie++ work for ages...

