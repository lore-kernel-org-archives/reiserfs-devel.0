From: Chris Mason <mason@suse.com>
Subject: Re: 2.4.20 and data logging
Date: 12 Dec 2002 10:47:22 -0500
Message-ID: <1039707458.2058.2.camel@tiny>
References: <200212031238.32403.russell@coker.com.au>
	<1038932472.1508.4.camel@tiny>  <17043452890.20021203231413@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12158-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17043452890.20021203231413@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

On Tue, 2002-12-03 at 17:14, Anders Widman wrote:
> > On Tue, 2002-12-03 at 06:38, Russell Coker wrote:
> >> How is data logging work going?  Is there a patch for 2.4.20?
> 
> > I'm trying to sort out a complete fix for the transaction overflow bug
> > Philippe hit, but other than that the patches are considered stable.
> 
> Are these complete and working yet?

The current status is they are almost ready.  The mmania guys hit a
slightly different overflow bug which we've also fixed, and we are
waiting on some final testing to say for sure.

-chris


