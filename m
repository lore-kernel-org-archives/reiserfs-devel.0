From: David Masover <ninja@slaphack.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Mon, 31 Jul 2006 16:43:34 -0500
Message-ID: <44CE7986.80109@slaphack.com>
References: <1153760245.5735.47.camel@ipso.snappymail.ca>	 <20060731144736.GA1389@merlin.emma.line.org>	 <20060731175958.1626513b.reiser4@blinkenlights.ch>	 <20060731162224.GJ31121@lug-owl.de>	 <Pine.LNX.4.64.0607311842120.13492@nedra.edsons.demon.nl>	 <20060731173239.GO31121@lug-owl.de>	 <20060731181120.GA9667@merlin.emma.line.org>	 <20060731184314.GQ31121@lug-owl.de>	 <20060731191712.GE17206@HAL_5000D.tc.ph.cox.net>	 <1154374923.7230.99.camel@localhost.localdomain>	 <e692861c0607311400x412d2e6bv71f474ea959c9e00@mail.gmail.com> <1154382026.7230.110.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29338-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1154382026.7230.110.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Gregory Maxwell <gmaxwell@gmail.com>, Clay Barnes <clay.barnes@gmail.com>, Rudy Zijlstra <rudy@edsons.demon.nl>, Adrian Ulrich <reiser4@blinkenlights.ch>, vonbrand@inf.utfsm.cl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Alan Cox wrote:
> Ar Llu, 2006-07-31 am 17:00 -0400, ysgrifennodd Gregory Maxwell:

>> Are you sure that you aren't commenting on cases where Reiser3 alerts
>> the user to a critical data condition (via a panic) which leads to a
>> trouble report while ext3 ignores the problem which suppresses the
>> trouble report from the user?
> 
> man mount
> 
> Ext3 is configurable, and has been for years via the errors= option.

Sure, but I think the suggestion is that the reason we generally see 
more ReiserFS complaints than ext3 complaints might be because of the 
default level of errors logged.
