From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Again, some bad Reiser4 (ReiserFS) 'reviews'
Date: Thu, 15 Jul 2004 22:22:09 +0400
Message-ID: <20040715182209.GK21140@backtop.namesys.com>
References: <200407150025.30908.Dieter.Nuetzel@hamburg.de> <40F6C548.7030805@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19639-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40F6C548.7030805@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>, reiserfs-list@namesys.com, rufus@hackish.org

On Thu, Jul 15, 2004 at 10:56:24AM -0700, Hans Reiser wrote:
> Dieter N?tzel wrote:
> 
> >http://rufus.hackish.org/wiki/2.6FileSystemBenchmarks
> >
> >Greetings,
> >	Dieter
> >
> >
> > 
> >
> I think he has an fsync intensive workload, which reiser4 is not good at 
> because we haven't bothered with it yet, and we care more about maturing 
> the atomic functionality.  I have no idea what ccache does with the fs.  
> Does it use fsync?
> 
> How he got tar to be slow is hard to understand, I don't remember seeing 
> a slow tar using reiser4, does anyone else?  I am guessing he created 
> the tarball using ext2, and didn't know that readdir order matters and 
> affects the tarball, and that he should create it on the filesystem 
> being benchmarked.  Maybe the tarball ordering also affects subsequent 
> compiles, I don't know.
> 
> zam, would you confirm that the fibration plugin is our current default 
> plugin?

"dot-o fibrate" is default.

> Hans

-- 
Alex.
