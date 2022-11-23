From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v5 0/6] evm: Prepare for moving to the LSM infrastructure
Date: Wed, 23 Nov 2022 07:28:19 -0500
Message-ID: <ccf1937cfdcc5bb28dcc7a58785dd0c65d974597.camel@linux.ibm.com>
References: <20221123095202.599252-1-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=z6Z//LUT0fOyn/j0x1lDLd1Mhd5eIGzmBSNnRr9ZuF8=;
 b=IqzRD4WR9jzHU0/inl9phbRdTIC68a/YMhn4PsPPnZjzrTYotc7UiHLU8znqVJO8yY8D
 QtmKtjYlGfrmqztS42seEwgmCxBbf5NVKXHnH0yLlOYg01btx/1d8lf+NWrT+kk+IEdz
 2rsnkXf3tf5qnMVDqft8/EXkLSjU4Qdrt2IDzqtz6VGi4WnaVW+u+IPOIbZqZya5h7l0
 EYl1pJ/5iYKpT12tX7krp+LgQdB8bJXfTIiPTBYIHGcy4f64BPGkC7QsshT5tvK23G25
 Ax6iaLX/lrtfmbd9QSfYGaufkDHF7SWqtnxuE46abOXjKzMwLz86iD8XRFhz9zDmS6vC pg== 
In-Reply-To: <20221123095202.599252-1-roberto.sassu@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

Hi Roberto,

On Wed, 2022-11-23 at 10:51 +0100, Roberto Sassu wrote:
> From: Roberto Sassu <roberto.sassu@huawei.com>
> 
> One of the challenges that must be tackled to move IMA and EVM to the LSM
> infrastructure is to ensure that EVM is capable to correctly handle
> multiple stacked LSMs providing an xattr at file creation. At the moment,
> there are few issues that would prevent a correct integration. This patch
> set aims at solving them.

Let's take a step back and understand the purpose of this patch set. 
Regardless of whether IMA and EVM are moved to the "LSM
infrastructure", EVM needs to support per LSM xattrs.  A side affect is
the removal of the security_old_inode_init_security hook.  This patch
set cover letter and patch descriptions should be limited to EVM
support for per LSM (multiple) xattrs.  The motivation, concerns, and
problems of making IMA and EVM LSMs will be documented in the patch set
that actual makes them LSMs.  Please remove all references to "move IMA
and EVM to the LSM infrastructure".

When EVM was upstreamed, there were filesystem limitations on the
number and size of the extended attributes.  In addition there were
performance concerns, which resulted in staging the LSM, IMA and EVM
xattrs, before calling initxattrs to write them at the same time.  With
this patch set, not only are per LSM xattrs supported, but multiple per
LSM xattrs are supported as well.  Have the size limitation concerns
been addressed by the different filesystems?   If not, then at minimum
this patch set needs to at least mention it and the possible
ramifications.

-- 
thanks,

Mimi

