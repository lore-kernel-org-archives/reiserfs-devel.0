From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Fibration etc
Date: Thu, 15 Apr 2004 23:02:43 +0300
Message-ID: <20040415200243.GX14134@nysv.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17970-reiserfs=m.gmane.org@namesys.com>
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

I think this may be of some interest to other people too, so I won't just
take it up on IRC.

What's up with this:
mjt@shrike:~/tmp$ echo -e 'lexicographic\0' > ..metas/plugin/fibration
mjt@shrike:~/tmp$ cat ..metas/plugin/fibration 
1 dot-o fibrate .o files separatelymjt@shrike:~/tmp$ 

I actually noticed that it changes the behavior of empty directories.
Maybe the READ.ME should mention this?

Is there any means of refibrating populated directories or do I have to
bounce everything by some tmp directory?

This is then also correct, it just fails because directories are
populated with dot-o?

/dev/hda1       /               reiser4 defaults,plugin.fibration=ext-1
0       0

However, if I do an mkdir after having mounted like that, shouldn't
all new directories be ext-1 by default, not dot-o?

How does the fibration work with links? Does it fibrate names of files
or contents of files together? How about hardlinks? Does it follow
symlinks?

Is there some way of check that with some debug tool?

Thanks!

-- 
mjt

