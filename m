From: Francois-Rene Rideau <fare@tunes.org>
Subject: Crash: the problem was DMA!
Date: Fri, 24 Jan 2003 23:28:23 +0100
Sender: Francois-Rene Rideau <fare@Samaris.tunes.org>
Message-ID: <20030124222823.GA15643@hell.mine.nu>
References: <20030118100157.C5575@humilis> <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115142.B21932@namesys.com> <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115724.GA946@Kadath> <20030121213336.GA6756@hell.mine.nu> <20030122065712.D5575@humilis> <20030122100342.GA14100@hell.mine.nu>
Reply-To: Francois-Rene Rideau <fare@tunes.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12485-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030122100342.GA14100@hell.mine.nu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Dear reiserfs developers,

here's an update on the trouble I had lately (the second disk crash):
the culprit was IDE DMA!

Here's the story:
* I installed more RAM, and it failed, so I upgrade the BIOS to see it
 (machine was dead after I upgraded the BIOS, until I was told to also
 short the NVRAM to reset the BIOS parameters, but that's another story).
* After I rebooted, swsusp failed (oops, I had suspended the machine
 instead of halting it), and I originally attributed my troubles to that.
 The machine was thereupon blocked right after mounting its reiserfs rootfs.
* On another machine, I could reiserfsck the disk, mount it and backup
 its contents. Pphew!
* Windows and debian's linux-2.4.18-bf2.4 were working fine on the machine,
 and memtest86 reported no error, so the hardware looks OK.
* However, using any of my custom-compiled Linux kernels would result in
 miserable kernel panics while accessing the big 100G reiserfs partition:
 I ksymoops'ed a few panics, and they all as a NULL-pointer dereference
 while accessing the big reiserfs partition: open() system call or
 disk interrupt handler.
 The panic came quick enough (while in init, in rcS or getty),
 though not at a fully predictable place.
* I could put some support files in my tiny /boot, I can successfully boot
 with root=3D/dev/hda1 init=3D/bin/sash -- even with the kernels that fail
 on the big partition. Then, if I can try to reiserfsck the disk,
 I get a panic or lack thereof depending on my using a custom kernel
 or the debian-supplied one. I suppose the partition was small enough
 that timing problems didn't have the opportunity to occur.
* I started suspecting DMA thanks to a reiserfsck message telling me
 while using debian's kernel that lack of dma was detrimental to performanc=
e.
 Indeed, compiling a custom kernel w/o DMA caused the system to boot,
 while using hdparm to enable dma caused it to hang.
* The reiserfs partition seems to have survived quite well all those
 reboots and crashes that happened while sorting out this mess.
 Congratulations!
* All in all, it looks like my BIOS update hosed the way the IDE chipset
 is configured, as far as having Linux use the DMA is concerned. Darn.

This message is to tell you what I spent quite some time to figure out,
so that if the problem occurs again, you (yes, you who are asked to solve
problems, but also YOU, who have a problem and are Googling in search of
a solution to your problem, and found this message in a mailing-list archiv=
e)
can find the answer readily available.

PS: YES, my old kern.log's from before the BIOS update do show
hda: 240121728 sectors (122942 MB) w/2048KiB Cache, CHS=3D14946/255/63, UDM=
A(66)
While the newer one lack the UDMA(66).
VP_IDE: VIA vt82c686a (rev 1b) IDE UDMA66 controller on pci00:04.1
In case anyone cares, that's an ASUS K7M motherboard.
Darn. I still have this performance bug - but at least, the computer works.
Advice welcome, though it's becoming off-topic (so private message might
be more suited).

[ Fran=E7ois-Ren=E9 =D0VB Rideau | Reflection&Cybernethics | http://fare.tu=
nes.org ]
[  TUNES project for a Free Reflective Computing System  | http://tunes.org=
  ]
Premature optimization is the root of all evil.
		-- D.E. Knuth
