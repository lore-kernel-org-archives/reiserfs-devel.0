From: Tom Oehser <tom@toms.net>
Subject: buffer-300 oops
Date: Sat, 30 Mar 2002 10:31:51 -0500 (EST)
Message-ID: <Pine.LNX.4.44.0203301030260.835-100000@conn6m.toms.net>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-ID: <Pine.LNX.4.44.0203301030262.835@conn6m.toms.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


- I am trying to upgrade tomsrtbt to 2.2.20, and in the process support
  reiserfs.

- I patched 2.2.20 with the 3.5.34 patch (is this OK?), the patch applied
  cleanly with no rejects.

- I mount existing reiserfs filesystems, or create new ones.

- As soon as anything actually tries to write, I get something like:

buffer-300:BAD, count is 1 for buffer 16
buffer-300:BAD, count is 1 for buffer 37
Unable to handle kernel paging request at virtual address c20021f4

... (I can reproduce it if you want all of it...)

EIP    0010:[<c0179a39>]

...

?? Is this just that the patch is incompatible with 2.2.20 ??

?? What more do I need to do to debug it and fix it ??

?? Help... ??

-Tom

P.S., I saw a message in the mailing list archives that looks like the
same problem, that said something had been left out of the current patch.

But, I can't find said pieces to fix it... is the current patch broken?

-Tom

