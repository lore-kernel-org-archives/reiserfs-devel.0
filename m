From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: A question: May Reiser4 be equivalent to Reiser3 with some
	flag/plugin ...
Date: Wed, 18 Jan 2006 11:21:10 -0700
Message-ID: <1137608470.6375.137.camel@tribesman.namesys.com>
References: <e50d039c0601061010k51b103e4qb799090d52e7b744@mail.gmail.com>
	 <13dbb67f0601070441q559b156ep@mail.gmail.com> <43C2A9D8.80103@namesys.com>
	 <200601092001.17684.marcel@hilzinger.hu>  <43CDFC25.90401@futuretg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27779-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43CDFC25.90401@futuretg.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Giovanni A. Orlando" <gorlando@futuretg.com>
Cc: reiserfs-list@namesys.com

Hello

On Wed, 2006-01-18 at 08:28 +0000, Giovanni A. Orlando wrote:
> Hi,
> 
>     Looking the http://linuxgazette.net/122/TWDT.html#piszcz article, I 
> see that
>     in some cases ReiserFS 3.X is better than Reiser4.
> 
>     Correct me if I am wrong. High numbers means poor, more delay.
> 
>     Now, because we plan to support both: Reiser3 and Reiser4 in our OS,
>     we plan to know if there are some system the Reiser3 performance
>     may become available for Reiser4.
> 
>     Reiser4 is superior but seems that with full security enabled logically
>     the system may delay.
> 
>     Basically, my question may be re-posted like: "I know Reiser4 is
>     different than Reiser3, but may the Reiser4 performance may be superior
>     all the time, doing some update?
> 

Unfortunately, currently, reiser4 is not yet superior all the time.
There are some bottlenecks we are trying to fix these days.


