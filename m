From: David Masover <ninja@slaphack.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Sun, 18 Sep 2005 15:29:30 -0500
Message-ID: <432DCE2A.5070705@slaphack.com>
References: <200509182004.j8IK4JNx012764@inti.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26042-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509182004.j8IK4JNx012764@inti.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, Hans Reiser <reiser@namesys.com>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Horst von Brand wrote:
> There are lots of reports of ReiserFS 3
> filesystems completely destroyed by minor hardware flakiness.

Honestly, this is one of the things I like about Linux.  If I have 
memory errors, Windows will just keep running, occasionally something 
will crash, you restart it, never suspecting just how corrupt things are 
getting under the hood.  On Linux, I generally get kernel panics pretty 
quickly, so I run memtest86 and replace the RAM.

If my hardware is flaky, I consider it my job to replace it, not the job 
of all my software to magically compensate for it.  If I lose data, oh 
well, I have backups.  If I didn't, I was asking for trouble anyway.
