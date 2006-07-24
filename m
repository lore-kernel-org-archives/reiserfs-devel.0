From: Christian Iversen <chrivers@iversen-net.dk>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Mon, 24 Jul 2006 13:34:11 +0200
Message-ID: <200607241334.12218.chrivers@iversen-net.dk>
References: <44C12F0A.1010008@namesys.com> <44C4813E.2030907@namesys.com> <20060724102508.GA26553@merlin.emma.line.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29173-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060724102508.GA26553@merlin.emma.line.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, lkml@lpbproductions.com, Jeff Garzik <jeff@garzik.org>, Theodore Tso <tytso@mit.edu>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Monday 24 July 2006 12:25, Matthias Andree wrote:
> On Mon, 24 Jul 2006, Hans Reiser wrote:
> > >and that's the end
> > >of the story for me. There's nothing wrong about focusing on newer code,
> > >but the old code needs to be cared for, too, to fix remaining issues
> > >such as the "can only have N files with the same hash value".
> >
> > Requires a disk format change, in a filesystem without plugins, to fix
> > it.
>
> You see, I don't care a iota about "plugins" or other implementation
> details.
>
> The bottom line is reiserfs 3.6 imposes practial limits that ext3fs
> doesn't impose and that's reason enough for an administrator not to
> install reiserfs 3.6. Sorry.

And what do you do if you, say, run of of inodes on ext3? Do you think the 
users will care about that? Or what if the number of files in your mail queue 
or proxy cache* become large enough for your fs operations to slow to a 
crawl?


* Yes I know most programs work around this by using many subdirs, but that's 
really a bandaid solution.

-- 
Regards,
Christian Iversen
