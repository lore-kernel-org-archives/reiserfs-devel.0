From: Chris Mason <mason@suse.com>
Subject: Re: Symbol collisions in patch?
Date: 03 Apr 2002 11:35:01 -0500
Message-ID: <1017851701.26533.143.camel@tiny>
References: <Pine.LNX.4.44.0204022130330.32751-100000@conn6m.toms.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <Pine.LNX.4.44.0204022130330.32751-100000@conn6m.toms.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Oehser <tom@toms.net>
Cc: reiserfs-list@namesys.com

On Tue, 2002-04-02 at 21:41, Tom Oehser wrote:

> So, at the moment, I'm just going to put ext3 support in there, and put
> fixing the patch and all the symbols and backporting 3.6 support on my
> personal low-priority back burner...

It would also be hugely useful to have reiserfsck included on  your
disk.  reiserfsck can't do extensive tree rebuilds with the FS mounted
(even readonly), so being able to boot off floppy and rebuild things
would be cool.

-chris


