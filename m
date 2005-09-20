From: Hans Reiser <reiser@namesys.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 10:21:53 -0700
Message-ID: <43304531.4080201@namesys.com>
References: <200509180934.50789.chriswhite@gentoo.org> <200509181321.23211.vda@ilport.com.ua> <20050918102658.GB22210@infradead.org> <b14e81f0050918102254146224@mail.gmail.com> <1127079524.8932.21.camel@localhost.localdomain> <432E4786.7010001@namesys.com> <432F8D1E.7060300@yahoo.com.au> <432FABFA.9010406@namesys.com> <1127200590.9436.15.camel@npiggin-nld.site> <432FC150.9020807@namesys.com> <20050920114253.GL10845@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932766AbVITRWE@vger.kernel.org>
In-Reply-To: <20050920114253.GL10845@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@suse.de>
Cc: Nick Piggin <nickpiggin@yahoo.com.au>, Alan Cox <alan@lxorguk.ukuu.org.uk>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, lkml <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Nate Diller <ndiller@namesys.com>

Jens Axboe wrote:

>
>Seeing as you are the one that is apparently bothered by the misnomer,
>it follows that you would be the one submitting a patch for this. Not
>that it would be accepted though, I don't see much point in renaming
>functions and breaking drivers just because of a slightly bad name. The
>io schedulers are all called foo-iosched.c, it's only the simple core
>api that uses the 'elevator' description.
>
>  
>
He asked for an example of messy code, I gave one.  Nate can give
details on other messiness in that code.

Reiser4 has flaws also....

Give all the code time, and it will improve.  The "elevator" code has
gotten a LOT better.
