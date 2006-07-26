From: Pavel Machek <pavel@ucw.cz>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Wed, 26 Jul 2006 13:17:09 +0000
Message-ID: <20060726131709.GB5270@ucw.cz>
References: <44C12F0A.1010008@namesys.com> <44C28A8F.1050408@garzik.org> <44C32348.8020704@namesys.com> <200607230212.55293.lkml@lpbproductions.com> <44C44622.9050504@namesys.com> <20060724085455.GD24299@merlin.emma.line.org> <44C4813E.2030907@namesys.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932495AbWG0PXA@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <44C4813E.2030907@namesys.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Matthias Andree <matthias.andree@gmx.de>, lkml@lpbproductions.com, Jeff Garzik <jeff@garzik.org>, Theodore Tso <tytso@mit.edu>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Hi!

> >of the story for me. There's nothing wrong about focusing on newer code,
> >but the old code needs to be cared for, too, to fix remaining issues
> >such as the "can only have N files with the same hash value". 
> >
> Requires a disk format change, in a filesystem without plugins, to fix it.

Well, too bad, if reiser3 is so broken it needs on-disk-format-change,
then I guess doing that change is the right thing to do...
							Pavel
-- 
Thanks for all the (sleeping) penguins.
