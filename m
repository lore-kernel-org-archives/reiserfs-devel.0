From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: reiser4progs 0.5.6 broken?
Date: Wed, 14 Jul 2004 23:57:07 +0300
Message-ID: <20040714205707.GJ4990@nysv.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19619-reiserfs=m.gmane.org@namesys.com>
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

I downloaded the sources with the intention of compiling them.
libaal went in ok.

# dpkg -l | grep baal
ii  libaal-dev     0.5.3-1        The Reiser4's application abstraction librar

(That's what debian calls it, I use Dominico Andreoli's prepackaged, older
versions as templates)

I patched libaux/gauge.c

Anyway, this is how it followed:

checking for libaal version = 0.5.3...
An old version of libaal (0.5.0) was found.
You need a version of libaal newer than 0.5.3.
You can get it at http://www.namesys.com/snapshots
no

I also noted that I can't compile reiser4progs 0.5.5 either with this.

So I break out the chainsaw and break configure to always return 0, because
I know I'm right here. It actually shut up and obeyed.

checking for aal/libaal.h... yes
checking for libaal version = 0.5.3... yes
configure: creating ./config.status
config.status: creating Makefile

Earlier I had some weird problems after breaking it like that[1]
but fortunately I somehow got rid of them :)

So, uhh, where do we stand with these issues?
What caused this?
Is this isolated to me, some redundant remnant file?

The thing is, I'm stuck on my rescue partition. I'm uploading metadata
now for vs, zam or any other Namesys guy (url forthcoming tomorrow)
and I'm gonna explain to them why it crashed.

I just figured I'd use the latest tools to fsck it.

Thanks!

[1]
/bin/sh ../libtool --mode=link i386-linux-gcc  -Wall -g -O2 -Iyes/include -W
-Wall -Wuninitialized -Wno-unused-parameter -Wredundant-decls  -Lyes/lib -o
libaux-static.la   libaux_static_la-aux.lo libaux_static_la-bitmap.lo
libaux_static_la-gauge.lo  -Lyes/lib
../libtool: line 1: cd: yes/lib: No such file or directory

-- 
mjt

