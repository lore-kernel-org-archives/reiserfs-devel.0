From: Oleg Drokin <green@namesys.com>
Subject: Re: FAQ 29 says to put 0s into /etc/fstab -- What if I don't?
Date: Mon, 24 Mar 2003 12:23:27 +0300
Message-ID: <20030324122327.A7544@namesys.com>
References: <200303240910.KAA02175@chatsubo.sprawl.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13351-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200303240910.KAA02175@chatsubo.sprawl.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Fritze <The.Finn@sprawl.de>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Mar 24, 2003 at 10:10:50AM +0100, Christian Fritze wrote:

> Doing forensics...
> A customer has leased a low budget server for a couple of small projects. 
> Recently the disk in that machine failed and was replaced. The provider's
> technician who did the replacement and the initial setup (up to a running
> sshd where I take over such a machine) installed reiserfs systems on the
> partitions that (on the old disk) had carried ext3. However he did *not*
> tell me about the change *and* he put '1 1' and '1 2' resp. into fstab as
> he usually does whith ext3 filesystems. And yes: I did not check in due
> time, trusting in work done by others... :-(

This is nothing to fear.
reiserfsck will be sturted on each boot, and it will immediately terminate once
it discovers it was called during boot process.

> Last weekend that machine rebooted (for no apparent reason, I'm beginning
> to feel annoyed about that provider...) the first time after the hardware
> replacement. Hours later my customer tells me that something seems to be 
> wrong. I look at the machine and the partition that carries project data
> seems to be completely empty, not a single file or directory, nothing!

Hm, any chance that it was not mounted and you are looking at non-mounted directory?

> After a first moment of horror thinking came back, I checked a few things
> and came across those unexpected reiserfs lines in fstab. Then I read the 
> FAQ and finally daring a 'reiserfsck --rebuild-tree' brought me back to 
> normal life.

Hm. Was there anything strange in logs prior to/immediately after unexpected reboot?

> Is this behaviour to be expected when putting the wrong things into fstab? 

No.

> (In this case the FAQ could probably talk a bit 'louder' about it... ;-)
> Or should I still search for other reasons as well? I had no time yet to

Yes, you should.

> build a nice kernel after the disk failure and maybe running the standard 
> SuSE 2.4.19 as installed from DVD isn't such a good idea in the first place?

They had lots of updates since then, I think. You might want to pick up those.

Bye,
    Oleg
