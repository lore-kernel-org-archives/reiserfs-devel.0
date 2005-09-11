From: evilninja <evilninja@gmx.net>
Subject: Re: we have got hash function screwed up
Date: Mon, 12 Sep 2005 00:49:54 +0200
Message-ID: <4324B492.8090207@gmx.net>
References: <431C738F.4010803@freemail.hu>            <4322FD91.4060404@gmx.net> <200509110300.j8B30P7q013142@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25929-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509110300.j8B30P7q013142@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Valdis.Kletnieks@vt.edu

Valdis.Kletnieks@vt.edu schrieb:
> Yes, I know there's needs to support borked legacy filesystems that were mkfs'ed
> before the problem was recognized.  That means fsck.reiserfs needs to know about
> it - but mkfs.reiserfs??  Seen in the Fedora Core devel tree as of tonight:

yeah, this "feature" of mkfs.reiserfs could be removed, but since reiserfs
is in bugfixes-only-mode i don't see it happen.

i am really curious though, why the OP used rupasov hash at all. r5 is the
default algorithm for years now.

-- 
BOFH excuse #80:

That's a great computer you have there; have you considered how it would
work as a BSD machine?
