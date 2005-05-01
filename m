From: Jake Maciejewski <maciejej@msoe.edu>
Subject: reiser4 on PPC
Date: Sun, 01 May 2005 12:03:13 -0500
Message-ID: <1114966993.11906.59.camel@gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23949-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Now that reiser4 seems to be working on AMD64, I'm trying to test it on
PPC. Unfortunately, I haven't even been able to mount a reiser4 FS.

I get the following error: "mount: No such file or directory". I've
tried a loopback filesystem and a native partition. The same native
patition works when formatted with reiserFS. I've tried the code as a
module and builtin. I was using reiser4progs 1.0.4 and the latest -mm
patch on vanilla, which while not officially supported works on AMD64
and x86 and shouldn't cause a problem like this. fsck.reiser4 says the
unmountable filesystem is consistent. Is there anything else I should
try?

-- 
Jake Maciejewski <maciejej@msoe.edu>

