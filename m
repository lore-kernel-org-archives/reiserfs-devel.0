From: Stephen Smalley <sds@epoch.ncsc.mil>
Subject: Re: [PATCH 2/5] selinux: adds a private inode operation
Date: Mon, 22 Nov 2004 10:50:48 -0500
Message-ID: <1101138640.18273.13.camel@moss-spartans.epoch.ncsc.mil>
References: <20041121001318.GC979@locomotive.unixthugs.org>
	 <1101130521.18273.9.camel@moss-spartans.epoch.ncsc.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22497-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1101130521.18273.9.camel@moss-spartans.epoch.ncsc.mil>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeffrey Mahoney <jeffm@novell.com>
Cc: Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, James Morris <jmorris@redhat.com>

On Mon, 2004-11-22 at 08:35, Stephen Smalley wrote:
> Don't we also need to modify inode_has_perm() to skip checking if the
> inode has the kernel SID (as is already done by socket_has_perm) to
> avoid the search checks when the reiserfs code looks up xattrs? 
> Otherwise, we'll see access attempts by the process context on
> directories with the kernel SID upon such lookups.

Actually, I think we need a new flag field in the inode_security_struct
to explicitly mark these "private" inodes for SELinux, so that
inode_has_perm() can skip permission checking on them while still
applying checks to any other inodes that may have the kernel SID (e.g.
/proc/pid inodes for kernel threads).

-- 
Stephen Smalley <sds@epoch.ncsc.mil>
National Security Agency

