From: Will Dyson <will_dyson@pobox.com>
Subject: Re: Separating Indexing and Searching (was silent semantic changes
 with reiser4)
Date: Mon, 30 Aug 2004 21:57:17 -0400
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <4133DAFD.9060704@pobox.com>
References: <584702172685-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <584702172685-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: akpm@osdl.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com, reiser@namesys.com

Alexander G. M. Smith wrote:

> Not only bloat, but time wasted reinventing the wheel.  For my 
> experimental file system 
> (http://members.rogers.com/agmsbeos/AGMSRAMFileSystem.readme - see 
> the Nifty Features chapter), I had to figure out the BFS query

I had a look. Cool stuff!

> I like that.  Put the indexing and a related attribute change update 
> notification mechanism into the kernel.  User land libraries can 
> build on that to implement whatever query language you want, thus 
> saving work and having a common language for all file system 
> varieties that support indices.

Yeah, thats basicly what I was thinking. Right now I'm trying to think
of any kind of filesystem that could support the general concept of 
"Fast Searching", but be somehow unable to export this capability as a 
set of indices on file attributes....

Ok. I give up. It seems like the right abstraction to me.

> However, one of my (unfinished) experiments was to have magic 
> directories that show query results as their contents.  One attribute
>  of the directory (or even its name) would be the query string.  That
>  way even old software (like "ls") could use queries!  Implementing 
> queries-as-directories might require moving some things back into the
>  kernel, or at least into some plug-in level.

That is a pretty awesome idea. It should be done in its own specialized
filesystem though. QueryFS. If the change-notification mechanism in the
kernel was robust enough (a big if), the rest could be done with a
userspace filesystem (via FUSE). Mount a query, cd into it, run grep,
write a little bash script... Very unixy.

-- 
Will Dyson
"Back off man, I'm a scientist!" -Dr. Peter Venkman
