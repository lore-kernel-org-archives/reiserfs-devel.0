From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: Filesystem Tests
Date: Wed, 6 Aug 2003 12:08:50 -0700
Message-ID: <20030806190850.GF21290@matchmail.com>
References: <3F306858.1040202@mrs.umn.edu> <20030805224152.528f2244.akpm@osdl.org> <3F310B6D.6010608@namesys.com> <20030806183410.49edfa89.diegocg@teleline.es> <20030806180427.GC21290@matchmail.com> <20030806204514.00c783d8.diegocg@teleline.es>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15198-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030806204514.00c783d8.diegocg@teleline.es>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Diego Calleja Garc?a <diegocg@teleline.es>
Cc: reiser@namesys.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Wed, Aug 06, 2003 at 08:45:14PM +0200, Diego Calleja Garc?a wrote:
> El Wed, 6 Aug 2003 11:04:27 -0700 Mike Fedyk <mfedyk@matchmail.com> escribi?:
> 
> > 
> > Journaled filesystems have a much smaller chance of having problems after a
> > crash.
> 
> I've had (several) filesystem corruption in a desktop system with (several)
> journaled filesystems on several disks. (They seem pretty stable these days,
> though)
> 
> However I've not had any fs corrution in ext2; ext2 it's (from my experience)
> rock stable.
> 
> Personally I'd consider twice the really "serious" option for a serious server.

I've had corruption caused by hardware, and nothing else.  I haven't run
into any serious bugs.

But with servers, the larger your filesystem, the longer it will take to
fsck.  And that is bad for uptime.  Period.

I would be running ext2 also if I wasn't running so many test kernels (and
they do oops on you), and I've been glad that I didn't have to fsck every
time I oopsed (though I do every once in a while, just to make sure).
