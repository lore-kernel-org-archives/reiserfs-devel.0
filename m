From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: reiser4 plugins
Date: Fri, 27 Aug 2004 16:04:43 +0400
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <16687.9051.311225.697109@thebsh.namesys.com>
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
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <412E786E.5080608@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Christoph Hellwig <hch@lst.de>, Christophe Saout <christophe@saout.de>, Andrew Morton <akpm@osdl.org>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

Hans Reiser writes:
 > Christophe Saout wrote:
 > 
 > >
 > >
 > >I don't know, ask Hans. How could the VFS know it a filesystem wants to
 > >do something specific with a file that is completely transparent to the
 > >VFS?
 > >
 > >  
 > >
 > To know what method to use, you must determine the pluginid, and then 
 > find the method within that plugin for that vfs operation.
 > 
 > As for overhead, well, who eats whose dust in the benchmarks....?

Whoever sponsors the benchmark usually wins. Had you forgotten that
mongo setup used by http://www.namesys.com/benchmarks.html was specially
`tuned' to reach peak reiser4 performance? Remember why you decided to
turn OVERWRITE and MODIFY phases off? People on #reiser4 report 90
_second_ stalls with reiser4 under high io loads (large atom is
obviously being flushed and everyone waits on it...). In my opinion, it
is such things that are of utmost importance for real reiser4
acceptance, not how to name `metas' sub-directory.

Nikita.
