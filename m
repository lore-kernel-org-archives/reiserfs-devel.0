From: Hans Reiser <reiser@namesys.com>
Subject: Re: fsync() Performance Issue
Date: Tue, 07 May 2002 01:21:24 +0400
Message-ID: <3CD6F3D4.9050103@namesys.com>
References: <93F527C91A6ED411AFE10050040665D0049BF9B4@corpusmx1.us.dg.com>	<1020463205.3	 946.252.camel@tiny>  <3CD341EC.9080906@namesys.com>	<1020517884.3947.266.camel@tiny>  <3CD3F76D.4000708@namesys.com> <1020688827.3947.2087.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10266-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: berthiaume_wayne@emc.com, reiserfs-list@namesys.com, green@namesys.com

Chris Mason wrote:

>On Sat, 2002-05-04 at 10:59, Hans Reiser wrote:
>  
>
>>So how about if you revise fsync so that it always sends data blocks to 
>>the journal not to the main disk?
>>    
>>
>
>This gets a little sticky.
>
>Once you log a block, it might be replayed after a crash.  So, you have
>to protect against corner cases like this:
>
>write(file)
>fsync(file) ; /* logs modified data blocks */
>write(file) ; /* write the same blocks without fsync */
>sync ;        /* use expects new version of the blocks on disk */
><crash>
>
>During replay, the logged data blocks overwrite the blocks sent to disk
>via sync().
>
>This isn't hard to correct for, every time a buffer is marked dirty, you
>check the journal hash tables to see if it is replayable, and if so you
>log it instead (the 2.2.x code did this due to tails).  This translates
>to increased CPU usage for every write.
>
>I'd rather not put it back in because it adds yet another corner case to
>maintain for all time.  Most of the fsync/O_SYNC bound applications are
>just given their own partition anyway, so most users that need data
>logging need it for every write.
>
Does mozilla's mail user agent use fsync?  Should I give it its own 
partition?  I bet it is fsync bound....;-)

Also, I don't think you can reasonably expect most persons to know that 
they should turn data logging on for high fsync performance, even if you 
document it.

Most persons using small fsyncs are using it because the person who 
wrote their application wrote it wrong.  What's more, many of the 
persons who wrote those applications cannot understand that they did it 
wrong even if you tell them (e.g. qmail author reportedly cannot 
understand, sendmail guys now understand but had Kirk McKusick on their 
staff and attending the meeting when I explained it to them so they are 
not very typical....).  

In other words, handling stupidity is an important life skill, and we 
all need to excell at it.;-)

Tell me what your thoughts are on the following:

If you ask randomly selected ReiserFS users (not the reiserfs-list, but 
the ones who would never send you an email....)  the following 
questions, what percentage will answer which choice?

The filesystem you are using is named:

a) the Performance Optimized SuSE FS

b) NTFS

c) FAT

d) ext2

e) ReiserFS

If you want to change reiserfs to use data journaling you must do which:

a) reinstall the reiserfs package using rpm

b) modify /etc/fs.conf

c) reinstall the operating system from scratch, and select different 
options during the install this time

d) reformat your reiserfs partition using mkreiserfs

e) none of the above

f) all of the above except e)


What do you think the chances are that you can convince Hubert that 
every SuSE Enterprise Edition user should be asked at install time if 
they are going to use fsync a lot on each partition, and to use a 
different fstab setting if yes?

I know that you are an experienced sysadmin who was good at it.  Your 
intuition tells you that most sysadmins are like the ones you were 
willing to hire into your group at the university.  They aren't.

Linux needs to be like a telephone.  You plug it in, push buttons, and 
talk.  It works well, but most folks don't know why.

A moderate number of programs are small fsync bound for the simple 
reason that it is simpler to write them that way.    We need to cover 
over their simplistic designs.

So, you have my sympathies Chris, because I believe you that it makes 
the code uglier and it won't be a joy to code and test.  I hope you also 
see that it should be done.

Hans

