From: Oleg Drokin <green@namesys.com>
Subject: Re: filesystem corruption ?
Date: Fri, 21 Mar 2003 16:07:38 +0300
Message-ID: <20030321160738.I17440@namesys.com>
References: <200303201725.14039.bernd-schubert@web.de> <200303201923.48454.bernd-schubert@web.de> <20030321103230.C12315@namesys.com> <200303211401.38329.bernd-schubert@web.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13317-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200303211401.38329.bernd-schubert@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Schubert <bernd-schubert@web.de>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Mar 21, 2003 at 02:01:38PM +0100, Bernd Schubert wrote:
> > So, the beam of X-rays run through the memory module corrupting some bits?
> > ;) This stuff should not have been written to disk, so probably
> > plain reboot should fix everything? Can you test that?
> indeed after rebooting everything is fine again. We will run another memtest86 

So on-disk corruption is out of question.

> during the weekend, though I really don't believe we will find a problem.

Ask those physics guys to run some X-ray experiments while you are running memtest86 ;)

> Though this machine will be replaced by a real server in a few month, I'm 
> still rather worried what happend. Even if its 'only' a hardware memory 
> problem this means lots of trouble for us -- on the one hand it seems not to 
> be memtest86 detectable and on the other hand our programs really do need 

Well, it may be not detectable because no high-enerty beams are running around at
the time of test.

> working memory, but of course this is not of your concern.

I've learn in the school that if you put some bit amount of plumbum in between
some area and source of radiation, chances are radiation that will reach the
protected area will be of much lesser strenght.
In fact you might go to those guys and ask them what matherial (and how much of it)
is best suited to shield against stuff they generate.

Bye,
    Oleg
