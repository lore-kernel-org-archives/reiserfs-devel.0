From: Russell Coker <russell@coker.com.au>
Subject: Re: mount reiserfs (novice)
Date: Thu, 17 Jun 2004 21:29:00 +1000
Sender: fedora-selinux-list-bounces@redhat.com
Message-ID: <200406172129.00895.russell@coker.com.au>
References: <20040617120957.2dea34f4@maxim-l.office.modum.by>
Reply-To: russell@coker.com.au,
	"Fedora SELinux support list for users & developers." <fedora-selinux-list@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <fedora-selinux-list-bounces@redhat.com>
In-Reply-To: <20040617120957.2dea34f4@maxim-l.office.modum.by>
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

On Thu, 17 Jun 2004 19:09, Maxim Britov <udjinrg@forenet.by> wrote:
> I can't mount reiserfs. I just begin study SE Linux. Could you help me?
>
> # dmesg
> ReiserFS: hdc2: found reiserfs format "3.6" with standard journal
> ReiserFS: hdc2: using ordered data mode
> ReiserFS: hdc2: journal params: device hdc2, size 8192, journal first block
> 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
> ReiserFS: hdc2: checking transaction log (hdc2)
> ReiserFS: hdc2: Using r5 hash to sort names
> audit(1087473997.967:0): avc:  denied  { search } for  pid=2885
> exe=/bin/mount dev=hdc2 ino=2 scontext=root:sysadm_r:mount_t
> tcontext=system_u:object_r:unlabeled_t tclass=dir ReiserFS: hdc2: warning:
> xattrs/ACLs enabled and couldn't find/create .reiserfs_priv. Failing mount.

I've just reproduced this bug on the kernel.org 2.6.7 kernel.  It seems that 
there is a hidden directory on a ReiserFS file system used for XATTRs which 
is unlabeled.  Allowing mount to search this directory does no good as many 
(most?) operations also need it (eg setfiles).

I've CC'd the ReiserFS mailing list.  I would be happy to work with ReiserFS 
developers in debugging this and testing the fix.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page
