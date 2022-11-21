From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [PATCH v4 2/5] security: Rewrite
 security_old_inode_init_security()
Date: Mon, 21 Nov 2022 10:45:19 +0100
Message-ID: <aa5fa8c5f231115c58012352124df57d16a01e41.camel@huaweicloud.com>
References: <20221110094639.3086409-1-roberto.sassu@huaweicloud.com>
         <20221110094639.3086409-3-roberto.sassu@huaweicloud.com>
         <3dc4f389ead98972cb7d09ef285a0065decb0ad0.camel@linux.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <3dc4f389ead98972cb7d09ef285a0065decb0ad0.camel@linux.ibm.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mimi Zohar <zohar@linux.ibm.com>, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>, ocfs2-devel@oss.oracle.com

On Thu, 2022-11-17 at 08:03 -0500, Mimi Zohar wrote:
> Hi Roberto,
> 
> On Thu, 2022-11-10 at 10:46 +0100, Roberto Sassu wrote:
> > From: Roberto Sassu <roberto.sassu@huawei.com>
> > 
> > Rewrite security_old_inode_init_security() to call
> > security_inode_init_security() before making changes to support multiple
> > LSMs providing xattrs. Do it so that the required changes are done only in
> > one place.
> 
> Only security_inode_init_security() has support for EVM.   Making
> security_old_inode_init_security() a wrapper for
> security_inode_init_security() could result in security.evm extended
> attributes being created that previously weren't created.
> 
> In fact ocfs2 defines ocfs2_init_security_get() as a wrapper for both
> the old and new inode_init_security calls based on the caller's
> preference.   Only mknod and symlink seem to use the old function. 
> Wondering why do they differentiate between callers?  (Cc'ing the ocfs2
> mailing list as they're affected by this change.)
> 
> "[PATCH v4 1/5] reiserfs: Add missing calls to
> reiserfs_security_free()"  fixed a memory leak.  I couldn't tell if
> there was a similar memory leak in ocfs2, the only other user of
> security_old_inode_init_security().

From what I see, there is no memory leak there.

> As ocfs2 already defines initxattrs, that leaves only reiserfs missing
> initxattrs().  A better, cleaner solution would be to define one.

If I understood why security_old_inode_init_security() is called
instead of security_inode_init_security(), the reason seems that the
filesystem code uses the length of the obtained xattr to make some
calculations (e.g. reserve space). The xattr is written at a later
time.

Since for reiserfs there is a plan to deprecate it, it probably
wouldn't be worth to support the creation of multiple xattrs. I would
define a callback to take the first xattr and make a copy, so that
calling security_inode_init_security() + reiserfs_initxattrs() is
equivalent to calling security_old_inode_init_security().

But then, this is what anyway I was doing with the
security_initxattrs() callback, for all callers of security_old_inode_i
nit_security().

Also, security_old_inode_init_security() is exported to kernel modules.
Maybe, it is used somewhere. So, unless we plan to remove it
completely, it should be probably be fixed to avoid multiple LSMs
successfully setting an xattr, and losing the memory of all except the
last (which this patch fixes by calling security_inode_init_security())
.

If there is still the preference, I will implement the reiserfs
callback and make a fix for security_old_inode_init_security().

Thanks

Roberto

> thanks,
> 
> Mimi
> 
> > Define the security_initxattrs() callback and pass it to
> > security_inode_init_security() as argument, to obtain the first xattr
> > provided by LSMs.
> > 
> > This behavior is a bit different from the current one. Before this patch
> > calling call_int_hook() could cause multiple LSMs to provide an xattr,
> > since call_int_hook() does not stop when an LSM returns zero. The caller of
> > security_old_inode_init_security() receives the last xattr set. The pointer
> > of the xattr value of previous LSMs is lost, causing memory leaks.
> > 
> > However, in practice, this scenario does not happen as the only in-tree
> > LSMs providing an xattr at inode creation time are SELinux and Smack, which
> > are mutually exclusive.
> > 
> > Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>b

