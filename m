From: Bernd Petrovitsch <bernd@firmix.at>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 09:41:07 +0200
Message-ID: <1093592467.18603.6.camel@tara.firmix.at>
References: <Pine.LNX.4.58.0408251555070.17766@ppc970.osdl.org>
	 <1453698131.20040826011935@tnonline.net>
	 <20040825163225.4441cfdd.akpm@osdl.org>
	 <20040825233739.GP10907@legion.cup.hp.com>
	 <20040825234629.GF2612@wiggy.net> <1939276887.20040826114028@tnonline.net>
	 <20040826024956.08b66b46.akpm@osdl.org>
	 <839984491.20040826122025@tnonline.net> <m3llg2m9o0.fsf@zoo.weinigel.se>
	 <1906433242.20040826133511@tnonline.net> <20040826113332.GL2612@wiggy.net>
	 <1211039639.20040826134354@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20877-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1211039639.20040826134354@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Spam <spam@tnonline.net>
Cc: Wichert Akkerman <wichert@wiggy.net>, Christer Weinigel <christer@weinigel.se>, Andrew Morton <akpm@osdl.org>, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thu, 2004-08-26 at 13:43 +0200, Spam wrote:
> > Previously Spam wrote:
> >>   How  so?  The whole idea is that the underlaying OS that handles the
> >>   copying  should  also  know  to  copy  everything, otherwise you can
> >>   implement  everything  into  applications  and  just  skip the whole
> >>   filesystem part.
> 
> > UNIX doesn't have a copy systemcall, applications copy the data
> > manually.
> 
>   Oh, this is very unfortunate and should be a bigger issue to fix.

Then you have to rewrite POSIX und SuSv3.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services

