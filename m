From: PFC <lists@boutiquenumerique.com>
Subject: Re: 15M files
Date: Sat, 20 Aug 2005 12:23:59 +0200
Message-ID: <op.svsxt9feth1vuj@localhost>
References: <5a59ce53050819144970d07ab0@mail.gmail.com> <43065899.3030301@slaphack.com> <5a59ce530508191544232bf73d@mail.gmail.com> <200508201159.00108.chrivers@iversen-net.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-25588-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200508201159.00108.chrivers@iversen-net.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Christian Iversen <chrivers@iversen-net.dk>, reiserfs-list@namesys.com


Isn't this the RAM-based Prevalence ?

On Sat, 20 Aug 2005 11:58:59 +0200, Christian Iversen  
<chrivers@iversen-net.dk> wrote:

> On Saturday 20 August 2005 00:44, studdugie wrote:
>> MySQL is too slow for the task, even over localhost. I've benchmarked
>> it. Berkeley DB was 3x faster than MySQL for my usecase. The app is
>> written in Java so I would be forced to use JDBC to talk to MySQL. The
>> wrapping/unwrapping overhead is a killer.
>
> I've seen a java library that solves this exact problem - I can't  
> remember
> what it was called, but it's page talked about massive speedups because  
> it
> could somehow avoid the insane wrap-unwrap for each little object. Maybe  
> it
> could help.
>


