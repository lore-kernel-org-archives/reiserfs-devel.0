From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: reiser4 data journalling?
Date: Thu, 28 Aug 2003 18:23:22 -0700
Message-ID: <20030829012322.GJ21352@matchmail.com>
References: <3F4E3AF9.2060100@tupshin.com> <16206.16138.72832.920045@laputa.namesys.com> <3F4E6AA4.3030900@namesys.com> <20030829001814.GB9019@zero> <3F4E9C6D.2080009@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15484-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F4E9C6D.2080009@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Tom Vier <tmv@comcast.net>, Reiserfs List <reiserfs-list@namesys.com>

On Fri, Aug 29, 2003 at 04:21:01AM +0400, Hans Reiser wrote:
> Tom Vier wrote:
> >would it be much more difficult to allow non-page aligned bufs to be 
> >written
> >atomically? a fully atomic fs would be very nice. otherwise, a lot of utils
> >and shell builtins would have to be modded to insure page alignment. it
> >would be neat if all the regular builtins (cp, mv, ln) were atomic. of
> >course, even neater would be the ability to group multiple ops into one
> >atomic action. (this is probably already planned - it's been a while since 
> >i
> >read the reiserfs4 paper on the namesys site.)
> >
> > 
> >
> reiser4 does all this that you ask for, although the user space API is 
> not yet compiling;-)
> 

So you can have one 5k memory area that spans two pages, and it will act on
them atomically?  Or does that mean that the utils are already page aligned
by other kernel mechanisims?  Or that they'll have to use the reiser API to
do some of the above (other than the op grouping)?
