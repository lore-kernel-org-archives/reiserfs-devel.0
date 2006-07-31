From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
	regarding reiser4 inclusion
Date: Mon, 31 Jul 2006 20:42:02 +0100
Message-ID: <1154374923.7230.99.camel@localhost.localdomain>
References: <1153760245.5735.47.camel@ipso.snappymail.ca>
	 <200607241806.k6OI6uWY006324@laptop13.inf.utfsm.cl>
	 <20060731125846.aafa9c7c.reiser4@blinkenlights.ch>
	 <20060731144736.GA1389@merlin.emma.line.org>
	 <20060731175958.1626513b.reiser4@blinkenlights.ch>
	 <20060731162224.GJ31121@lug-owl.de>
	 <Pine.LNX.4.64.0607311842120.13492@nedra.edsons.demon.nl>
	 <20060731173239.GO31121@lug-owl.de>
	 <20060731181120.GA9667@merlin.emma.line.org>
	 <20060731184314.GQ31121@lug-owl.de>
	 <20060731191712.GE17206@HAL_5000D.tc.ph.cox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29317-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060731191712.GE17206@HAL_5000D.tc.ph.cox.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Clay Barnes <clay.barnes@gmail.com>
Cc: Rudy Zijlstra <rudy@edsons.demon.nl>, Adrian Ulrich <reiser4@blinkenlights.ch>, vonbrand@inf.utfsm.cl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Ar Llu, 2006-07-31 am 12:17 -0700, ysgrifennodd Clay Barnes:
> Of course, if ext3 were proven to be more robust against failures, I bet
> the reiser team would be very interested in all the forensic data you
> can offer, since, from what I've seen, they are always trying to make
> reiser as good as possible---in speed, flexability, *and* robustness.

Its well accepted that reiserfs3 has some robustness problems in the
face of physical media errors. The structure of the file system and the
tree basis make it very hard to avoid such problems. XFS appears to have
managed to achieve both robustness and better data structures. 

How reiser4 compares I've no idea. 

Alan

