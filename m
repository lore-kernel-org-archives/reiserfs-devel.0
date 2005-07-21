From: Russell Coker <russell@coker.com.au>
Subject: Re: Installing Fedora Core with root on Reiserfs
Date: Thu, 21 Jul 2005 10:35:40 +1000
Message-ID: <200507211035.47290.russell@coker.com.au>
References: <42DAB928.9000303@namesys.com>
	<200507191717.49280.russell@coker.com.au>
	<42DEE6A3.3040406@namesys.com>
Reply-To: russell@coker.com.au,
	For testers of Fedora Core development releases <fedora-test-list@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <fedora-test-list-bounces@redhat.com>
In-Reply-To: <42DEE6A3.3040406@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <http://www.redhat.com/mailman/listinfo/fedora-test-list>,
	<mailto:fedora-test-list-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/fedora-test-list>
List-Post: <mailto:fedora-test-list@redhat.com>
List-Help: <mailto:fedora-test-list-request@redhat.com?subject=help>
List-Subscribe: <http://www.redhat.com/mailman/listinfo/fedora-test-list>,
	<mailto:fedora-test-list-request@redhat.com?subject=subscribe>
Sender: fedora-test-list-bounces@redhat.com
Errors-To: fedora-test-list-bounces@redhat.com
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>
Cc: reiserfs-list@namesys.com, fedora-test-list@redhat.com, Jeff Mahoney <jeffm@suse.com>, reiser@namesys.com

On Thursday 21 July 2005 10:04, Edward Shishkin <edward@namesys.com> wrote:
> My phrase "reiserfs.ko located on reiserfs" sounds bad, and I should
> clarify that the reiserfs.ko is contained in the initrd with other
> binaries/scripts, and this initrd looks fine from the standpoint of
> kernel/reiserfs, but not from the standpoint of grub/reiserfs-emulation.
> The logs obtained from serial console don't include anything about
> loading initrd, and there is the following detail: a dump created by
> debugreiserfs -d shows that the initrd (i_size: 1128235) is represented
> by an indirect item (276 4K-blocks), while grub found that this is not
> sector-aligned:

Might this be related to the size of the ReiserFS file system?

I tested installs with the default partitioning (100M /boot) which worked OK.  
When you had the problem were you using a larger ReiserFS file system?

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

-- 
fedora-test-list mailing list
fedora-test-list@redhat.com
To unsubscribe: 
http://www.redhat.com/mailman/listinfo/fedora-test-list
