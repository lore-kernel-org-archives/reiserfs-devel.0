From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] new data logging and quota patches available
Date: 24 Feb 2003 13:46:16 -0500
Message-ID: <1046112375.16042.538.camel@tiny.suse.com>
References: <1045870331.16048.325.camel@tiny.suse.com>
	 <3E59787F.2030009@mb.tu-ilmenau.de> <200302241859.16343.m.c.p@gmx.net>
	 <200302241905.56193.m.c.p@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12897-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302241905.56193.m.c.p@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marc-Christian Petersen <m.c.p@gmx.net>
Cc: reiserfs-list <reiserfs-list@namesys.com>, Manuel Krause <manuel.krause@mb.tu-ilmenau.de>

On Mon, 2003-02-24 at 13:05, Marc-Christian Petersen wrote:

> I just tried it with:
> 
> - time seq -f "%06.0f" 1 100000  | xargs touch
> 
> v35-aa took about 4 seconds to complete this.
> v36-aa took about 6 seconds to compelte this.
> 
> Mounted with:
> nosuid,nodev,noexec,noatime,nodiratime,notail,block-allocator=noborder

For benchmarks that short, bdflush/kupdate can come in and screw the
results.  Also, when I create 100,000 files on my test box with these
mount parameters, it results in 3 large async transactions.

In data-logging-36, kreiserfsd will get those async commits to disk
sooner than in data-logging-35, which is the right thing to do because
it helps make sure later writes won't stall while we have to flush that
async transaction.

But for a very short benchmark that doesn't do more work later on, it
can seem slower.  If you want a more accurate picture, include the time
it takes to sync after creating all the files.

-chris







