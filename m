From: mjt@nysv.org (Markus  =?ISO-8859-1?Q?=20T=F6rnqvist?=)
Subject: Re: reiser4 plugins (was: silent semantic changes with reiser4)
Date: Sat, 28 Aug 2004 14:58:55 +0300
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040828115855.GH1284@nysv.org>
References: <1093522729.9004.40.camel@leto.cs.pocnet.net> <20040826124929.GA542@lst.de> <1093525234.9004.55.camel@leto.cs.pocnet.net> <20040826130718.GB820@lst.de> <1093526273.11694.8.camel@leto.cs.pocnet.net> <20040826132439.GA1188@lst.de> <1093527307.11694.23.camel@leto.cs.pocnet.net> <20040828111807.GC6746@alias> <20040828112255.GA11569@lst.de> <20040828114628.GD6746@alias>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040828114628.GD6746@alias>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: flx@msu.ru, Christoph Hellwig <hch@lst.de>, Christophe Saout <christophe@saout.de>, Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

On Sat, Aug 28, 2004 at 03:46:28PM +0400, Alexander Lyamin wrote:
>Not true. If true - send bugreports.

Hate to say it, but apparently symlinking out of metas oopses, but that
should be trivial to fix?

>> Al has started a thread to hash out working semantics, but there's not been
>> a single namesys person involved.  Similar all of you have absolutely ignore
>Al message had a reply.
>"namesys persons" is Hans Reiser.  Sufficient ?

Not to be disrespectful, but Hans has sometimes taken personal shots on the
lists and that's not a productive approach. Not that he'd be the only one
around to do so.

Seems to me, as Christoph said, that some other Namesys guy than Hans should
participate in the Al/Linus branch of the thread with ideas.

Certainly the VFS may have to be extended right about now, so someone who
knows the exact details of Reiser4 should offer ideas and I'm not so sure
it's Hans. Looks like he had the ideas but not the implementation.

There's also the risk that Reiser4's implementation's don't really bend
into even a modified/extended VFS because of the plugins?
That's definitely something that has to be approached properly...

-- 
mjt

