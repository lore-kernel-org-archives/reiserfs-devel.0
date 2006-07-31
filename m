From: "Gregory Maxwell" <gmaxwell@gmail.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Mon, 31 Jul 2006 17:00:14 -0400
Message-ID: <e692861c0607311400x412d2e6bv71f474ea959c9e00@mail.gmail.com>
References: <1153760245.5735.47.camel@ipso.snappymail.ca>
	 <20060731144736.GA1389@merlin.emma.line.org>
	 <20060731175958.1626513b.reiser4@blinkenlights.ch>
	 <20060731162224.GJ31121@lug-owl.de>
	 <Pine.LNX.4.64.0607311842120.13492@nedra.edsons.demon.nl>
	 <20060731173239.GO31121@lug-owl.de>
	 <20060731181120.GA9667@merlin.emma.line.org>
	 <20060731184314.GQ31121@lug-owl.de>
	 <20060731191712.GE17206@HAL_5000D.tc.ph.cox.net>
	 <1154374923.7230.99.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29329-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1154374923.7230.99.camel@localhost.localdomain>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Clay Barnes <clay.barnes@gmail.com>, Rudy Zijlstra <rudy@edsons.demon.nl>, Adrian Ulrich <reiser4@blinkenlights.ch>, vonbrand@inf.utfsm.cl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On 7/31/06, Alan Cox <alan@lxorguk.ukuu.org.uk> wrote:
> Its well accepted that reiserfs3 has some robustness problems in the
> face of physical media errors. The structure of the file system and the
> tree basis make it very hard to avoid such problems. XFS appears to have
> managed to achieve both robustness and better data structures.
>
> How reiser4 compares I've no idea.

Citation?

I ask because your clam differs from the only detailed research that
I'm aware of on the subject[1]. In figure 2 of the iron filesystems
paper that Ext3 is show to ignore a great number of data-loss inducing
failure conditions that Reiser3 detects an panics under.

Are you sure that you aren't commenting on cases where Reiser3 alerts
the user to a critical data condition (via a panic) which leads to a
trouble report while ext3 ignores the problem which suppresses the
trouble report from the user?

*1) http://www.cs.wisc.edu/adsl/Publications/iron-sosp05.pdf
