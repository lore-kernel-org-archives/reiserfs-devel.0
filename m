From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 errors
Date: Mon, 22 Dec 2003 15:08:36 +0300
Message-ID: <200312221506.56809.vitaly@namesys.com>
References: <20031213180246.3042.qmail@ninja.dynup.net> <200312151657.58459.vitaly@namesys.com> <20031220172413.17197.qmail@ninja.dynup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16372-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031220172413.17197.qmail@ninja.dynup.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jedi Ninja <jedi@ninja.dynup.net>, reiserfs-list@namesys.com

On Saturday 20 December 2003 20:24, Jedi Ninja wrote:
> I recently reproduced the same bug, once in /tmp, and later in /home (ack).

what same bug? That mounting hands forever? Or smth with fsck.reiser4?

> I have time to (try to) debug it now.  It's possible that I have some bad
> blocks, though.  How do I check for that?

/sbin/badblocks can reveal them.

> As of this writing, reiser4progs won't compile.
>
> If I configure without --disable-Werror (as in, -Werror is enabled), I get
> warnings that become errors about implicit, redundant, and then previous
> definitions of aal_exception_error.

you should install the latest libaal first. And the recent version has
--enable-Werror instread, it is disabled by default now.

> If I configure with --disable-Werror, make gives me errors about
> EXCEPTION_FATAL, EXCEPTION_YESNO, and EXCEPTION_NO being undefined in
> format40_repair.c
>
> I can't paste the exact errors just now, as I am writing this from lynx (my
> /home was blown away).
>
> This is depressing.  I'm off to the PS2 for a day or so, then I'll re-clone
> and try again.
>
> (I'm new to bk, so I guessed:  bk clone bk://somewhere?)

bk clone bk://something, it will be created in the current directory.

bk clone bk://bk.namesys.com/bk/libaal
bk clone bk://bk.namesys.com/bk/reiser4progs

-- 
Thanks,
Vitaly Fertman


