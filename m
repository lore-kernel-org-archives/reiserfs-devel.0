From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: Filesystem Tests
Date: Wed, 6 Aug 2003 11:04:27 -0700
Message-ID: <20030806180427.GC21290@matchmail.com>
References: <3F306858.1040202@mrs.umn.edu> <20030805224152.528f2244.akpm@osdl.org> <3F310B6D.6010608@namesys.com> <20030806183410.49edfa89.diegocg@teleline.es>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15188-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030806183410.49edfa89.diegocg@teleline.es>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Diego Calleja Garc?a <diegocg@teleline.es>
Cc: Hans Reiser <reiser@namesys.com>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Wed, Aug 06, 2003 at 06:34:10PM +0200, Diego Calleja Garc?a wrote:
> El Wed, 06 Aug 2003 18:06:37 +0400 Hans Reiser <reiser@namesys.com> escribi?:
> 
> > I don't think ext2 is a serious option for servers of the sort that 
> > Linux specializes in, which is probably why he didn't measure it.
> 
> Why?

Because if you have a power outage, or a crash, you have to run the
filesystem check tools on it or risk damaging it further.

Journaled filesystems have a much smaller chance of having problems after a
crash.
