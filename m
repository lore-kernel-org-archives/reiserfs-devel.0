From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: filesystem corruption ?
Date: Fri, 21 Mar 2003 14:01:38 +0100
Sender: Bernd Schubert <Bernd.Schubert@tc.pci.uni-heidelberg.de>
Message-ID: <200303211401.38329.bernd-schubert@web.de>
References: <200303201725.14039.bernd-schubert@web.de> <200303201923.48454.bernd-schubert@web.de> <20030321103230.C12315@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13316-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030321103230.C12315@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Hi,

> So, the beam of X-rays run through the memory module corrupting some bits?
> ;) This stuff should not have been written to disk, so probably
> plain reboot should fix everything? Can you test that?
>

indeed after rebooting everything is fine again. We will run another memtest86 
during the weekend, though I really don't believe we will find a problem.

Though this machine will be replaced by a real server in a few month, I'm 
still rather worried what happend. Even if its 'only' a hardware memory 
problem this means lots of trouble for us -- on the one hand it seems not to 
be memtest86 detectable and on the other hand our programs really do need 
working memory, but of course this is not of your concern.


Thanks for your help,
	Bernd
