From: Christoph Hellwig <hch@infradead.org>
Subject: Re: reiser4 plugins (was: silent semantic changes with reiser4)
Date: Thu, 26 Aug 2004 17:25:28 +0100
Message-ID: <20040826172528.A21345@infradead.org>
References: <20040826130718.GB820@lst.de> <1093526273.11694.8.camel@leto.cs.pocnet.net> <20040826132439.GA1188@lst.de> <1093527307.11694.23.camel@leto.cs.pocnet.net> <20040826134034.GA1470@lst.de> <1093528683.11694.36.camel@leto.cs.pocnet.net> <20040826153748.GA3700@lst.de> <1093535334.5482.1.camel@leto.cs.pocnet.net> <20040826160601.GB4326@lst.de> <1093536859.5482.13.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20718-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1093536859.5482.13.camel@leto.cs.pocnet.net>; from christophe@saout.de on Thu, Aug 26, 2004 at 06:14:19PM +0200
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Saout <christophe@saout.de>
Cc: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

On Thu, Aug 26, 2004 at 06:14:19PM +0200, Christophe Saout wrote:
> Ok, I see your point. aops. Sorry.
> Looking at the code this could be done. The wrappers that dispatch the
> operations are really small and call the plugin that is registered with
> the inode of the mapping. Instead it could have directly set the
> corresponding operations. Right. The wrappers are doing a few things
> before calling the plugin. That could be done the other way round too.
> But that's more of an implementation issue and could still be changed.

I agree that it's an implementation issue.  But it's also a good proof
for how Hans tries to ignore all the existing infrastructure for various
reasons.
