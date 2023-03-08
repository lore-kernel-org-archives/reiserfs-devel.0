From: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v7 0/6] evm: Do HMAC of multiple per LSM xattrs for new inodes
Date: Wed, 8 Mar 2023 17:16:26 -0500
Message-ID: <CAHC9VhTRT=o9Rv+EhZ4aab1FDCyTNa7XEYuhuOiSEkWh0Cdrnw@mail.gmail.com>
References: <20221201104125.919483-1-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-security-module-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1678313798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkhViH9kdWNjYXwKnPEs08Xl3095dV6IZ6LM3uHmPgg=;
        b=bPXrjsfNIA8aCilQN80V8tZJJRnYiUaUiYYE6WDP0poZXHmgRnngHO4Lb96J8qrY8s
         0UFv5K7lMRJloKD0tWGMmVKDB1rB7L2PYgY245lC/cGDS2TdHabWAHsD74tYHk7XWX+9
         ctSErcrpU4ra1h7MNt4j2JB1T46qH5KSu8XZMjjoIq7fVYdLws67bRDNtSSAyq5ddIEU
         URzRfvXhHoHE7mhDjTIo/KgBW+4k4yBsfFL5q4a+jwiG/cTxuGsLWCziz32JVyllZ+pC
         DZbdjHIIJFo9Zy6iaSLyCS5thVAOwak49iMLSnuOr6HQ+YCMlQc6/QjcnOmMkEQALnF5
         7qLg==
In-Reply-To: <20221201104125.919483-1-roberto.sassu@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Thu, Dec 1, 2022 at 5:42=E2=80=AFAM Roberto Sassu
<roberto.sassu@huaweicloud.com> wrote:
>
> From: Roberto Sassu <roberto.sassu@huawei.com>
>
> One of the major goals of LSM stacking is to run multiple LSMs side by si=
de
> without interfering with each other. The ultimate decision will depend on
> individual LSM decision.
>
> Several changes need to be made to the LSM infrastructure to be able to
> support that. This patch set tackles one of them: gives to each LSM the
> ability to specify one or multiple xattrs to be set at inode creation
> time and, at the same time, gives to EVM the ability to access all those
> xattrs and calculate the HMAC on them.

Hi Roberto,

The v7 draft of this patchset had some good discussion, and based on a
quick read of the comments it looks like everyone was eventually
satisfied that the v7 draft was good and no further changes were
necessary, is that correct or do you have an updated draft of this
patchset?

--=20
paul-moore.com
