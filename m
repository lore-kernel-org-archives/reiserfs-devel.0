From: Hans Reiser <reiser@namesys.com>
Subject: Re: Can compression at filesystem level improve overall performance?
Date: Fri, 19 Mar 2004 21:59:57 +0300
Message-ID: <405B432D.5020305@namesys.com>
References: <405B02ED.4010602@solidcode.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17331-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <405B02ED.4010602@solidcode.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Erik Terpstra <erik@solidcode.net>
Cc: reiserfs-list@namesys.com

Erik Terpstra wrote:

> Hello everyone,
>
> For the last couple of years I noticed that the performance of most of 
> my systems has it's bottleneck in data throughput rather than CPU 
> performance.
>
> Is it fair to say that today compression at the filesystem level would 
> improve overall performance?
>
> If this is the case, it probably wouldn't be too hard to implement as 
> a module in Reiser4?
>
> Any thoughts?
>
> --Erik.
>
>
We are working on it.  Actually, it is hard to code because we need to 
compress at flush to disk time rather than at each write.  Flush related 
plugins are the hardest plugins.

-- 
Hans

