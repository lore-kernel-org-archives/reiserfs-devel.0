From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [PATCH v7 2/6] ocfs2: Switch to security_inode_init_security()
Date: Wed, 08 Feb 2023 15:33:12 +0100
Message-ID: <dc973294e5ad2d05705954b433bb550b04a86325.camel@huaweicloud.com>
References: <20221201104125.919483-1-roberto.sassu@huaweicloud.com>
         <20221201104125.919483-3-roberto.sassu@huaweicloud.com>
         <6905166125130c22c244ebf234723d1587a01ae8.camel@huaweicloud.com>
         <CAHC9VhRu_pdEur4XDkwMETAQEd-8=13k+qvpMEgW=hiYMCKw2A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <CAHC9VhRu_pdEur4XDkwMETAQEd-8=13k+qvpMEgW=hiYMCKw2A@mail.gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Moore <paul@paul-moore.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Thu, 2023-01-12 at 12:21 -0500, Paul Moore wrote:
> On Tue, Jan 10, 2023 at 3:56 AM Roberto Sassu
> <roberto.sassu@huaweicloud.com> wrote:
> > On Thu, 2022-12-01 at 11:41 +0100, Roberto Sassu wrote:
> > > From: Roberto Sassu <roberto.sassu@huawei.com>
> > > 
> > > In preparation for removing security_old_inode_init_security(), switch to
> > > security_inode_init_security().
> > > 
> > > Extend the existing ocfs2_initxattrs() to take the
> > > ocfs2_security_xattr_info structure from fs_info, and populate the
> > > name/value/len triple with the first xattr provided by LSMs.
> > 
> > Hi Mark, Joel, Joseph
> > 
> > some time ago I sent this patch set to switch to the newer
> > function security_inode_init_security(). Almost all the other parts of
> > this patch set have been reviewed, and the patch set itself should be
> > ready to be merged.
> > 
> > I kindly ask if you could have a look at this patch and give your
> > Reviewed-by, so that Paul could take the patch set.
> 
> I've been pushing to clean up some of the LSM interfaces to try and
> simplify things and remove as many special cases as possible,
> Roberto's work in this patchset is part of that.  I would really
> appreciate it if the vfs/ocfs2 folks could give patch 2/6 a quick look
> to make sure you are okay with the changes.
> 
> I realize that the various end-of-year holidays tend to slow things
> down a bit, but this patchset has been on the lists for over a month
> now; if I don't hear anything in the next week or two I'll assume you
> folks are okay with these patches ...

Hi Paul

is this patch set going to land in 6.3?

Thanks

Roberto

