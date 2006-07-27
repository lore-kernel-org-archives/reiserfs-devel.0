From: Jeff Garzik <jeff@garzik.org>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Thu, 27 Jul 2006 13:56:17 -0400
Message-ID: <44C8FE41.5040909@garzik.org>
References: <44C12F0A.1010008@namesys.com> <44C28A8F.1050408@garzik.org> <44C32348.8020704@namesys.com> <200607230212.55293.lkml@lpbproductions.com> <44C44622.9050504@namesys.com> <20060724085455.GD24299@merlin.emma.line.org> <44C4813E.2030907@namesys.com> <20060726131709.GB5270@ucw.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29225-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060726131709.GB5270@ucw.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pavel Machek <pavel@ucw.cz>
Cc: Hans Reiser <reiser@namesys.com>, Matthias Andree <matthias.andree@gmx.de>, lkml@lpbproductions.com, Theodore Tso <tytso@mit.edu>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Pavel Machek wrote:
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

Actually, there is reiser4 brokenness lurking in Hans' statement, too:

A filesystem WITH plugins must still handle the standard Linux 
compatibility stuff that other filesystems handle.

Plugins --do not-- mean that you can just change the filesystem format 
willy-nilly, with zero impact.

	Jeff



