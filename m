From: Chris Mason <mason@suse.com>
Subject: Re: reiser4 plugins (was: silent semantic changes with reiser4)
Date: Thu, 26 Aug 2004 09:58:00 -0400
Message-ID: <1093528680.21878.284.camel@watt.suse.com>
References: <Pine.LNX.4.44.0408260952230.26316-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20679-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0408260952230.26316-100000@chimarrao.boston.redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rik van Riel <riel@redhat.com>
Cc: Christophe Saout <christophe@saout.de>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

On Thu, 2004-08-26 at 09:52, Rik van Riel wrote:
> On Thu, 26 Aug 2004, Christophe Saout wrote:
> 
> > That's your opinion. reiser4 seems to work very well.
> 
> Have you tried /bin/cp, or a backup+restore ?
> 
> What happened to your file streams ?

Shrug, backup programs can be fixed.  The fact that we couldn't backup
16GB files before O_LARGEFILE wasn't a reason not to do it.

IMHO it's more important to ask the question 'is this important for
linux' and then we can figure out how to make it work.

-chris


