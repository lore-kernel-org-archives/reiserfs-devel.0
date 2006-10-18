From: "Sander Sweers" <sander.sweers@gmail.com>
Subject: Re: Crash Corse in Partition Recovery
Date: Wed, 18 Oct 2006 15:25:55 +0200
Message-ID: <b65fbb130610180625t392c61f1l4115d1c19a4bbf95@mail.gmail.com>
References: <cc3fd8f30610180606n12707760h747c95d214324ed8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30070-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <cc3fd8f30610180606n12707760h747c95d214324ed8@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Corey McGuire <coreyfro@coreyfro.com>
Cc: reiserfs-list@namesys.com

On 10/18/06, Corey McGuire <coreyfro@coreyfro.com> wrote:
> Hey all,
>
> I was updating my system's bios and my drives got reordered.  When I
> went to nuke my Windows drive, I missed and hit my swap and reiserfs
> drive.  I was wondering if there is a web sight that gives step by
> step instructions for recovery, or if you guys had a silver bullet
> method for findind the begining and ends of a partition.  I don't
> remember the exact size of my swap, but I know it came first.  Nothing
> has happened since I messed up the partition table and I ran "DD" so I
> have an image of the drive for safe exploration.

If only the partitions have been deleted you can recreated them with
fdisk if you know the start and end of the partition. But much easier
is to use testdisk [1]. It helped me out when windows decided my lvm2
partitions needed an update with junk. There is a statically linked
version on [2].

Greets
Sander

[1] http://www.cgsecurity.org/wiki/TestDisk
[2] http://www.cgsecurity.org/testdisk-6.4.linuxstatic.tar.bz2
