From: Russell Coker <russell@coker.com.au>
Subject: Re: Installing Fedora Core with root on Reiserfs
Date: Tue, 19 Jul 2005 17:17:43 +1000
Message-ID: <200507191717.49280.russell@coker.com.au>
References: <42DAB928.9000303@namesys.com> <42DB5DB3.3020809@namesys.com>
	<42DBD1F5.5030105@suse.com>
Reply-To: russell@coker.com.au,
	For testers of Fedora Core development releases <fedora-test-list@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <fedora-test-list-bounces@redhat.com>
In-Reply-To: <42DBD1F5.5030105@suse.com>
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
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-list@namesys.com, fedora-test-list@redhat.com, reiser@namesys.com, Edward Shishkin <edward@namesys.com>

On Tuesday 19 July 2005 01:59, Jeff Mahoney <jeffm@suse.com> wrote:
> >> If the root file system is reiserfs then reiserfs.ko will (or at least
> >> should) be included in the initrd.
> >
> > Right, but initrd is in /boot which is not something separate: it is on
> > the same reiserfs root partition..
>
> The situation you're describing is one that is well tested by now.
>
> If the root filesystem is reiserfs, and /boot is a part of it,
> reiserfs.ko MUST be in the initrd. Otherwise, there is a chicken/egg
> problem and the system will not boot.

This works in all my tests.  The reiserfs.ko module is apparently in the 
initrd.

Also if the original bug concerned a lack of reiserfs.ko in the initrd then 
re-running GRUB would not fix things.

I can't reproduce the bug, it just works for me.

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
