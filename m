From: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v8 2/6] ocfs2: Switch to security_inode_init_security()
Date: Thu, 23 Mar 2023 19:37:07 -0400
Message-ID: <CAHC9VhSPMs6k4zm0rACiZZYuB84Avg9t+AnGBH4F+iiLsNgzkg@mail.gmail.com>
References: <20230314081720.4158676-1-roberto.sassu@huaweicloud.com> <20230314081720.4158676-3-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-security-module-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1679614638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5DqnFNdwoRsvRD9gY7AVflhKHmqWJvLpG3CELYJwy4=;
        b=MvmzhjViCPcj6Nhc+3xUZBlHLNZc4r6lPParcd8U1SVaNbw7wKC7ctiSLNtETXsbZR
         SfRHOqCYRqd1uqAwWuo9yiMFLI0eaNDRiZlTA6cLo/WgAikQelZ1tHGFpIZZPWcjT35o
         RAn0baZ5sYIIGCdLt+R9DAyKHRnnJXL0EwkWhxKR9y3ewPQOPLqgHbZlIjayJV65Q4zv
         5Lw4K4PXz4x9XgSVjgC27sSASSJW5nHoZurlVklnEY9HZZJhC9oqu0bxuU17lvaxiU3a
         kl+1LdimUZ3SdVmvRmCVK2t7FT3bIF4MTO+fvC6g4axqIpSiLufJkJgHH86Rqinq42Ye
         nNDw==
In-Reply-To: <20230314081720.4158676-3-roberto.sassu@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Tue, Mar 14, 2023 at 4:18=E2=80=AFAM Roberto Sassu
<roberto.sassu@huaweicloud.com> wrote:
>
> From: Roberto Sassu <roberto.sassu@huawei.com>
>
> In preparation for removing security_old_inode_init_security(), switch to
> security_inode_init_security().
>
> Extend the existing ocfs2_initxattrs() to take the
> ocfs2_security_xattr_info structure from fs_info, and populate the
> name/value/len triple with the first xattr provided by LSMs.
>
> As fs_info was not used before, ocfs2_initxattrs() can now handle the cas=
e
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
> security_old_inode_init_security(), returns zero instead of -EOPNOTSUPP i=
f
> no xattrs were provided by LSMs or if inodes are private, additionally
> check in ocfs2_init_security_get() if the xattr name is set.
>
> If not, act as if security_old_inode_init_security() returned -EOPNOTSUPP=
,
> and set si->enable to zero to notify to the functions following
> ocfs2_init_security_get() that no xattrs are available.
>
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
> Acked-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> ---
>  fs/ocfs2/namei.c |  2 ++
>  fs/ocfs2/xattr.c | 30 ++++++++++++++++++++++++++----
>  2 files changed, 28 insertions(+), 4 deletions(-)

Merged into lsm/next, thanks.

--=20
paul-moore.com
