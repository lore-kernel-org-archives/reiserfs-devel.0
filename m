From: btinsley <btinsley@gmail.com>
Subject: error message
Date: Sat, 5 Feb 2005 21:03:54 -0600
Message-ID: <263a8b3505020519036fd3302e@mail.gmail.com>
Reply-To: btinsley <btinsley@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

We are seeing this message preceeding a kernel panic:

Feb  5 16:29:43 rcs02 kernel: vs-6030: check_internal_block_head:
invalid item number level=2, nr_items=172, free_space=65472 rdkey
kernel BUG at prints.c:334!

We have run reiserfsck on all filesystems and found no errors. Can
someone elaborate on this error?

Thanks!
