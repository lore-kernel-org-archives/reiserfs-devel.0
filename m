From: George Beshers <gbeshers@comcast.net>
Subject: Re: iozone reality check: was zam, please discuss this
Date: Wed, 23 Jun 2004 14:36:48 -0400
Message-ID: <40D9CDC0.30503@comcast.net>
References: <40D8EB0D.6050109@namesys.com> <20040623063049.GA5080@backtop.namesys.com> <40DA58BC.1060203@namesys.com> <40D9C5F5.7010605@comcast.net> <40DA62E0.2050803@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19312-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40DA62E0.2050803@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>



Hans Reiser wrote:

>
> When you say lots, do you mean close to or more than physical ram?
>
My recollection is that it was on the order of 70% of physical ram; there
was significant other activity on the system so it was getting flushed to
disk some of the time, but I was not actually measuring that.  I was looking
at cache-coherency across processor nodes and noticed that most of
the pages in the mmap'd area were touched (modified).



