From: Chris Wright <chrisw@osdl.org>
Subject: Re: [PATCH 2/5] selinux: adds a private inode operation
Date: Mon, 22 Nov 2004 12:30:00 -0800
Message-ID: <20041122123000.C14339@build.pdx.osdl.net>
References: <20041121001318.GC979@locomotive.unixthugs.org> <1101145050.18273.68.camel@moss-spartans.epoch.ncsc.mil> <41A22A2D.1000708@suse.com> <1101148090.18273.94.camel@moss-spartans.epoch.ncsc.mil> <41A23922.80501@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22514-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <41A23922.80501@suse.com>; from jeffm@suse.com on Mon, Nov 22, 2004 at 02:08:18PM -0500
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: Stephen Smalley <sds@epoch.ncsc.mil>, Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, James Morris <jmorris@redhat.com>

* Jeff Mahoney (jeffm@suse.com) wrote:
> Excellent. Thanks. Preliminary testing works as expected (ie: deadlocks
> don't occur, xattrs/<dir> is removed when owning file is deleted)
> 
> I've integrated the changes into my patch set. With those issues
> addressed, would you feel these would be appropriate for inclusion? I
> suspect you may have gotten questions as many interested parties in this
> feature working as I have.

Why add extra hook, when this could be done in VFS with i_flags?

thanks,
-chris
-- 
Linux Security Modules     http://lsm.immunix.org     http://lsm.bkbits.net
