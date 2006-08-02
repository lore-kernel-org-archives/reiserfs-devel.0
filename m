From: Krzysztof Halasa <khc@pm.waw.pl>
Subject: Re: Solaris ZFS on Linux
Date: Wed, 02 Aug 2006 16:28:20 +0200
Message-ID: <m3ejvzqkjf.fsf@defiant.localdomain>
References: <20060731175958.1626513b.reiser4@blinkenlights.ch>
	<200607311918.k6VJIqTN011066@laptop13.inf.utfsm.cl>
	<20060731225734.ecf5eb4d.reiser4@blinkenlights.ch>
	<44CE7C31.5090402@gmx.de>
	<5c49b0ed0607311621i54f1c46fh9137f8955c9ea4be@mail.gmail.com>
	<Pine.LNX.4.63.0607311621360.14674@qynat.qvtvafvgr.pbz>
	<5c49b0ed0607311650j4b86d0c3h853578f58db16140@mail.gmail.com>
	<Pine.LNX.4.63.0607311651410.14674@qynat.qvtvafvgr.pbz>
	<5c49b0ed0607311705t1eb8fc6bs9a68a43059bfa91a@mail.gmail.com>
	<20060801010215.GA24946@merlin.emma.line.org>
	<44CEAEF4.9070100@slaphack.com>
	<Pine.LNX.4.63.0607312114500.15179@qynat.qvtvafvgr.pbz>
	<44CED95C.10709@slaphack.com> <44CFE8D9.9090606@mauve.plus.com>
	<0DA0B214-50BC-4E20-A520-B7AB121BB38B@mac.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29434-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <0DA0B214-50BC-4E20-A520-B7AB121BB38B@mac.com> (Kyle Moffett's message of "Tue, 1 Aug 2006 22:29:20 -0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kyle Moffett <mrmacman_g4@mac.com>
Cc: Ian Stirling <ian.stirling@mauve.plus.com>, David Masover <ninja@slaphack.com>, David Lang <dlang@digitalinsight.com>, Nate Diller <nate.diller@gmail.com>, Adrian Ulrich <reiser4@blinkenlights.ch>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, ipso@snappymail.ca, lkml@lpbproductions.com, Jeff Garzik <jeff@garzik.org>, Theodore Ts'o <tytso@mit.edu>, LKML Kernel <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com

Kyle Moffett <mrmacman_g4@mac.com> writes:

> IMHO the best alternative for a situation like that is a storage
> controller with a battery-backed cache and a hunk of flash NVRAM for
> when the power shuts off (just in case you run out of battery), as
> well as a separate 1GB battery-backed PCI ramdisk for an external
> journal device (likewise equipped with flash NVRAM).  It doesn't take
> much power at all to write a gig of stuff to a small flash chip
> (Think about your digital camera which runs off a couple AA's), so
> with a fair-sized on-board battery pack you could easily transfer its
> data to NVRAM and still have power left to back up data in RAM for 12
> hours or so.  That way bootup is fast (no reading 1GB of data from
> NVRAM) but there's no risk of data loss.

Not sure - reading flash is fast, but writing is quite slow.
A digital camera can consume a set of 2 or 4 2500 mAh AA cells
for a fraction of 1 GB (of course, only a part of power goes
to flash).
-- 
Krzysztof Halasa
