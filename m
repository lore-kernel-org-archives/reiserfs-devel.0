From: Christoph Hellwig <hch@lst.de>
Subject: Re: reiser4 plugins (was: silent semantic changes with reiser4)
Date: Thu, 26 Aug 2004 17:37:48 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040826153748.GA3700@lst.de>
References: <20040826014542.4bfe7cc3.akpm@osdl.org> <1093522729.9004.40.camel@leto.cs.pocnet.net> <20040826124929.GA542@lst.de> <1093525234.9004.55.camel@leto.cs.pocnet.net> <20040826130718.GB820@lst.de> <1093526273.11694.8.camel@leto.cs.pocnet.net> <20040826132439.GA1188@lst.de> <1093527307.11694.23.camel@leto.cs.pocnet.net> <20040826134034.GA1470@lst.de> <1093528683.11694.36.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1093528683.11694.36.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Saout <christophe@saout.de>
Cc: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

> > compression or encryption must sit below the pagecache to work nicely,
> > and this hint things that usually sit at the pagecache level.  But let's
> > assume you have a valid use for different file_operations, why don't you
> > simply add in different file_operations instead of adding another
> > internal dispatch layer?  
> 
> I don't know, ask Hans. How could the VFS know it a filesystem wants to
> do something specific with a file that is completely transparent to the
> VFS?

The VFS shouldn't, that the whole point.  That's why it allows the
filesystem to register different method tables for each object.

