From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Tree issues, fsck output
Date: Tue, 29 Jun 2004 23:19:56 +0300
Message-ID: <20040629201956.GK4990@nysv.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19449-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: sikkh@wp.pl

Hi!

***** Tree Traverse Pass: scanning the reiser4 internal tree.
FSCK: Node (2013064): The last key [377f5f:4(FB):2e616339375f63:3a45d8:99] in 2 the node is greater then the right delimiting key [2fa6e:4(FB):6c69626d70342e:1e88ad:1f7c].
FSCK: Node (469959), item (28), unit (0): Points to the node [2013064] with wrong delimiting keys. The whole subtree is skipped.
Error: Can't open node 2014146.
FSCK: Node (2014146): failed to open the node pointed by the node (469959), item(29), unit (0) on the level (2). The whole subtree is skipped.
Error: Can't open node 2014147.
FSCK: Node (2014147): failed to open the node pointed by the node (469959), item(30), unit (0) on the level (2). The whole subtree is skipped.
FSCK: Node (469959), item (31), unit (0): Points to the block (2014148) which isin the tree already. The whole subtree is skipped.

How deep is the shit I'm in? :P

What brought this on?

I'll just send this post now, I'll send a follow-up when I'm re-doing
fsck with some switches. This was just a basic fsck /dev/hda1, so maybe
no need to panic yet...

-- 
mjt

