From: Matthias Andree <matthias.andree@gmx.de>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Mon, 24 Jul 2006 12:25:08 +0200
Message-ID: <20060724102508.GA26553@merlin.emma.line.org>
References: <44C12F0A.1010008@namesys.com> <44C28A8F.1050408@garzik.org> <44C32348.8020704@namesys.com> <200607230212.55293.lkml@lpbproductions.com> <44C44622.9050504@namesys.com> <20060724085455.GD24299@merlin.emma.line.org> <44C4813E.2030907@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29169-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <44C4813E.2030907@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Matthias Andree <matthias.andree@gmx.de>, lkml@lpbproductions.com, Jeff Garzik <jeff@garzik.org>, Theodore Tso <tytso@mit.edu>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Mon, 24 Jul 2006, Hans Reiser wrote:

> >and that's the end
> >of the story for me. There's nothing wrong about focusing on newer code,
> >but the old code needs to be cared for, too, to fix remaining issues
> >such as the "can only have N files with the same hash value". 
>
> Requires a disk format change, in a filesystem without plugins, to fix it.

You see, I don't care a iota about "plugins" or other implementation details.

The bottom line is reiserfs 3.6 imposes practial limits that ext3fs
doesn't impose and that's reason enough for an administrator not to
install reiserfs 3.6. Sorry.

-- 
Matthias Andree
