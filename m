From: David Masover <ninja@slaphack.com>
Subject: vim/fsync/performance
Date: Sat, 04 Dec 2004 23:32:45 -0600
Message-ID: <41B29D7D.5010908@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22675-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Some thoughts on various things I've noticed over the months I've been
using reiser4:

vim was patched some time ago to call fsync on every write.  reiser4's
fsync implies a full sync, meaning that

- - when lots of fs activity is happening, a ':wq' can hang for some time
waiting for full sync.

- - someone editing lots of small text files, which reiser4 is the best
choice for, will lose the benefit of lazy writes.

Rather than trying to fix fsync or patch vim, I always replace sys_fsync
with a stub, especially on laptops.  If I cared that much about the
data, I'd run a (reasonably) stable kernel and call sys_sync on signals
from dying apm/battery.

This solution isn't for everyone, however.  Best to patch vim (actually,
remove the patch that did this in the first place), then fix fsync.

In general, whenever the "lazy" allocation has to finally
allocate/flush, the system can be quite unresponsive, especially if RAM
is low.  Imagine uncompressing something big that compressed well.
Performance is much lower here for reiser4 than for vfat, because less
time is spent purely IO-Wait.

Definitely want a bit more of a RAM "cushion" to prevent this, ideally
want to anticipate when to start flushing so that ram fills up just as
flush finishes.  Could anticipatory IO driver help here?

Of course, this would be an optional feature, just as one can always
choose to only enable the no-op IO driver.

Repacker is always a good thing, and is needed more for low-end users
than the high-end ones you want to pay for it.  If a normal user went
through a Gentoo install on a single reiser4 partition without a lot of
RAM, lots of fairly static but frequently used files (think glibc) could
get quite fragmented.  The user then has the option to buy another hard
drive and transfer everything to that and back, as a "repacker"
operation, or to use debian instead, or to pay large sums of money for a
"real" repacker, or to have an already-slow machine be even slower.

The real danger for real users is that they might find that with a dell
(which came with a "free" copy of Windows) and some free, downloaded
antivirus/antispyware tools, they can get a Windows machine that runs
faster than Linux/reiser4 ever will.  That's assuming people never want
to resize their disks.

This would make reiser4 a much less likely candidate for default
filesystem in any distro which wants to be more popular than Windows,
which would make it (reiser4) much less popular than it could be, which
could (I'm guessing here) make it harder for Namesys to get
contracts/paychecks.

Whew!  With all that feedback, I don't really have time to think of some
better ideas / real solutions.  Sorry about that!
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQbKde3gHNmZLgCUhAQIojA//axuugqCXPaLo5rkpzdFqXgIrdBlc9vpX
5LoOJsy8/N29d4XGgeI/m8DFrWhKFjgQpG21sY9UPwsMmwxJzGkfh8BbrYbXQ2d7
udqxVU6+alp9J182KvaT1hcTKqCd9hKM0RN0mlJ9p108G4zSevflajM453nRLwnV
XxOnGdE7jBGUbUy84xQckpCKTrQgd/d0FA6v2do/blH/p2Oa2Kju2XDlvw7/G75W
meDWGSlxBdgsjvbdfMClM8j0jnQg7pCxRutsaFOe7U3J3bSzVATmfFwFUw76ZGk0
xj+8FN4c6MMhAN9ZAQQ5JbAYWKjhIHx3kSjSYkIuRnucm1Ai9iP5ReyHTfJfeBcb
DmLL6eTTASkiyMyfvfgK7/9nXGnCMAIjqV32IhpfmYr/Fw6AwFf+6SpS8rEIljZ4
jiyU1WVJc9WqBJBZEnikQt0MPUNsTAsxKKexKhNMfPacDaz8ShFSeB+Fg3dZlXl7
6g4TUHTcUlsqbKtyAuaUdA0xhTzC4jd5IZ86e/6TiPlOFXWHC90piWUKMjuiffTN
ZNkdnBNKYNRjCwS+1svDRMI+gbJZaYbWCBNJKu/LfipXTqI0L04wKBlX8D5za8Ek
DIbjgbMiBZbCOkSrDjBjcRkqN5P/mRHP4y6uolWP6pR6pj8BUSIUMhf/GLap+I6Y
myr6W72DoF0=
=o2LF
-----END PGP SIGNATURE-----
