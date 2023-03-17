From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v8 2/6] ocfs2: Switch to security_inode_init_security()
Date: Fri, 17 Mar 2023 15:39:05 -0400
Message-ID: <31fc7724c9689e8ec5bd6bfe026652d238d9fb84.camel@linux.ibm.com>
References: <20230314081720.4158676-1-roberto.sassu@huaweicloud.com>
         <20230314081720.4158676-3-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=1URlbCasJqipj7wwAu3MyeP8tjG8naLb0x+gto5CH0E=;
 b=Pefo3U+lud4skk509kTTR+mhHmLTPOJvxx+Wv6DaLae1M24kbAhsa3/5WNzpvDFNkbrq
 wiTxibGXwGRpT7XkXvj7mqYp86h6z1EWERlGT+dsZ45G+Rpc0t7enir2XbcXiwM0lrnw
 gYIfhFhlnPdI8bkJjbLWBs8hjB9+kCRZpNqFy1aKAl606W/vQG4Trh27QqCOeGVYd53H
 zy87NURsiYjOLinVrdr6qBIa75cXbHVtDFBjnis+eEa59OzXZo3PGXfqAYHU//LnYDFF
 KsFQzFrvugKuh4SHXPhJqeNtBKnXHNK8xxFAxu3Pn4ojwpJV/c3MGS/2L9pKXofrcKiP HA== 
In-Reply-To: <20230314081720.4158676-3-roberto.sassu@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Tue, 2023-03-14 at 09:17 +0100, Roberto Sassu wrote:
> From: Roberto Sassu <roberto.sassu@huawei.com>
> 
> In preparation for removing security_old_inode_init_security(), switch to
> security_inode_init_security().
> 
> Extend the existing ocfs2_initxattrs() to take the
> ocfs2_security_xattr_info structure from fs_info, and populate the
> name/value/len triple with the first xattr provided by LSMs.
> 
> As fs_info was not used before, ocfs2_initxattrs() can now handle the case
> of replicating the behavior of security_old_inode_init_security(), i.e.
> just obtaining the xattr, in addition to setting all xattrs provided by
> LSMs.
> 
> Supporting multiple xattrs is not currently supported where
> security_old_inode_init_security() was called (mknod, symlink), as it
> requires non-trivial changes that can be done at a later time. Like for
> reiserfs, even if EVM is invoked, it will not provide an xattr (if it is
> not the first to set it, its xattr will be discarded; if it is the first,
> it does not have xattrs to calculate the HMAC on).
> 
> Finally, since security_inode_init_security(), unlike
> security_old_inode_init_security(), returns zero instead of -EOPNOTSUPP if
> no xattrs were provided by LSMs or if inodes are private, additionally
> check in ocfs2_init_security_get() if the xattr name is set.
> 
> If not, act as if security_old_inode_init_security() returned -EOPNOTSUPP,
> and set si->enable to zero to notify to the functions following
> ocfs2_init_security_get() that no xattrs are available.
> 
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
> Acked-by: Joseph Qi <joseph.qi@linux.alibaba.com>

Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>

