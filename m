From: Grzegorz Kulewski <kangur@polcom.net>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Thu, 27 Jul 2006 17:39:40 +0200 (CEST)
Message-ID: <Pine.LNX.4.63.0607271732010.8976@alpha.polcom.net>
References: <44C12F0A.1010008@namesys.com> <44C28A8F.1050408@garzik.org>
 <44C32348.8020704@namesys.com> <200607230212.55293.lkml@lpbproductions.com>
 <44C44622.9050504@namesys.com> <20060724085455.GD24299@merlin.emma.line.org>
 <44C4813E.2030907@namesys.com> <20060726131709.GB5270@ucw.cz>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932570AbWG0Pjv@vger.kernel.org>
In-Reply-To: <20060726131709.GB5270@ucw.cz>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>
Cc: Hans Reiser <reiser@namesys.com>, Matthias Andree <matthias.andree@gmx.de>, lkml@lpbproductions.com, Jeff Garzik <jeff@garzik.org>, Theodore Tso <tytso@mit.edu>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Wed, 26 Jul 2006, Pavel Machek wrote:

> Hi!
>
>>> of the story for me. There's nothing wrong about focusing on newer code,
>>> but the old code needs to be cared for, too, to fix remaining issues
>>> such as the "can only have N files with the same hash value".
>>>
>> Requires a disk format change, in a filesystem without plugins, to fix it.
>
> Well, too bad, if reiser3 is so broken it needs on-disk-format-change,
> then I guess doing that change is the right thing to do...

Sorry for my stupid question, but could you tell me why starting to make 
incompatible changes to reiserfs3 now (when reiserfs3 "technology" is 
rather old) and making reiserfs3 unstable (again), possibly for several 
months or even years is better than fixing big issues with reiser4 (if 
there are any really big left) merging it and trying to stabilize it?

For end user both ways will result in mkfs so...


Thanks,

Grzegorz Kulewski
