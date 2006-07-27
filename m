From: David Masover <ninja@slaphack.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Thu, 27 Jul 2006 14:06:10 -0500
Message-ID: <44C90EA2.4000902@slaphack.com>
References: <44C12F0A.1010008@namesys.com> <44C28A8F.1050408@garzik.org> <44C32348.8020704@namesys.com> <200607230212.55293.lkml@lpbproductions.com> <44C44622.9050504@namesys.com> <20060724085455.GD24299@merlin.emma.line.org> <44C4813E.2030907@namesys.com> <20060726131709.GB5270@ucw.cz> <44C8FE41.5040909@garzik.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29226-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44C8FE41.5040909@garzik.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Garzik <jeff@garzik.org>
Cc: Pavel Machek <pavel@ucw.cz>, Hans Reiser <reiser@namesys.com>, Matthias Andree <matthias.andree@gmx.de>, lkml@lpbproductions.com, Theodore Tso <tytso@mit.edu>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Jeff Garzik wrote:
> Pavel Machek wrote:
>> Hi!
>>
>>>> of the story for me. There's nothing wrong about focusing on newer 
>>>> code,
>>>> but the old code needs to be cared for, too, to fix remaining issues
>>>> such as the "can only have N files with the same hash value".
>>> Requires a disk format change, in a filesystem without plugins, to 
>>> fix it.

> A filesystem WITH plugins must still handle the standard Linux 
> compatibility stuff that other filesystems handle.
> 
> Plugins --do not-- mean that you can just change the filesystem format 
> willy-nilly, with zero impact.

They --do-- mean that you can change much of the filesystem behavior 
without requiring massive on-disk changes or massive interface changes.

After all, this is how many FUSE plugins work -- standard FS interface, 
usually uses another standard FS as storage, but does crazy things like 
compression, encryption, and other transformations in between.
