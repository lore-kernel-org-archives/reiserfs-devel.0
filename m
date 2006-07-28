From: "Hua Zhong" <hzhong@gmail.com>
Subject: RE: metadata plugins (was Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion)
Date: Fri, 28 Jul 2006 13:14:54 -0700
Message-ID: <005e01c6b282$7eb372e0$493d010a@nuitysystems.com>
References: <44CA6905.4050002@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29238-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44CA6905.4050002@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'David Masover' <ninja@slaphack.com>, 'Hans Reiser' <reiser@namesys.com>
Cc: 'Linus Torvalds' <torvalds@osdl.org>, "'Horst H. von Brand'" <vonbrand@inf.utfsm.cl>, 'Jeff Garzik' <jeff@garzik.org>, 'Andrew Morton' <akpm@osdl.org>, 'Theodore Tso' <tytso@mit.edu>, 'LKML' <linux-kernel@vger.kernel.org>, 'ReiserFS List' <reiserfs-list@namesys.com>

> Doesn't have to be in fstab, I hope, but think of it this 
> way:  ext3 uses JBD for its journaling.  As I understand it, 
> any other filesystem can also use JBD, and ext3 is mostly ext2 + JDB.

The fact that no other major journaling filesystems use JBD except EXT3 might make this idea less appealing..

You can also say "other filesystems CAN use plugin". But who actually want to use it now? Even if there are people that want to use
it, they should help doing the work.

I remember someone said something along the lines of "Linux is evolution, not revolution". To me it seems unreasonable to put all
the "revolutionary" VFS burden upon reiserfs team. It's not practical.

Hua

