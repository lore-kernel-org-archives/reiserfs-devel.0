From: Hans Reiser <reiser@namesys.com>
Subject: Re: iozone reality check: was zam, please discuss this
Date: Thu, 24 Jun 2004 00:11:20 -0700
Message-ID: <40DA7E98.1070707@namesys.com>
References: <40D8EB0D.6050109@namesys.com> <20040623063049.GA5080@backtop.namesys.com> <40DA58BC.1060203@namesys.com> <40D9C5F5.7010605@comcast.net> <40DA62E0.2050803@namesys.com> <40D9CDC0.30503@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19318-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40D9CDC0.30503@comcast.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: George Beshers <gbeshers@comcast.net>
Cc: ReiserFS List <reiserfs-list@namesys.com>

George Beshers wrote:

>
>
> Hans Reiser wrote:
>
>>
>> When you say lots, do you mean close to or more than physical ram?
>>
> My recollection is that it was on the order of 70% of physical ram; there
> was significant other activity on the system so it was getting flushed to
> disk some of the time, but I was not actually measuring that.  I was 
> looking
> at cache-coherency across processor nodes and noticed that most of
> the pages in the mmap'd area were touched (modified).
>
>
>
>
>
Ok, this qualifies as an app where it matters.
