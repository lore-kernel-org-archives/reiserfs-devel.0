From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: some basic questions
Date: Wed, 5 Nov 2003 18:15:14 +0300
Message-ID: <16297.5122.49027.64854@laputa.namesys.com>
References: <1067880381.17873.9.camel@redeeman.linux.dk>
	<1068044839.32072.0.camel@redeeman.linux.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15978-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1068044839.32072.0.camel@redeeman.linux.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: redeeman@metanurb.dk
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

Redeeman writes:
 > nobody seems to answer :(

Sorry for delay.

 > 
 > On Mon, 2003-11-03 at 18:26, Redeeman wrote:
 > > i am wondering about a few things. i am seriously thinking of change to
 > > reiserfs. i experience bad stuff happen to fat32 often, and i have got
 > > tired of it. i have a kernel with version 3.6 of reiserfs.
 > > 
 > > will it be possible to convert to reiserfs4?

There is no current plans for reiserfs->reiser4 convertor. One can use
tar, or this http://tzukanov.narod.ru/convertfs/ (universal conversion
utility written by some smart person).

 > > is it possible to defragment a partition with reiserfs (or will it be in
 > > version 4?)

There is de-fragmentation utility for reiserfs, but there is for
reiser4 (repacker).

 > > is it possible to undelete stuff?

Not yet (neither in reiserfs nor in reiser4).

 > > is it the correct choice for my use? (mp3, movies, cd images)

I think so.

 > > is there anything i should know?

Reiser4 is still in the debugging, don't use it in the
production. Reiserfs, on the other hand, is quite stable.

 > > 
 > > thanks, and have a nice day

Nikita.

 > -- 
 > Regards, Redeeman
