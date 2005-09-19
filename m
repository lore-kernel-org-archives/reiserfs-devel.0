From: Jens Axboe <axboe@suse.de>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Mon, 19 Sep 2005 14:45:18 +0200
Message-ID: <20050919124516.GM10845@suse.de>
References: <432AFB44.9060707@namesys.com> <200509171415.50454.vda@ilport.com.ua> <200509180934.50789.chriswhite@gentoo.org> <200509181321.23211.vda@ilport.com.ua> <20050918102658.GB22210@infradead.org> <b14e81f0050918102254146224@mail.gmail.com> <1127079524.8932.21.camel@localhost.localdomain> <432E4786.7010001@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26077-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <432E4786.7010001@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Sun, Sep 18 2005, Hans Reiser wrote:
> Linux kernel code is getting better, and Andrew Morton's code is
> especially good, but for the most part it's unnecessarily hard to read. 
> Look at the elevator code for instance.  Ugh.

That's pretty bold, coming from someone who cannot even figure out how
to follow the style guidelines of the kernel.

The elevator core api is so trivial, I don't believe you find this hard
to read. The individual io schedulers tend to have comments in functions
that aren't immediately obvious. So I'm curious, what do part makes you
go 'ugh'?

So please explain or refrain from making stupid unwarranted comments
about other peoples code.

> That is why I just say "make it easy to read and I don't care how you do
> that so long as it works."

Then why do you insist on commenting your code differently than everyone
else ('everyone' means the kernel here, since that is your target)?

-- 
Jens Axboe

