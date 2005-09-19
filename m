From: Christoph Hellwig <hch@infradead.org>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Mon, 19 Sep 2005 10:24:44 +0100
Message-ID: <20050919092444.GA17501@infradead.org>
References: <432AFB44.9060707@namesys.com> <20050918110658.GA22744@infradead.org> <432E8282.6060905@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26069-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <432E8282.6060905@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: Christoph Hellwig <hch@infradead.org>, ReiserFS List <reiserfs-list@namesys.com>, LKML <linux-kernel@vger.kernel.org>

On Mon, Sep 19, 2005 at 01:18:58PM +0400, Vladimir V. Saveliev wrote:
> Hello
> 
> Christoph Hellwig wrote:
> > I threw in your new codedrop into a compilation and the byte-order
> > mess is _still_ now sorted out.  
> 
> Did compiling notice this mess?
> We used to compile with C=1. Should we compile somehow else before sending code out?

Log is at:

	http://verein.lst.de/~hch/reiser4.log

C=1 with whatever sparse version I had, nevermind what version it is code
is not good, just use __le types instead of structs and casting exercises,
makes the code simpler and easier to verify.

