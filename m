From: Chris Mason <mason@suse.com>
Subject: Re: Which journal relocation+datalogging patches?
Date: 14 Nov 2002 10:10:14 -0500
Message-ID: <1037286615.21957.233.camel@tiny>
References: <20021114033046.9A82D496DAB@server5.fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11991-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021114033046.9A82D496DAB@server5.fastmail.fm>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: JP Howard <jh_lists@fastmail.fm>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On Wed, 2002-11-13 at 22:30, JP Howard wrote:
> I'm trying to build a 2.4.20pre1 kernel with data logging patches,
> journal relocation, and and important performance/reliability patches.
> 
> I see from
> ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.20/README
> that these patches are against the journal relocation patches. But where
> are they? I've found a patch against 2.5.3, but that doesn't apply
> cleanly to 2.4.20pre1.
> 
> If this patch doesn't yet exist against 2.4.20, could you please upload
> it someplace Chris, and let me know what order to apply the patches?
> (Since you obviously have made it, to create the data logging patch
> against it! :-)

Sorry for the confusion.  The journal relocation parts are in
01-relocation-5.diff.gz, the README was attempting to make it clear
namesys authored it.  Hopefully it is a little clearer now.

> 
> I looks to me like all other important patches are already in
> 2.4.20pre1--is that right?
> 
> What are the steps then required to move the journal to an external
> device (we're using Umem NVRAM, FWIW)? How stable are the journal
> relocation patches? If they're not recommended for production as yet,
> would we be able to move the journal to an external device later, without
> rebooting (or at least without recreating the filesystem)?

You can use reiserfstune to change the log device of an existing disk. 
The relocation and data logging patches are considered stable, both are
included in the suse kernels.

To try the external logging device mkreisefs -j /dev/xxx -s 8192
/dev/yyy

That will create a 32MB log on /dev/xxx, and the main filesystem on
/dev/yyy

> 
> I'm really looking forward to trying this out--I plan to set aside an
> identical server for testing and benchmarking, so hopefully we'll be able
> to provide some interesting benchmarks of IMAP server performance with
> external journals.

Excellent, I'd love to see those numbers.

-chris


