From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [PATCH v7 0/6] evm: Do HMAC of multiple per LSM xattrs for new
 inodes
Date: Fri, 13 Jan 2023 11:35:13 +0100
Message-ID: <7e8af24bc175b425777c1e689c26562dc743bfd5.camel@huaweicloud.com>
References: <20221201104125.919483-1-roberto.sassu@huaweicloud.com>
         <CAHC9VhS0SnEb46-FBpn2JpC2dJ7OnkeJ2EtLBvVvkOLdfFmcbg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CAHC9VhS0SnEb46-FBpn2JpC2dJ7OnkeJ2EtLBvVvkOLdfFmcbg@mail.gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Moore <paul@paul-moore.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Thu, 2023-01-12 at 12:15 -0500, Paul Moore wrote:
> On Thu, Dec 1, 2022 at 5:42 AM Roberto Sassu
> <roberto.sassu@huaweicloud.com> wrote:
> > From: Roberto Sassu <roberto.sassu@huawei.com>
> > 
> > One of the major goals of LSM stacking is to run multiple LSMs side by side
> > without interfering with each other. The ultimate decision will depend on
> > individual LSM decision.
> > 
> > Several changes need to be made to the LSM infrastructure to be able to
> > support that. This patch set tackles one of them: gives to each LSM the
> > ability to specify one or multiple xattrs to be set at inode creation
> > time and, at the same time, gives to EVM the ability to access all those
> > xattrs and calculate the HMAC on them.
> 
> ...
> 
> > The patch set has been tested with both the SElinux and Smack test suites.
> > Below, there is the summary of the test results:
> > 
> > SELinux Test Suite result (without patches):
> > Files=73, Tests=1346, 225 wallclock secs ( 0.43 usr  0.23 sys +  6.11 cusr 58.70 csys = 65.47 CPU)
> > Result: FAIL
> > Failed 4/73 test programs. 13/1346 subtests failed.
> > 
> > SELinux Test Suite result (with patches):
> > Files=73, Tests=1346, 225 wallclock secs ( 0.44 usr  0.22 sys +  6.15 cusr 59.94 csys = 66.75 CPU)
> > Result: FAIL
> > Failed 4/73 test programs. 13/1346 subtests failed.
> 
> Can you provide some more information on which of the
> selinux-testsuite tests failed?  That shouldn't be happening and I'm a
> little concerned that these test failures, even if unrelated to your
> work here, could be masking failures which are related.

Uhm, my virtual machine has been used for many tests and was not clean.
This time, I installed a fresh Fedora 37 and compiled the kernel with
the same configuration as the shipped kernel.

Everything works now:

All tests successful.
Files=74, Tests=1363, 210 wallclock secs ( 0.42 usr  0.11 sys +  6.66
cusr 22.33 csys = 29.52 CPU)
Result: PASS

Roberto

