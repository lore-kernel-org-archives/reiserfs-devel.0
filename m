From: Ming Zhang <mingz@ele.uri.edu>
Subject: Re: Versioning Plugin
Date: Sat, 12 Nov 2005 21:13:21 -0500
Message-ID: <1131848002.21584.33.camel@localhost.localdomain>
References: <200511111359.39715.jgilmore@glycou.com>
	 <200511111656.04891.pvh@uvic.ca>
	 <1131804415.8550.14.camel@localhost.localdomain>
	 <437662CC.9010307@slaphack.com> <43767289.1000402@namesys.com>
	 <1131843477.21584.3.camel@localhost.localdomain>
	 <b14e81f00511121755r64647fcaj864d1a2b21d73804@mail.gmail.com>
	 <b14e81f00511121756j1ef4ccbpa41e28ce2aed257d@mail.gmail.com>
Reply-To: mingz@ele.uri.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26896-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f00511121756j1ef4ccbpa41e28ce2aed257d@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: michael chang <thenewme91@gmail.com>
Cc: Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Peter van Hardenberg <pvh@uvic.ca>, reiserfs-list@namesys.com

On Sat, 2005-11-12 at 20:56 -0500, michael chang wrote:
> On 11/12/05, michael chang <thenewme91@gmail.com> wrote:
> > That way, if there is version X which is a file, and verison Y is just
> > a line at the top, the compression eliminates the duplication, so
> > instead of
> >
> > (old version + new version)
> > ABCDEF + XABCDEF
> >  on disk
> > it becomes something like
> > Y=ABCDEF
> 
> correction:
> > X + XY
> 
> should be
> Y + XY [sorry for any confusion]

thanks!

> 
> --
> ~Mike
>  - Just my two cents
>  - No man is an island, and no man is unable.

