From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Some errors, tree-related?
Date: Mon, 28 Jun 2004 22:47:41 +0300
Message-ID: <20040628194741.GG4990@nysv.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19435-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi

While I was toying around with unrelated stuff, I noticed I got the good
old jamming problems that I had with some older auto-snapshot, that is,
apt-get would lock on 93% and tab expansion would as well, then everything
would lock. Rebooting needs the SysRq trio.

Now I got the behavior again, and noted some stuff in the log that I
could swear wasn't there when I last had these problems. On the other hand, 
I don't know if they're related. That's why I'm mailing here :)

Jun 28 22:18:53 shrike kernel: reiser4[xmms(3797)]: traverse_tree (fs/reiser4/search.c:747)[nikita-1481]:
Jun 28 22:18:53 shrike kernel: WARNING: Too many iterations: 1048576
Jun 28 22:19:15 shrike kernel: reiser4[xmms(3797)]: traverse_tree (fs/reiser4/search.c:747)[nikita-1481]:
Jun 28 22:19:15 shrike kernel: WARNING: Too many iterations: 2097152
Jun 28 22:19:46 shrike kernel: reiser4[xmms(3797)]: traverse_tree (fs/reiser4/search.c:747)[nikita-1481]:
Jun 28 22:19:46 shrike kernel: WARNING: Too many iterations: 4194304

Then I restarted the computer. Bugger me, I can't remember if I restarted
because of a lock-up there or not, but this I got later:

Jun 28 22:36:21 shrike kernel: reiser4[xmms(3834)]: renew_sibling_link (fs/reiser4/tree_walk.c:441)[nikita-3532]:
Jun 28 22:36:21 shrike kernel: WARNING: Sibling nodes on the different levels: 1 != 2

[...]

Jun 28 22:38:51 shrike kernel: reiser4[xmms(4068)]: renew_sibling_link (fs/reiser4/tree_walk.c:441)[nikita-3532]:
Jun 28 22:38:51 shrike kernel: WARNING: Sibling nodes on the different levels: 1 != 2

So, what's up here? Is it related to any known stability issue?

I re-mkfs'd my home partition, but did an fsck on the / partition, when it
was last needed. Could that affect here? Do I _really_ have to mkfs again?
Or am I barking up the wrong tree? (No pun intended :D)

Thanks!

-- 
mjt

