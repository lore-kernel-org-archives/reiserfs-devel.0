From: Francois-Rene Rideau <fare@tunes.org>
Subject: Oh no! Not again!
Date: Tue, 28 Jan 2003 03:41:58 +0100
Sender: Francois-Rene Rideau <fare@Samaris.tunes.org>
Message-ID: <20030128024158.GA19336@hell.mine.nu>
References: <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115142.B21932@namesys.com> <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115724.GA946@Kadath> <20030121213336.GA6756@hell.mine.nu> <20030122065712.D5575@humilis> <20030122100342.GA14100@hell.mine.nu> <20030124222823.GA15643@hell.mine.nu>
Reply-To: Francois-Rene Rideau <fare@tunes.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12523-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030124222823.GA15643@hell.mine.nu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Dear all,

to determine whether my DMA problem was due to the disk or the motherboard,
I moved the disk to another machine, where I could successfully
hdparm -Tt /dev/hdc without crashing linux while in udma2.
However, when I put the disk back into its rightful place,
linux died horribly with lots of error messages from reiserfs.
I booted on /boot where I had kept a minimal runtime, and used reiserfsck.
Reiserfsck reported an inconsistency that required using --rebuild-tree.
And after approximately two hours, reiserfsck --rebuild-tree entered
an endless loop, printing
do_pass_2: The block (27179935) is in the tree already. Should not happen.

Is there anything I can do about that, to put it in working order,
or should I reformat and restore what I can from backup?

I've got a distinct feeling this disk will soon go back to MAXTOR,
just like its twin brother.

[ Fran=E7ois-Ren=E9 =D0VB Rideau | Reflection&Cybernethics | http://fare.tu=
nes.org ]
[  TUNES project for a Free Reflective Computing System  | http://tunes.org=
  ]
http://Bastiat.org/ - debunking economic sophisms since 1845.
