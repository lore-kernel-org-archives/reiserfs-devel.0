From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v4 2/5] security: Rewrite
 security_old_inode_init_security()
Date: Mon, 21 Nov 2022 15:54:19 -0500
Message-ID: <7812899531b2bd936b25fde8fc2f1c2a6080b2bd.camel@linux.ibm.com>
References: <20221110094639.3086409-1-roberto.sassu@huaweicloud.com>
         <20221110094639.3086409-3-roberto.sassu@huaweicloud.com>
         <3dc4f389ead98972cb7d09ef285a0065decb0ad0.camel@linux.ibm.com>
         <aa5fa8c5f231115c58012352124df57d16a01e41.camel@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=7zCKX/4UjpQvenyrT8VZruRvalqRXYR6+icK2FwSEa4=;
 b=fjtgG3U2n53yDeBNWAZuAm3PDp2cFZ4R3+ps1ia+cUwJML1awN2FqbGANmzxLw3UJMYq
 Uu8+aG2GzpO8uIT0Z23sckf4UdI5xjyiqqRNgUTHRoe87JtPlu98IBi8JYfApYlSn2xi
 HpU8qBbTjKzIKFPZ9BY0rcnuAJloMtpYNnMm26B2pcgaQhMmzPvjty9uW+2L5BrRfvLQ
 gn5DTw7tKzTELyz8KJVaqGj1LZvCyv26ozGzuZmwB/tOniflRgcwcpYILFgyNjQ5uLc4
 0Et/aqTPAImeHW36i2Dut7UhGX0ppme5Vy7GGLwBjyKmYa5IvciD2rLbP14Hbfjvmg1y UA== 
In-Reply-To: <aa5fa8c5f231115c58012352124df57d16a01e41.camel@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>, ocfs2-devel@oss.oracle.com

On Mon, 2022-11-21 at 10:45 +0100, Roberto Sassu wrote:
> > As ocfs2 already defines initxattrs, that leaves only reiserfs missing
> > initxattrs().  A better, cleaner solution would be to define one.
> 
> If I understood why security_old_inode_init_security() is called
> instead of security_inode_init_security(), the reason seems that the
> filesystem code uses the length of the obtained xattr to make some
> calculations (e.g. reserve space). The xattr is written at a later
> time.
> 
> Since for reiserfs there is a plan to deprecate it, it probably
> wouldn't be worth to support the creation of multiple xattrs. I would
> define a callback to take the first xattr and make a copy, so that
> calling security_inode_init_security() + reiserfs_initxattrs() is
> equivalent to calling security_old_inode_init_security().
> 
> But then, this is what anyway I was doing with the
> security_initxattrs() callback, for all callers of security_old_inode_i
> nit_security().
> 
> Also, security_old_inode_init_security() is exported to kernel modules.
> Maybe, it is used somewhere. So, unless we plan to remove it
> completely, it should be probably be fixed to avoid multiple LSMs
> successfully setting an xattr, and losing the memory of all except the
> last (which this patch fixes by calling security_inode_init_security())
> .
> 
> If there is still the preference, I will implement the reiserfs
> callback and make a fix for security_old_inode_init_security().

There's no sense in doing both, as the purpose of defining a reiserfs
initxattrs function was to clean up this code making it more readable.

Mimi


