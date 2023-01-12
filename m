From: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v7 0/6] evm: Do HMAC of multiple per LSM xattrs for new inodes
Date: Thu, 12 Jan 2023 12:15:51 -0500
Message-ID: <CAHC9VhS0SnEb46-FBpn2JpC2dJ7OnkeJ2EtLBvVvkOLdfFmcbg@mail.gmail.com>
References: <20221201104125.919483-1-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Return-path: <linux-security-module-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nzSuljwXCaXyiAVCXAx1oRKKeIjSI3nJRRGJJx1quUQ=;
        b=MFOcCfEZ7Cjmr3WB5GH4eeEn0165eiypBPdejoqXwokek49v/AySoZEAZw9j2oDcmq
         y4J6DEeYf3KOdxex0i3awGU/lJNKOesgPify/ePlg8mxB+jk23/SKGnDkwfjKWs723G+
         5fTI4dD97IJHbv3KYFmaYeEhLvdEO5RWppT7C9xSdlKh60iFFNFBADUu4kCkp7oLBgpM
         RQWj59jEMMtexCUU92taNzVkPyGJ6EsQ4nGL8WFfh1sHrh7w0DJkEzpsadnRGZ+k5KlX
         9RKXsLyYhkqNOIn6C//zs9Slur/qUqHuCKIuWKiASSuuMe2SyhJoPMmQAvRwAOR8UYA5
         lbew==
In-Reply-To: <20221201104125.919483-1-roberto.sassu@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Thu, Dec 1, 2022 at 5:42 AM Roberto Sassu
<roberto.sassu@huaweicloud.com> wrote:
>
> From: Roberto Sassu <roberto.sassu@huawei.com>
>
> One of the major goals of LSM stacking is to run multiple LSMs side by side
> without interfering with each other. The ultimate decision will depend on
> individual LSM decision.
>
> Several changes need to be made to the LSM infrastructure to be able to
> support that. This patch set tackles one of them: gives to each LSM the
> ability to specify one or multiple xattrs to be set at inode creation
> time and, at the same time, gives to EVM the ability to access all those
> xattrs and calculate the HMAC on them.

...

> The patch set has been tested with both the SElinux and Smack test suites.
> Below, there is the summary of the test results:
>
> SELinux Test Suite result (without patches):
> Files=73, Tests=1346, 225 wallclock secs ( 0.43 usr  0.23 sys +  6.11 cusr 58.70 csys = 65.47 CPU)
> Result: FAIL
> Failed 4/73 test programs. 13/1346 subtests failed.
>
> SELinux Test Suite result (with patches):
> Files=73, Tests=1346, 225 wallclock secs ( 0.44 usr  0.22 sys +  6.15 cusr 59.94 csys = 66.75 CPU)
> Result: FAIL
> Failed 4/73 test programs. 13/1346 subtests failed.

Can you provide some more information on which of the
selinux-testsuite tests failed?  That shouldn't be happening and I'm a
little concerned that these test failures, even if unrelated to your
work here, could be masking failures which are related.

-- 
paul-moore.com
