From: Russell Coker <russell@coker.com.au>
Subject: Re: mount reiserfs (novice)
Date: Thu, 17 Jun 2004 21:36:45 +1000
Sender: fedora-selinux-list-bounces@redhat.com
Message-ID: <200406172136.45131.russell@coker.com.au>
References: <20040617120957.2dea34f4@maxim-l.office.modum.by>
	<200406172129.00895.russell@coker.com.au>
Reply-To: russell@coker.com.au,
	"Fedora SELinux support list for users & developers." <fedora-selinux-list@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <fedora-selinux-list-bounces@redhat.com>
In-Reply-To: <200406172129.00895.russell@coker.com.au>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <http://www.redhat.com/mailman/listinfo/fedora-selinux-list>, 
	<mailto:fedora-selinux-list-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/fedora-selinux-list>
List-Post: <mailto:fedora-selinux-list@redhat.com>
List-Help: <mailto:fedora-selinux-list-request@redhat.com?subject=help>
List-Subscribe: <http://www.redhat.com/mailman/listinfo/fedora-selinux-list>, 
	<mailto:fedora-selinux-list-request@redhat.com?subject=subscribe>
Errors-To: fedora-selinux-list-bounces@redhat.com
Content-Type: text/plain; charset="us-ascii"
To: fedora-selinux-list@redhat.com
Cc: ReiserFS <reiserfs-list@namesys.com>, James Morris <jmorris@redhat.com>, Stephen Smalley <sds@epoch.ncsc.mil>

On Thu, 17 Jun 2004 21:29, Russell Coker <russell@coker.com.au> wrote:
> I've just reproduced this bug on the kernel.org 2.6.7 kernel.  It seems
> that there is a hidden directory on a ReiserFS file system used for XATTRs
> which is unlabeled.  Allowing mount to search this directory does no good
> as many (most?) operations also need it (eg setfiles).

We should probably change the policy now to include the following line, and 
also do sed -e "s/xfs/xfs|reiserfs/" on the Makefile.

fs_use_xattr reiserfs system_u:object_r:fs_t;

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page
