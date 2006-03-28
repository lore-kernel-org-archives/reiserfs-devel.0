From: Sergey Ivanov <seriv@parkheights.dyndns.org>
Subject: Re: Reiser4 crash 2.6.16-mm1
Date: Tue, 28 Mar 2006 16:52:14 -0500
Message-ID: <4429B00E.5090604@parkheights.dyndns.org>
References: <20060327214132.4074.qmail@pv105234.reshsg.uci.edu>            <C68877DC-ED4F-4827-B6ED-2F5CFEFC8037@smartgames.ca>            <20060327223214.5291.qmail@pv105234.reshsg.uci.edu>            <200603280439.k2S4dAql011014@turing-police.cc.vt.edu>            <F01E6B3F-3EBE-4982-9978-C79554F01FDA@smartgames.ca>            <4429577C.7020105@ics.uci.edu>            <1143573487.2380.1.camel@localhost>            <442997D9.7000505@namesys.com> <20060328205454.3976.qmail@pv105234.reshsg.uci.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28394-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060328205454.3976.qmail@pv105234.reshsg.uci.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joe Feise <jfeise@feise.com>, reiserfs-list@namesys.com

Joe Feise wrote:
> 
> The machine is using ECC memory. Geez, I know what I need for a server...
> From the Dell invoice:
> 512MB DDR2, 400MHz,2X256MB ECC 1R DIMMs for PowerEdge SC420
> Recreating the partition solved the problem. So to me it sure looks like
> fs corruption.
> I have sent the dmesg output earlier.
Joe, I saw machines with ECC hardware (both motherboards and memory
chips) with ECC disabled in BIOS. Check please, if it's enabled for your
machine.
-- 
	Sergey Ivanov.

