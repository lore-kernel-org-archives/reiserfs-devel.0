From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Subject: Re: reiser4 snapshot
Date: Mon, 11 Aug 2003 18:41:28 +0200
Message-ID: <3F37C738.9060806@gmx.net>
References: <16183.48363.884605.564937@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15283-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16183.48363.884605.564937@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>
Cc: Nikita Danilov <Nikita@Namesys.COM>

Nikita Danilov wrote:
> Hello,
> 
> new reiser4 snapshot is available at 
> 
> http://thebsh.namesys.com/snapshots/2003.08.11/

+config REISER4_LARGE_KEY
+	bool "Use larger keys on reiser4 tree"
+	depends on REISER4_FS
+	default y
+	---help---
+      Make keys larger and use additional bits to order bodies of files
within
+      a directory in the order of their names, which is what you want
+      normally. If you turn this off, file bodies will be ordered by creation
+      time, which is not optimal for most users.
+
+      Warning: flipping this option makes your file system binary
+      incompatible.

This needs some explanation. What happens if I have two reiser4 fs on my
disk, one written with REISER4_LARGE_KEY, the other one without? Does it
prevent me from mounting both filesystems at the same time? If so, will
this change some time?


Thanks,
Carl-Daniel

