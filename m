From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH 1/5] xattr: Complete constify ->name member of "struct
 xattr"
Date: Thu, 15 Apr 2021 20:20:15 +0900
Message-ID: <164b0933-0917-457e-4dad-245ea13cbe52@i-love.sakura.ne.jp>
References: <20210415100435.18619-1-roberto.sassu@huawei.com>
 <20210415100435.18619-2-roberto.sassu@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20210415100435.18619-2-roberto.sassu@huawei.com>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huawei.com>, Jeff Mahoney <jeffm@suse.com>
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, stable@vger.kernel.org, zohar@linux.ibm.com, jmorris@namei.org, paul@paul-moore.com, casey@schaufler-ca.com

On 2021/04/15 19:04, Roberto Sassu wrote:
> This patch completes commit 9548906b2bb7 ('xattr: Constify ->name member of
> "struct xattr"'). It fixes the documentation of the inode_init_security
> hook, by removing the xattr name from the objects that are expected to be
> allocated by LSMs (only the value is allocated). Also, it removes the
> kfree() of name and setting it to NULL in the reiserfs code.

Good catch, but well, grep does not find any reiserfs_security_free() callers.
Is reiserfs_security_free() a dead code?
