From: Oleg Drokin <green@namesys.com>
Subject: Re: corrupted fs: bitmap does not match to the correct one....
Date: Thu, 16 May 2002 09:13:32 +0400
Message-ID: <20020516091332.B6596@namesys.com>
References: <20020515180609.A2073@namesys.com> <10725.1021478209@www24.gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10318-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <10725.1021478209@www24.gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: grobe@gmx.net
Cc: reiserfs-list@namesys.com

Hello!

On Wed, May 15, 2002 at 05:56:49PM +0200, grobe@gmx.net wrote:
> > Ah, failing hardware.
> That's funny. As I mentioned, we use a Serveraid 4m Raid Controller. So, if
> a disk fails, the controller switches it off, sends me a warning messages and
> downgrades from RAID5 to RAID0. But the controller tells me that there are

Hm. I am not sure it is possible to downgrade from raid5 to raid0.
Also if you loose more than one disk, operations are impossible anymore.

> no errors. It seams to be something in the driver-kernel-lvm-chain.

May be so. At least errors are appearing on block layer already.

> > Also you probably want to ask whoever sold you the failing harddrive to
> > replace it.
> As I wrote, the "harddrive" is a logical volume on a raid 5 array, attached
> to a serveraid 4 m - so I would have to bring an entire server if I want to
> replace the failing hardware ;-)

Hm. If I were you, I'd probably go this route, anyway. :)
The other possibility is to dig deep into LVM and serverraid sources and
to see why does it produces I/O errors if hardware does not report any errors.

> The new reiserfsck --rebuild-tree gives me
> pass 0: reading block (xxxx) failed

So, it still cannot read blocks.
What are those xxxx, btw? Do they look correct? (in range of actual volume
size?)

> Is this REALLY only possible with bad hardware, or also with lvm-problems,
> raid-driver problems etc...?

This ispossible with bad hardware or bad drivers, but I cannot tell you which
case is yours because I do not know.

Bye,
    Oleg
