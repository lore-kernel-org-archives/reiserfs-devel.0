From: Fredrik Tolf <fredrik@dolda2000.com>
Subject: Re: XATTR bugs
Date: Wed, 10 Dec 2003 02:22:20 +0100
Message-ID: <16342.30028.148943.409122@pc7.dolda2000.com>
References: <16323.62343.428966.858580@pc7.dolda2000.com>
	<3FD65B57.8040603@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16310-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FD65B57.8040603@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Fredrik Tolf <fredrik@dolda2000.com>, reiserfs-list@namesys.com

Jeff Mahoney writes:
 > | The first bug was in inode.c and was really simple. The only thing was
 > | that #include <linux/quotaops.h> was missing. It is necessary for
 > | DQUOT_TRANSFER, which is used by the xattr patch, and as such the
 > | module won't load.
 > 
 > This bug was fixed in the updated patches.
 > 
 > | The second one was a bit more subtle. I'm using this ReiserFS to serve
 > | NFS, and I discovered that there was an ACL-related bug in
 > | reiserfs_setattr (also from inode.c). In the end of that function
 > | (line 2464 in my kernel), it makes a call to reiserfs_acl_chmod, like
 > | this:
 > [...]
 > | The thing is that I don't know ReiserFS, and so I don't really know
 > | what I'm doing. If you think this breaks anything, please tell me
 > | so. In any other case, I guess it would be a good thing to change the
 > | patches into this.
 > 
 > This bug, however, I don't believe is a bug in my code. This code works
 > fine on 2.4 kernels, and after a few minutes of searching, I've found
 > the difference.
[...]
 > 
 > The problem needs to be addressed there, not in the ReiserFS code. I'll
 > check out when and why that bit of code became errnoneous in the 2.6
 > kernel later this evening; I'm headed out the door at the moment.

These are not the greatest problems with the XATTR patches,
though; they were only what I discovered initially. The greatest
problem (I don't know if this might not appear on 2.4 kernels, but it
certainly did occur on all my 2.6 kernels) is that ACLs can suddenly
"disappear".

I don't know exactly what it was that happened, but sometimes (without
any pattern that I could notice), the ACLs would simply become
ineffective. The XATTR for the ACLs was still there, but it was as if
it wasn't taken into account for any kind of operation. When checking
with getfattr, the ACL attribute was still there and looked just as it
did before whatever happened happened, but in every other aspect it
was as if it wasn't there anymore. The only way to solve it was to run
"setfacl -b" on the affected file and then recreate the ACL.

In fact, this forced me to abandon ReiserFS in favor of XFS.
Regrettable as it may be, I didn't want to live without ACLs, and I
had too much on my hands to start debugging it... :-(

Fredrik Tolf

