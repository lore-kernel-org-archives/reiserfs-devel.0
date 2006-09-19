From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 resize
Date: Tue, 19 Sep 2006 12:54:30 -0500
Message-ID: <45102ED6.6080209@slaphack.com>
References: <eeng4b$i68$1@sea.gmane.org> <200609191723.01936.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29942-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609191723.01936.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: Jack Byer <ojbyer@usa.net>, reiserfs-list@namesys.com

Vladimir V. Saveliev wrote:
> Hello
> 
> On Tuesday 19 September 2006 05:12, Jack Byer wrote:
>> Short summary: Will a resize program for reiser4 be available within the
>> next six months?
>>
> 
> Currently nobody works on that. So, I guess it is not very likely that reiser4.resize will be created within next six months.

Not even an expand?  I know a shrink depends on a working repacker (even 
an offline one), but I'd think expanding it would be simple enough, so 
long as there's a big warning of "You cannot undo this (can't shrink)!"

>> When I first created the filesystem, there was a reiser4 resize program.
>> This is no longer the case.
> 
> that was not a working program.

Yes, I remember that, it was a stub.

> I think you should change to a filesystem which has resize.

Alternately, how much would it cost to implement basic resizefs.reiser4?

There are other reasons that make me wish I'd stayed away from reiser4 
for awhile.  Mainly, right now, I need a repacker, and the system seems 
to have become absurdly slow when it's fragmented.  When I have over a 
gig of RAM free (not even buffer/cache, but _free_), and am trying to 
download anything over BitTorrent, even if it's less than 200 megs, the 
disk thrashes so badly that the system is really only usable for web and 
email.  Even movies will occasionally stall when this is happening, and 
by "occasionally", I mean every minute or so.

I believe there was a patch to address the thrashing, so I'm eagerly 
awaiting 2.6.18, but the lack of a repacker bothers me.
