From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: reiser4 plugins
Date: Sat, 28 Aug 2004 17:47:39 +0400
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <16688.36091.861155.985990@gargle.gargle.HOWL>
References: <20040825152805.45a1ce64.akpm@osdl.org>
	<412D9FE6.9050307@namesys.com>
	<20040826014542.4bfe7cc3.akpm@osdl.org>
	<1093522729.9004.40.camel@leto.cs.pocnet.net>
	<20040826124929.GA542@lst.de>
	<1093525234.9004.55.camel@leto.cs.pocnet.net>
	<20040826130718.GB820@lst.de>
	<1093526273.11694.8.camel@leto.cs.pocnet.net>
	<20040826132439.GA1188@lst.de>
	<1093527307.11694.23.camel@leto.cs.pocnet.net>
	<20040826134034.GA1470@lst.de>
	<1093528683.11694.36.camel@leto.cs.pocnet.net>
	<412E786E.5080608@namesys.com>
	<16687.9051.311225.697109@thebsh.namesys.com>
	<412F7A59.8060508@namesys.com>
	<16687.33718.571411.76990@thebsh.namesys.com>
	<41305619.9030401@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <41305619.9030401@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Christoph Hellwig <hch@lst.de>, Christophe Saout <christophe@saout.de>, Andrew Morton <akpm@osdl.org>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>

Hans Reiser writes:
 > Nikita Danilov wrote:
 > 
 > > > >Whoever sponsors the benchmark usually wins. Had you forgotten that
 > > > >mongo setup used by http://www.namesys.com/benchmarks.html was specially
 > > > >`tuned' to reach peak reiser4 performance? Remember why you decided to
 > > > >turn OVERWRITE and MODIFY phases off?
 > >
 > What I should have done was what I did with fsync performance.  With 
 > fsync performance I told people that we had not yet tuned for it, please 
 > wait a bit and we will tune for it, for now it sucks.

Right, and instead of this you are now claiming that these `benchmarks'
show superior reiser4 performance. Moreover, you are doing this
aggressively and proposing other people to `eat the dust' over what
happened to only exist due to your failing to remember something. As
some other notable LKML poster put it `inform yourself before
posting'. :-)

 > 
 > Instead what I did was discuss with Zam at the time how it could be 
 > fixed, leave it off the website until Zam was given a chance to fix it, 

It wasn't Zam. It was me to begin with. OVERWRITE and MODIFY phases were
turned off after switching to large keys.

 > and then I managed to forget about it.   After release one remembers 
 > what all the things that should have been fixed before release were, sigh.
 > 

[...]

 > 
 > I think your characterization of my reasons was unkind and also unfair.  

What fairness and kindness one expects after styling others as `puppies'
in public, and commenting on their hair style in purportedly technical
argument?

[...]

 > 
 > Hans

Nikita.
