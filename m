From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: reiser4 plugins
Date: Wed, 22 Jun 2005 19:29:42 +0400
Message-ID: <17081.33766.343219.30650@gargle.gargle.HOWL>
References: <20050620235458.5b437274.akpm@osdl.org.suse.lists.linux.kernel>
	<42B831B4.9020603@pobox.com.suse.lists.linux.kernel>
	<42B87318.80607@namesys.com.suse.lists.linux.kernel>
	<20050621202448.GB30182@infradead.org.suse.lists.linux.kernel>
	<42B8B9EE.7020002@namesys.com.suse.lists.linux.kernel>
	<42B8BB5E.8090008@pobox.com.suse.lists.linux.kernel>
	<p73fyvbb2rh.fsf@verdi.suse.de>
	<42B8D131.6060502@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24463-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42B8D131.6060502@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Jeff Garzik <jgarzik@pobox.com>, hch@infradead.org, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

Hans Reiser writes:
 > Andi Kleen wrote:
 > 
 > > Christoph does a lot of reviewing 
 > >
 > and he is notorious for making needed linux contributors go away and not
 > come back, and I won't say which famous person on this mailing list told
 > me that....
 > 
 > >and your child definitely
 > >is in serious need of that to be mergeable. I'm sure Christoph is able
 > >to review inpartially even when he is involved with other FS.
 > >  
 > >
 > As impartial as a puppy on PCP....
 > 
 > Christoph is aggressive about things he does not take the time to
 > understand or ask about first.  I hate that.   I wish he would go away
 > please.  He is not exactly an Ousterhout, Rob Pike, Granger, Mazieres,
 > Frans Kaashoek, etc.,  in his accomplishments, so why is he reviewing
 > other people's filesystems?  Reviews are great, how about finding
 > persons who have created filesystem innovations (and thus are less
 > likely to reject innovations without understanding them) to do them? 

Well, because of his classy hair-style of course.

Seriously, Linux is not managed by a committee. There is nobody to
appoint Official File System Reviewers of Her Majesty. Everything here
(including your credentials as a file system designer) is
self-proclaimed.

 > 
 > How about review by benchmark instead?

[...]

 >                                   I frankly think that with my
 > benchmarks, I should be allowed to tinker on my own. 

I am afraid it will sound picky, but 10 month ago you said you are
planning to replace benchmarks on the namesys.com with fairer ones:

http://marc.theaimsgroup.com/?l=reiserfs&m=109368686019301&w=2

Last time I checked, http://namesys.com/benchmarks.html still features
only mongo runs with overwrite/modify phases off and with all operations
done in readdir order (most favorable mode for reiser4).

 >
 > Hans The Mad
 > 

Nikita.
