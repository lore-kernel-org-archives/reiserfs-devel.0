From: "JP Howard" <jh_lists@fastmail.fm>
Subject: Re: Which journal relocation+datalogging patches?
Date: Fri, 15 Nov 2002 07:43:03 +1100
Message-ID: <20021114204303.CACBF5C3B9D@server5.fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11999-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On 14 Nov 2002 10:10:14 -0500, "Chris Mason" <mason@suse.com> said:
> Sorry for the confusion.  The journal relocation parts are in
> 01-relocation-5.diff.gz, the README was attempting to make it clear
> namesys authored it.  Hopefully it is a little clearer now.
> 
Perfectly clear, thankyou.

> You can use reiserfstune to change the log device of an existing disk. 
> The relocation and data logging patches are considered stable, both are
> included in the suse kernels.
> 
> To try the external logging device mkreisefs -j /dev/xxx -s 8192
> /dev/yyy
> 
> That will create a 32MB log on /dev/xxx, and the main filesystem on
> /dev/yyy
> 
Thanks for this info. I'll try this on the weekend.
> > 
> > I'm really looking forward to trying this out--I plan to set aside an
> > identical server for testing and benchmarking, so hopefully we'll be able
> > to provide some interesting benchmarks of IMAP server performance with
> > external journals.
> 
> Excellent, I'd love to see those numbers.
> 
OK, I'll be sure to report back when we have something. That may yet take
some months--our IMAP stress test tool is not yet correctly simulating
our production profile, and is resulting in CPU bound rather than IO
bound tests. So we'll have to get that working properly first, and then
we'll be able to benchmark.
