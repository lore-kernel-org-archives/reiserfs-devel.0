From: Oleg Drokin <green@namesys.com>
Subject: Re: big problem with loop-aes and reiserfs partitions
Date: Mon, 23 Dec 2002 10:18:43 +0300
Message-ID: <20021223101843.A21249@namesys.com>
References: <5.2.0.9.2.20021222221057.01cfeb90@pop.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12192-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <5.2.0.9.2.20021222221057.01cfeb90@pop.tvnet.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Newsmail <newsmail@satimex.tvnet.hu>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, Dec 22, 2002 at 10:21:37PM +0100, Newsmail wrote:
> when I was using 2.4.19 I had no problem at all. when Oleg introduced the 
> new block allocation algorithm in 2.4.20-preX I tried it out and I got the 
> same problems that I'm having now with 2.4.20 final. In the 2.4.20-preX 

Too bad you have not reported it back then.

> the same results. so the problem is: when I'm copying huge amount of data 
> on the encrypted filesystem first ssh seems to hang, I reconnect and the 

How much is this "huge"? Can it be compared in size with total fs capacity?
Is it one file of that size or is it lots of files of smaller size?

> of this clear reboot is impossible, I have to make a cold reboot. I'm sure 
> that drives doesnt have a problem at all, hardware is in good condition. In 
> the past I was able to reproduce those problems on more than one machines, 
> I'm sure I could do this this time, or that you will be able too :) or I 
> hope so.

I am going to try and reproduce it now. If I won;t be able to, I will
ask more questions.

Bye,
    Oleg
