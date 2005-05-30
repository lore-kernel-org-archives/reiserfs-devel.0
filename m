From: Hans Reiser <reiser@namesys.com>
Subject: Re: File as a directory - Ordered Relations
Date: Mon, 30 May 2005 01:19:10 -0700
Message-ID: <429ACC7E.4040101@namesys.com>
References: <6708893568-BeMail@cr593174-a>            <4297FA03.6050603@slaphack.com> <200505281942.j4SJgbpi009886@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24213-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200505281942.j4SJgbpi009886@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: David Masover <ninja@slaphack.com>, "Alexander G. M. Smith" <agmsmith@rogers.com>, Leo Comerford <leocomerford@gmail.com>, reiserfs-list@namesys.com

Valdis.Kletnieks@vt.edu wrote:

>On Fri, 27 May 2005 23:56:35 CDT, David Masover said:
>
>  
>
>>Hans, comment please?  Is this approaching v5 / v6 / Future Vision?  It
>>does seem more than a little "clunky" when applied to v4...
>>    
>>
Well, if you read our whitepaper, we consider relational algebra to be a
functional subset of what we will implement (which implies we think
relational algebra should be possible in the filesystem naming.)

>
>I'm not Hans, but I *will* ask "How much of this is *rationally* doable
>without some help from the VFS?".
>
Think of VFS as a standards committee.  That means that 5-15 years after
we implement it, they will copy it, break it, and then demand that we
conform to their breakage. 

Anytimes someone says it should go into VFS, what they really mean is,
nobody should get ahead of them because it will increase their workload.;-)

VFS is a baseline.  Once you support VFS, and your performance is good,
you can start to innovate.  Next year we finally start to seriously
innovate, after 10 years of groundwork.  The storage layer was never the
interesting part of our plans, not to me.....

BeFS is way cool by the way, and I am really interested in what Dominic
and Alexander do in the future.....


>  At the very least, some of this stuff
>will require the FS to tell the VFS to suspend its disbelief (for starters,
>doing this without confusing the VFS's concepts of dentries/inodes/reference
>counts is going to be.... interesting... :)
>  
>

