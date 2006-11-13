From: "Danny Milosavljevic" <danny_milo@yahoo.com>
Subject: Re: Which version will be merged into mainline kernel?
Date: Mon, 13 Nov 2006 21:27:07 +0000 (UTC)
Message-ID: <ejanvb$dgm$2@sea.gmane.org>
References: <194f62550610160250u265ef120lee3cf9a17266939f@mail.gmail.com>
	<454A596F.8070909@namesys.com>
	<194f62550611072321j1cd34205u55f3c121dcac7aac@mail.gmail.com>
	<200611081015.14320.biscani@pd.astro.it>
	<20061108102136.GS6012@schatzie.adilger.int> <ej4pca$tft$1@sea.gmane.org>
	<200611111928.kABJSgre030118@turing-police.cc.vt.edu>
Reply-To: danny.milo@scratchpost.org
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30151-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

On Sat, 11 Nov 2006 14:28:42 -0500, Valdis.Kletnieks wrote:
[...]
> I've never understood this kind of attitude some filesystems have. Usually
> the hardware would make sure that stuff doesn't disappear, and not some
> weird software workarounds like journalling or write barriers that
> complicate and slow down everything.
> 
> Now as you were saying?

Hehehe. Well, you turned it all around... insightful :)


While we are at it:

I take it that this is the reason journalling support is only picking up
now: the disks are so big that even in the unlikely event that some of the
hardware failsafes fail, one just cannot fsck all the disks completely
anymore, ever.

So the choice is really 'borked once, borked forever' / 'journal it and at
least somehow get it back online without fscking /
copying-to-new-disks-if-at-all-possible for 5 days straight'.

cheers,
  Danny

