From: James Morris <jmorris@redhat.com>
Subject: Re: [PATCH 2/5] selinux: adds a private inode operation
Date: Mon, 22 Nov 2004 12:24:21 -0500 (EST)
Message-ID: <Xine.LNX.4.44.0411221224100.6585-100000@thoron.boston.redhat.com>
References: <1101138640.18273.13.camel@moss-spartans.epoch.ncsc.mil>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22501-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1101138640.18273.13.camel@moss-spartans.epoch.ncsc.mil>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Smalley <sds@epoch.ncsc.mil>
Cc: Jeffrey Mahoney <jeffm@novell.com>, Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Mon, 22 Nov 2004, Stephen Smalley wrote:

> Actually, I think we need a new flag field in the inode_security_struct
> to explicitly mark these "private" inodes for SELinux, so that
> inode_has_perm() can skip permission checking on them while still
> applying checks to any other inodes that may have the kernel SID (e.g.
> /proc/pid inodes for kernel threads).

Agreed.


- James
-- 
James Morris
<jmorris@redhat.com>


