From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [PATCH v7 0/6] evm: Do HMAC of multiple per LSM xattrs for new
 inodes
Date: Thu, 09 Mar 2023 08:53:48 +0100
Message-ID: <250fe1947dd3fea27d8f4aa86fdb9980954b5425.camel@huaweicloud.com>
References: <20221201104125.919483-1-roberto.sassu@huaweicloud.com>
         <CAHC9VhTRT=o9Rv+EhZ4aab1FDCyTNa7XEYuhuOiSEkWh0Cdrnw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <CAHC9VhTRT=o9Rv+EhZ4aab1FDCyTNa7XEYuhuOiSEkWh0Cdrnw@mail.gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Paul Moore <paul@paul-moore.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Wed, 2023-03-08 at 17:16 -0500, Paul Moore wrote:
> On Thu, Dec 1, 2022 at 5:42=E2=80=AFAM Roberto Sassu
> <roberto.sassu@huaweicloud.com> wrote:
> > From: Roberto Sassu <roberto.sassu@huawei.com>
> >=20
> > One of the major goals of LSM stacking is to run multiple LSMs side by =
side
> > without interfering with each other. The ultimate decision will depend =
on
> > individual LSM decision.
> >=20
> > Several changes need to be made to the LSM infrastructure to be able to
> > support that. This patch set tackles one of them: gives to each LSM the
> > ability to specify one or multiple xattrs to be set at inode creation
> > time and, at the same time, gives to EVM the ability to access all those
> > xattrs and calculate the HMAC on them.
>=20
> Hi Roberto,
>=20
> The v7 draft of this patchset had some good discussion, and based on a
> quick read of the comments it looks like everyone was eventually
> satisfied that the v7 draft was good and no further changes were
> necessary, is that correct or do you have an updated draft of this
> patchset?

Hi Paul

I addressed few more concerns from Mimi and Casey. I think v8 should be
good to send (unless you have more comments/suggestions).

Thanks

Roberto

