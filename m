From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Mon, 19 Sep 2005 11:43:36 +0100
Message-ID: <1127126616.22124.7.camel@localhost.localdomain>
References: <432AFB44.9060707@namesys.com>
	 <200509171415.50454.vda@ilport.com.ua>
	 <200509180934.50789.chriswhite@gentoo.org>
	 <200509181321.23211.vda@ilport.com.ua>
	 <20050918102658.GB22210@infradead.org>
	 <b14e81f0050918102254146224@mail.gmail.com>
	 <1127079524.8932.21.camel@localhost.localdomain>
	 <432E4786.7010001@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26071-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <432E4786.7010001@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Sul, 2005-09-18 at 22:07 -0700, Hans Reiser wrote:
> >the ability to fix some of those bugs fast, but we also all remember
> >what happened with reiser3 later on despite early fast fixing.
> >  
> >
> What was that?

Jeff Mahoney added file attributes to reiserfs3, you whined and pointed
people at the yet to be released reiserfs4. Someone fixed the 4K stack
on reiserfs3, you whined. Chris Mason added other fixes like
data=journal support to get some kind of journal feature parity with
ext3, you complained and ask it not to be added.

> That is why I just say "make it easy to read and I don't care how you do
> that so long as it works."

Perhaps you do. The kernel follows a coding style. It isn't my coding
style but like everyone else except you I try and follow it.

Alan

