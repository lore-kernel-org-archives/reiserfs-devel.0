From: "David Masover" <jedi@ninja.dynup.net>
Subject: Re: fsck.reiser4
Date: Mon, 22 Dec 2003 12:07:06 -0600
Message-ID: <20031222180706.12638.qmail@ninja.dynup.net>
References: <200312212203.52775.janfengler@web.de>
            <200312221523.26888.vitaly@namesys.com>
            <3FE6F7DD.7000503@libero.it>
            <200312221702.07705.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16382-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200312221702.07705.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: reiserfs-list@namesys.com

Vitaly Fertman writes: 

> 
> you need the latest libaal to be installed first.
> bk clone bk://bk.namesys.com/bk/libaal
> prepare
> configure
> make 
> make install
> ldconfig 
> 
> Then you can build the reiser4progs.

I did that, and it all worked, but then the reiser4progs wouldn't install.  
I tried some really ugly hacks, and almost got it to compile.  The only 
thing I changed before that is to add my own CFLAGS (from my Gentoo 
/etc/make.conf):  -march=i686 -mmmx -Os -pipe -fomit-frame-pointer.  Those 
shouldn't break anything, should they? 

Once I've got my copy, how do I update it?  I tried this: 

cd libaal
bk pull 

But it gives me no output for about 5 mins straight.  Not much network 
activity, not much CPU usage.  Is this the right command to run?  Is there a 
way to make it verbose? 

Also, I may have reiserfsprogs and the old libaal installed (just not in 
/usr/local).  I think I'll get rid of those, nuke the source dirs and most 
of /usr/local, and try again from the top.
