From: Chris Mason <mason@suse.com>
Subject: Re: fsync() Performance Issue
Date: 06 May 2002 18:57:19 -0400
Message-ID: <1020725839.988.50.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10267-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CD6F3D4.9050103@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

On Mon, 2002-05-06 at 17:21, Hans Reiser wrote:
>
> >I'd rather not put it back in because it adds yet another corner case to
> >maintain for all time.  Most of the fsync/O_SYNC bound applications are
> >just given their own partition anyway, so most users that need data
> >logging need it for every write.
> >
> Does mozilla's mail user agent use fsync?  Should I give it its own 
> partition?  I bet it is fsync bound....;-)

[ I took Wayne off the cc list, he's probably not horribly interested ]

Perhaps, but I'll also bet the fsync performance hit doesn't affect the
performance of the system as a whole.  Remember that data=journal
doesn't make the fsyncs fast, it just makes them faster.

> 
> Most persons using small fsyncs are using it because the person who 
> wrote their application wrote it wrong.  What's more, many of the 
> persons who wrote those applications cannot understand that they did it 
> wrong even if you tell them (e.g. qmail author reportedly cannot 
> understand, sendmail guys now understand but had Kirk McKusick on their 
> staff and attending the meeting when I explained it to them so they are 
> not very typical....).  
> 
> In other words, handling stupidity is an important life skill, and we 
> all need to excell at it.;-)

A real strength to linux is the application designers can talk directly
to their own personal bottlenecks.  Hopefully we reward those that hunt
us down and spend the time convincing us their applications are worth
tuning for.  They then proceed to beat the pants off their competition.

> 
> Tell me what your thoughts are on the following:
> 
> If you ask randomly selected ReiserFS users (not the reiserfs-list, but 
> the ones who would never send you an email....)  the following 
> questions, what percentage will answer which choice?
> 
> The filesystem you are using is named:
> 
> a) the Performance Optimized SuSE FS
> 
> b) NTFS
> 
> c) FAT
> 
> d) ext2
> 
> e) ReiserFS

I believe the ones that know what a filesystem is will answer ReiserFS,
You might get a lot of ext2 answers, just because that's what a lot of
people think the linux filesystem is.

> 
> If you want to change reiserfs to use data journaling you must do which:
> 
> a) reinstall the reiserfs package using rpm
> 
> b) modify /etc/fs.conf
> 
> c) reinstall the operating system from scratch, and select different 
> options during the install this time
> 
> d) reformat your reiserfs partition using mkreiserfs
> 
> e) none of the above
> 
> f) all of the above except e)

These people won't be admins of systems big enough for the difference to
matter.  data journaling is targeted at people with so much load they
would have to buy more hardware to make up for it.  The new option
lowers the price to performance ratio, which is exactly what we want to
do for sendmails, egeneras, lycos, etc.  If it takes my laptop 20ms to
deliver a mail message, cutting the time down to 10ms just won't matter.

> 
> 
> What do you think the chances are that you can convince Hubert that 
> every SuSE Enterprise Edition user should be asked at install time if 
> they are going to use fsync a lot on each partition, and to use a 
> different fstab setting if yes?

Very little, I might tell them to buy the suse email server instead,
since that would have the settings done right.  data=journal is just a
small part of mail server tuning.

> 
> I know that you are an experienced sysadmin who was good at it.  Your 
> intuition tells you that most sysadmins are like the ones you were 
> willing to hire into your group at the university.  They aren't.
> 
> Linux needs to be like a telephone.  You plug it in, push buttons, and 
> talk.  It works well, but most folks don't know why.
> 

Exactly.  I think there are 3 classes of users at play here.

1) Those who don't understand and don't have enough load to notice.
2) Those who don't understand and do have enough load to notice.
3) Those who do understand and do have enough load to notice.

#2 will buy support from someone, and they should be able to configure
the thing right.

#3 will find the docs and do it right themselves.

> A moderate number of programs are small fsync bound for the simple 
> reason that it is simpler to write them that way.    We need to cover 
> over their simplistic designs.
> 
> So, you have my sympathies Chris, because I believe you that it makes 
> the code uglier and it won't be a joy to code and test.  I hope you also 
> see that it should be done.

Mostly, I feel this kind of tuning is a mistake right now.  The patch is
young and there are so many places left to tweak...I'm still at the
stage where much larger improvements are possible, and a better use of
coding time.  Plus, it's monday and it's always more fun to debate than
give in on mondays.

-chris


