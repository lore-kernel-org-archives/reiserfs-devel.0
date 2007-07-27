From: Edward Shishkin <edward@namesys.com>
Subject: Re: Question about memory pressure freezes
Date: Fri, 27 Jul 2007 18:54:15 +0400
Message-ID: <46AA0717.90306@namesys.com>
References: <1185488757.33588.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1185488757.33588.6.camel@localhost>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Zan Lynx <zlynx@acm.org>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Zan Lynx wrote:

>I have often experienced nearly full system freezes for up to five
>seconds at a time while memory is being flushed to disk.
>
>I'm not sure if this is a general Linux problem or a Reiser4 problem, so
>I thought I'd ask.
>
>  
>

I wouldn't separate the only one of them to blame ;)

>A sysrq-T during the freeze shows many processes trying to acquire a
>memory page, and Reiser4 flushing atoms and doing sync things.
>  
>

yup, and all processes (including interactive ones) wait for 
reiser4_writepage
completion.. This takes place for mapped writes, which can not balance dirty
pages like usual writes..

>My working theory right now is that Reiser4 spends time flushing a lot
>of data at once before returning.
>  
>

right,
there was a lightweight reaction on memory pressure notification (emergency
flush) a long time ago, but Hans couldn't live with such "swapping" 
mechanism.
Also the emergency flush itself had some problems.

>If I am right about that, would it not make more sense to flush a few
>pages, return to the kernel, flush a few more pages, return to the
>kernel, etc, etc?  That way programs could get a bit of RAM and make
>some progress.
>  
>

I have spent 1-2 days of moving in this direction: no progress.
I wouldn't say that this is ultimately wrong way: just requires
more time to investigate..

>Of course I could be completely off about what's going on.
>  
>
