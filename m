From: Hans Reiser <reiser@namesys.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Tue, 01 Aug 2006 06:01:14 -0600
Message-ID: <44CF428A.8000402@namesys.com>
References: <200607312314.37863.bernd-schubert@gmx.de>	 <200608011428.k71ESIuv007094@laptop13.inf.utfsm.cl>	 <20060801165234.9448cb6f.reiser4@blinkenlights.ch>	 <1154446189.15540.43.camel@localhost.localdomain>	 <44CF84F0.8080303@slaphack.com> <e692861c0608011004x2ac1d9fcu353cd8e0d72eaac4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29417-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e692861c0608011004x2ac1d9fcu353cd8e0d72eaac4@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gregory Maxwell <gmaxwell@gmail.com>
Cc: David Masover <ninja@slaphack.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Adrian Ulrich <reiser4@blinkenlights.ch>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, bernd-schubert@gmx.de, reiserfs-list@namesys.com, jbglaw@lug-owl.de, clay.barnes@gmail.com, rudy@edsons.demon.nl, ipso@snappymail.ca, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org

Gregory Maxwell wrote:

> This is why ZFS offers block checksums... it can then try all the
> permutations of raid regens to find a solution which gives the right
> checksum.
>
ZFS performance is pretty bad in the only benchmark I have seen of it. 
Does anyone have serious benchmarks of it?  I suspect that our
compression plugin (with ecc) will outperform it.
