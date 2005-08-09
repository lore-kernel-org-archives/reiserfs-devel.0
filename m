From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 performance
Date: Mon, 08 Aug 2005 19:20:44 -0500
Message-ID: <42F7F6DC.2080706@slaphack.com>
References: <dd7cbn$kbg$1@sea.gmane.org> <42F7A01A.7090209@namesys.com> <e692861c05080816136f9d70bc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25366-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e692861c05080816136f9d70bc@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gregory Maxwell <gmaxwell@gmail.com>
Cc: Hans Reiser <reiser@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Gregory Maxwell wrote:
> On 8/8/05, Hans Reiser <reiser@namesys.com> wrote:

> If ever you are looking for a killer app for Reiser4 that people who
> don't care about the visionary stuff will care about:

Define "visionary"?

I can name a few things that work best in Reiser4, and very well in v3, 
simply because of efficient storage of small files and lazy allocation:

webserver -- lots of small files, very few large ones, mostly reads
mailserver -- especially IMAP+maildir, lots of small files, read/write
and so on...

Gentoo box:
	/usr/portage is over a hundred thousand very small files, updated via 
rsync.  Since they are updated all at once, you get a boost out of lazy 
allocation -- you only touch the disks for reads while you're talking to 
the server, because most of the writes probably won't hit the disk for 
awhile.
	/var/tmp/portage is what Portage uses for compilation.  A source 
tarball (usually a tarball, can be anything) is unpacked from 
/usr/portage/distfiles into /var/tmp/portage/<package>/build.  It's 
compiled, then installed into /var/tmp/portage/<package>/install, then 
Portage manually merges the /install directory with the main filesystem, 
in one operation -- presumably so that it could become atomic someday. 
After the merge, /var/tmp/portage is cleaned for the next package.
	With enough RAM, most of the contents (source code and object files) 
from /var/tmp/portage would never touch disk.  This becomes an 
especially huge win if your /var/tmp/portage is a separate partition -- 
instead of writing (unpack tarball), then reading, then writing again 
(for install/merge), you write once.  What was a 5, 6, or 7-step process 
is now a 1-step process.  And, if you don't have enough RAM for this 
RAM-disk-like behavior, it falls back to the old way.

These are all things that Reiser4 already does better than anything 
else.  So now we're going to get Postgres to run faster.  I can't wait 
until we have more people hacking on the plugin interface -- then we'll 
have some *real* killer apps.
