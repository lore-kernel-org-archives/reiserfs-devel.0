From: Hans Reiser <reiser@namesys.com>
Subject: Re: XATTR bugs
Date: Tue, 25 Nov 2003 06:05:29 -0800
Message-ID: <3FC361A9.30709@namesys.com>
References: <16323.62343.428966.858580@pc7.dolda2000.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16166-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16323.62343.428966.858580@pc7.dolda2000.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fredrik Tolf <fredrik@dolda2000.com>
Cc: reiserfs-list@namesys.com, jeffm@suse.de

Fredrik Tolf wrote:

>Hi!
>
>I just applied the ReiserFS xattr patches to my 2.6.0-test10 Linux
>kernel, and I found what appears to be two bugs.
>
>The patches were those from
>ftp://ftp.suse.com/pub/people/jeffm/reiserfs/aclea/
>
>Since there is no mention of this URL on the namesys.com home page, I
>don't know if these patches are "official".
>
Nope.  They are suse kernel only.  The official kernel has V4 as the 
planned point of entry for ACLs, and V3 is in something very close to a 
frozen state. 

> If they aren't, please
>tell me so and I will turn elsewhere, and if you know where to mail it
>instead, please tell me that too.
>  
>
jeffm@suse.de can help you.  Please DO consider them on-topic for 
reiserfs-list though.  Just because I am not accepting them into the 
official kernel does not mean I want to stand in the way of people doing 
what they want to do with our code, and doing it effectively, it just 
means I have a different philosophy of release management.;-)

>Anyway, I'm going to ramble on as if they were official.
>
>The first bug was in inode.c and was really simple. The only thing was
>that #include <linux/quotaops.h> was missing. It is necessary for
>DQUOT_TRANSFER, which is used by the xattr patch, and as such the
>module won't load.
>
>The second one was a bit more subtle. I'm using this ReiserFS to serve
>NFS, and I discovered that there was an ACL-related bug in
>reiserfs_setattr (also from inode.c). In the end of that function
>(line 2464 in my kernel), it makes a call to reiserfs_acl_chmod, like
>this:
>
>if (!error && reiserfs_posixacl (inode->i_sb)) {
>    if (attr->ia_valid & ATTR_MODE)
>        error = reiserfs_acl_chmod (inode);
>}
>
>reiserfs_acl_chmod always returns EOPNOTSUPP if called on a
>symlink. That isn't normally a problem, but it seems that nfsd always
>chmods symlinks when they are created via this method. The symlink
>gets created as it should, but the RPC returns EIO (NFS apparently has
>no return code for EOPNOTSUPP and therefore translates it into EIO),
>which brakes many programs on the clients.
>
>I solved it by simply not calling reiserfs_acl_chmod in case the inode
>is a symlink, like this:
>
>if (!error && !S_ISLNK(inode->i_mode) && reiserfs_posixacl (inode->i_sb)) {
>    if (attr->ia_valid & ATTR_MODE)
>        error = reiserfs_acl_chmod (inode);
>}
>
>The thing is that I don't know ReiserFS, and so I don't really know
>what I'm doing. If you think this breaks anything, please tell me
>so. In any other case, I guess it would be a good thing to change the
>patches into this.
>
>Fredrik Tolf
>
>
>
>
>  
>


-- 
Hans


