From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Bug report with its cancellation?
Date: Sun, 4 Jul 2004 20:21:35 +0300
Message-ID: <20040704172135.GR4990@nysv.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19504-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi!

How well do the auto-snapshots work for people in general?

I don't know what to think, because I got my kernel working now,
like an act of god, or Nikita Danilov. I asked him to review a bug
report I thought about sending, but it appears mm/vmscan.c has
static int kswapd instead of int kswapd.

This came up when the kernel would not compile with frame pointers.
Nik gave this simple enough solution.

So I fixed that and it also solved my weird NULL pointer dereferences
and Unabilities to handle kernel paging requests.

Is this something only I suffered from or why hasn't this come up earlier?
Where is this likely to cause oopses and assorted dark voodoo magic?

But I thank everyone who I talked with about these issues and hope to
learn something new about the deepest meaning of int kswapd :)

Thank you!

-- 
mjt

