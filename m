From: Oleg Drokin <green@namesys.com>
Subject: Re: problem with FS block_size
Date: Wed, 12 Jun 2002 14:22:47 +0400
Message-ID: <20020612142247.A2093@namesys.com>
References: <004a01c211fa$6c92a040$1f79030a@connect.atwork.ent>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10722-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <004a01c211fa$6c92a040$1f79030a@connect.atwork.ent>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Krisztian Gy?rffy <krisztian.gyoerffy@telecare.at>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Jun 12, 2002 at 12:17:58PM +0200, Krisztian Gy?rffy wrote:

> I have a problem with my reiserFS. I have the following configuration running on my machine:
> - SMP 2.4.16-32 SuSE Linux kernel
> - software RAID1 with 2 disks
> - on top of the RAID I have LVM 1.0.1 (the /boot is exclusive, but the rest like /home, /, swap, /tmp, /opt, /usr in in the LVM)
> Everything is working fine with ext2fs and also with resierfs if I define block_size 4k. I downloaded from namesys.com the latest resierfs tools version reiserfsprogs-3.x.1b.tar.gz. But with that I still have the problem, if I define a block_size other that 4k, I eighter cannot mount the partition (filesystem type unknown), or at unmount I get segmentation fault. The first one I get with block_size 1k, the second with block_size 2k.
> Can you tell me what can be wrong there. Do I need some kernel pathes?

variable blocksize support was not merged in kernel yet.
I have a diff for 2.4.18-rc2, though. So if you need it, I can send it to you.
Note it is was not fully tested yet.

Bye,
    Oleg
