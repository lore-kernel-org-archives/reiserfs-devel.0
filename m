From: Oleg Drokin <green@namesys.com>
Subject: Re: Unable to create reiserfs on an empty file
Date: Wed, 3 Apr 2002 20:16:01 +0400
Message-ID: <20020403201601.A1918@namesys.com>
References: <Pine.LNX.4.44.0203011216270.22313-100000@sparrow.websense.net> <Pine.LNX.4.44.0204030952160.8574-100000@sparrow.websense.net>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0204030952160.8574-100000@sparrow.websense.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: William Stearns <wstearns@pobox.com>
Cc: ML-reiserfs <reiserfs-list@namesys.com>

Hello!

On Wed, Apr 03, 2002 at 09:56:34AM -0500, William Stearns wrote:

> 	I'd be interested in hearing whether the following issue is 1) 
> PEBCAK (Problem Exists Between Chair And Keyboard) on my part ;-), 2) a 
> bug in mkreiserfs, 3) a known issue with or without an available fix, or 
> 4) a non-issue.
> 	My sincerest apologies if I've made a silly mistake at this end.
> 	Cheers,

Hm. I remembered I answered such a question, but my mailbox seems to contradict.

Ok, so this was not a problem, but a design decision instead.
mkreiserfs did only work on device files.

reiserfs 3.x.0j is old though.
And new reiserfsprogs 3.x.1b (latest stable) can create filesystem on files
now. (you need to specify -f switch)

Bye,
    Oleg
