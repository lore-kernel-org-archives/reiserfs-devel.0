From: btinsley <btinsley@gmail.com>
Subject: vs-6030
Date: Thu, 3 Mar 2005 15:43:02 -0600
Message-ID: <263a8b350503031343182f4e4a@mail.gmail.com>
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

I posted this kernel panic once before and received no response. Now I
have another occurence and I need to find out what is happening:

vs-6030: check_internal_block_head: invalid item number level=2,
nr_items=211, free_space=64536 rdkey kernel BUG at prints.c:334!
invalid operand: 0000 2.4.21-241-smp #1 SMP Tue Aug 10 15:55:34 UTC 2004

Running reiserfsck (3.6.19) detects no problems. Running a
--rebuild-tree doesn't seem to correct the problem. It seems the only
way it is repaired is to run mkreiserfs, which is totally
unacceptable.

Any assistance is much appreciated. If I need to arrange to pay for
support, I can.

Thanks!
