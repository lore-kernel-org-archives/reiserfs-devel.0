From: Chris Mason <mason@suse.com>
Subject: Re: 2 Terabyte install
Date: Wed, 12 May 2004 14:36:30 -0400
Message-ID: <1084386990.2583.244.camel@watt.suse.com>
References: <409AC2FF.7080800@lindows.com>
	 <1083917932.14089.281.camel@tribesman.namesys.com>
	 <409BB690.6030604@namesys.com> <409BBDC9.3030809@lindows.com>
	 <409FB387.8080804@namesys.com> <40A19147.4010703@lindows.com>
	 <40A257DA.2010903@namesys.com>
	 <1084386280.6257.31.camel@ipso.snappymail.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18634-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1084386280.6257.31.camel@ipso.snappymail.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Benoit <ipso@snappymail.ca>
Cc: Hans Reiser <reiser@namesys.com>, Clifford Beshers <clifford.beshers@lindows.com>, Vladimir Saveliev <vs@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>, Vitaly Fertman <vitaly@namesys.com>

On Wed, 2004-05-12 at 14:24, Mike Benoit wrote:
> On Wed, 2004-05-12 at 09:59, Hans Reiser wrote:
> > > There were a few bugs of ours that acted as red herrings, but Linspire 
> > > is now up and running on this system with ReiserFS 3 and kernel 2.6.5.
> > >
> > > While I'm here, I have some other questions:
> > >
> > >     * What is the time complexity of mounting a ReiserFS partition? 
> > >       It seems to be proportional to the size of the partition?  Is it
> > >       different for Reiser4?
> > >     * Is there a tool to determine the type of file system on a
> > >       partition without mounting it?
> > >
> > is the time a problem in practice, or just a curiousity point?
> 
> Hans,
> 
> 	The last place I worked had a 2.5TB RAID array that had 10's of
> millions of files on it, basically a perfect fit for ReiserFS. However
> they rejected it simply because of the mount times. It was a slower
> machine (mainly used for dumb storage, however uptime was critical) but
> the mount times were just crazy, I don't have hard numbers, but if I
> recall correctly I was told around 5-10 minutes. 
> 
Hans' guys made mount times better in v3 by reading the bitmaps in big
chunks.  I suspect you were using a kernel from before that fix.

-chris


