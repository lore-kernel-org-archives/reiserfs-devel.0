From: Oleg Drokin <green@namesys.com>
Subject: Re: 2.6.0test3mm2 reiserfs3.6.11 usb-storage
Date: Tue, 19 Aug 2003 12:19:00 +0400
Message-ID: <20030819081900.GK10536@namesys.com>
References: <Pine.LNX.4.56.0308181527391.13602@hosting.rdsbv.ro> <20030818135827.GA22255@namesys.com> <Pine.LNX.4.56.0308190912140.29654@hosting.rdsbv.ro>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15375-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.56.0308190912140.29654@hosting.rdsbv.ro>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Catalin BOIE <util@deuroconsult.ro>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Aug 19, 2003 at 09:13:02AM +0300, Catalin BOIE wrote:
> > > Failed to open the journal device ((null)).
> > > I expect reiserfsck to treat this device as any other device.
> > > Mount /dev/sda1 works.
> > What is "debugreiserfs /dev/sda1" output?
> debugreiserfs -d /dev/sda1
> debugreiserfs 3.6.11 (2003 www.namesys.com)
> debugreiserfs: Failed to open the fs journal.
> bash-2.05b# debugreiserfs /dev/sda1
> debugreiserfs 3.6.11 (2003 www.namesys.com)
> debugreiserfs: Failed to open the fs journal.
> I created the fs with command: mkreiserfs -s 513 /dev/sda1

I see. Looks like there is a bug in reiserfsprogs.
We will work on a fix and will let you know after we are done.
2.6.4 appears to work, though, so you might downgrade to this version for now.

Thank you.

Bye,
    Oleg
