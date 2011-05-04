From: Mimi Zohar <zohar@linux.vnet.ibm.com>
Subject: Re: [Ocfs2-devel] freeing memory allocated in
 security_inode_init_security()
Date: Wed, 04 May 2011 16:57:29 -0400
Message-ID: <1304542649.3227.78.camel@localhost.localdomain>
References: <1304536698.3227.36.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <1304536698.3227.36.camel@localhost.localdomain>
Sender: linux-security-module-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: linux-security-module <linux-security-module@vger.kernel.org>

On Wed, 2011-05-04 at 15:18 -0400, Mimi Zohar wrote:
> Hi,
> 
> Although it isn't documented in security.c, the LSM
> security_inode_init_security() hook allocates memory for xattr name and
> value, expecting the caller to release the memory afterwards.
> 
> I'm making my way through the different filesystems adding a subsequent
> call to evm_inode_post_init_security().  I see the call to
> ocfs2_init_security_and_acl() calls ocfs2_init_security_get(), which in
> turn calls security_inode_init_security(), but am having a hard time
> finding where the name and value are subsequently freed.  Would
> appreciate if someone could point it out.
> 
> thanks,
> 
> Mimi

Although the reiserfs_security_init() comment explicitly states that the
caller must call reiserfs_security_free(), I don't see it being done.

Mimi

