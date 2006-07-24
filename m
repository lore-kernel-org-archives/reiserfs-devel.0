From: Matthias Andree <matthias.andree@gmx.de>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Mon, 24 Jul 2006 19:35:24 +0200
Message-ID: <44C504DC.6080907@gmx.de>
References: <44C12F0A.1010008@namesys.com> <44C28A8F.1050408@garzik.org>	 <44C32348.8020704@namesys.com> <200607230212.55293.lkml@lpbproductions.com>	 <44C44622.9050504@namesys.com>	 <20060724085455.GD24299@merlin.emma.line.org>	 <44C4813E.2030907@namesys.com>	 <20060724102508.GA26553@merlin.emma.line.org> <1153760245.5735.47.camel@ipso.snappymail.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932173AbWGXRfc@vger.kernel.org>
In-Reply-To: <1153760245.5735.47.camel@ipso.snappymail.ca>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Benoit <ipso@snappymail.ca>
Cc: Hans Reiser <reiser@namesys.com>, lkml@lpbproductions.com, Jeff Garzik <jeff@garzik.org>, Theodore Tso <tytso@mit.edu>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Mike Benoit wrote:

> I've been bitten by running out of inodes on several occasions, and by
> switching to ReiserFS it saved one company I worked for over $250,000
> because they didn't need to buy a totally new piece of software.

ext3fs's inode density is configurable, reiserfs's hash overflow chain
length is not, and it doesn't show in df -i either.

If you need lots of inodes, mkfs for lots. That's old Unix lore.
