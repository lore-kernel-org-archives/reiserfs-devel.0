From: Spam <spam@tnonline.net>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 2 Sep 2004 22:10:07 +0200
Message-ID: <534382013.20040902221007@tnonline.net>
References: <rlrevell@joe-job.com> <1094079071.1343.25.camel@krustophenia.net>
 <200409021425.i82EPn9i005192@laptop11.inf.utfsm.cl>
 <1535878866.20040902214144@tnonline.net>
 <20040902194909.GA8653@atrey.karlin.mff.cuni.cz>
 <1094155277.11364.92.camel@krustophenia.net>
 <20040902200403.GA6875@taniwha.stupidest.org>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21319-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040902200403.GA6875@taniwha.stupidest.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Wedgwood <cw@f00f.org>
Cc: Lee Revell <rlrevell@joe-job.com>, Pavel Machek <pavel@ucw.cz>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jamie Lokier <jamie@shareable.org>, David Masover <ninja@slaphack.com>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>


> On Thu, Sep 02, 2004 at 04:01:17PM -0400, Lee Revell wrote:

>> Better to have the contents accessible via a separate stream, in the
>> same namespace.  Fix it once in the kernel vs. fix it in umpteen
>> apps.

> This is ridiculous.  We have shared libraries, 99% of applications
> manage to use libc for example --- this isn't that different.

  Yes if that was the case then programs wouldn't brake if libc and
  its API was fixed. Sadly, I think it isn't.

  ~S


>   --cw

