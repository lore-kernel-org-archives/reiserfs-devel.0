From: Francois-Rene Rideau <fare@tunes.org>
Subject: mkreiserfs -s 1024 makes unmountable partitions
Date: Sun, 26 Jan 2003 19:18:16 +0100
Sender: Francois-Rene Rideau <fare@Samaris.tunes.org>
Message-ID: <20030126181816.GA1274@Kadath>
References: <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115142.B21932@namesys.com> <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115724.GA946@Kadath> <20030121213336.GA6756@hell.mine.nu> <20030122065712.D5575@humilis> <20030122100342.GA14100@hell.mine.nu> <20030124222823.GA15643@hell.mine.nu>
Reply-To: Francois-Rene Rideau <fare@tunes.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12489-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030124222823.GA15643@hell.mine.nu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi! No hard disk crash today (I'm just disabling the DMA )-" )
However, I've tried to make small reiserfs partitions,
and was annoyed at the journal taking a significant size of the disk:
32MB is 50% of my 64MB /boot partition, and 40% of the whole
of my server's 80MB harddisk.

I saw that mkreiserfs had an option -s to select the size of the journal,
and tried to use it to make a 4MB journal:
	mkreiserfs -s 1024 /dev/hdc1
However, whereas mkreiserfs didn't complain, the resulting partition
was unmountable by linux. In the syslogs, the kernel complains:
read_super_block: can't find a reiserfs filesystem on (dev 16:01, block 128=
, size 512)
read_super_block: can't find a reiserfs filesystem on (dev 16:01, block 16,=
 size 512)

I there a way to make a reiserfs partition with a small journal?
32MB is really a waste, on some partitions.
Would a small kernel patch do it?
In any case, I think that it is a bug that mkreiserfs doesn't check
the consistency of its parameters with what the kernel is able to handle.

PS: I'm using debian's reiserfsprogs 1:3.6.4-2 and linux kernel 2.4.20.

Cheers!

[ Fran=E7ois-Ren=E9 =D0VB Rideau | Reflection&Cybernethics | http://fare.tu=
nes.org ]
[  TUNES project for a Free Reflective Computing System  | http://tunes.org=
  ]
You can only find happiness by striving towards something else.
