From: Francesco Biscani <frbiscani@jumpy.it>
Subject: fsck.reiser4 wrong size error (?)
Date: Tue, 10 Aug 2004 19:48:29 +0200
Message-ID: <200408101948.29202.frbiscani@jumpy.it>
References: <cd32a06204080910256de4cc0e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20132-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <cd32a06204080910256de4cc0e@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

lately whenever I run fsck.reiser4 I get loads of errors about wrong sizes, 
e.g., something like [1] "Object foo (stat40) has wrong size, should be X 
bytes". fsck suggests to --fix them, which I do, and indeed another run of 
fsck confirms that there are no problems. However after mounting the 
partition and working a bit on it, I get those size errors again, even if the 
partition was umounted cleanly. This happens:

- with 0.5.6, 0.5.6-fixed and 1.0.0 reiser4progs,
- on two different partitions on two different machines,
- before and after updating the fs layout (by means of debugfs -C).

I'm running the latest _stable_ snapshot (against 2.6.8-rc2-mm2), but I 
remember this happening also with previous auto-snapshot (though it did not 
use to happen in my early 0.5.6 days). What's going on here?

Regards,

  Francesco



[1] Sorry, I don't remember exactly the error message, will post it if needed.
