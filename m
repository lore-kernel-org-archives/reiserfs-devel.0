From: Stefan Schweizer <sschweizer@gmail.com>
Subject: Re: http://www.namesys.com/snapshots/2004.08.09-internal.testing/
Date: Mon, 9 Aug 2004 23:01:49 +0200
Message-ID: <e796392204080914014bf72d1f@mail.gmail.com>
References: <200408092355.13380.vitaly@namesys.com> <e796392204080913384ac39553@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20109-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e796392204080913384ac39553@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

On grub compile:

In file included from /usr/include/aal/libaal.h:17,
                from /usr/include/reiser4/libreiser4.h:13,
                from fsys_reiser4.c:27:
/usr/include/aal/types.h:62: error: conflicting types for `va_list'
/usr/lib/gcc-lib/i686-pc-linux-gnu/3.3.4/include/stdarg.h:105: error:
previous declaration of `va_list'

When I try debugfs.reiser4:

 # debugfs.reiser4 -C /dev/hda1 -f
debugfs.reiser4 1.0.0
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by 
reiser4progs/COPYING. 

Segmentation fault
 #

Obviously reiser4 likes segfaults.

Stefan
