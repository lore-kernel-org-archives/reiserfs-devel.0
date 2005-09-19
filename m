From: Hans Reiser <reiser@namesys.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Sun, 18 Sep 2005 22:16:11 -0700
Message-ID: <432E499B.7000003@namesys.com>
References: <432AFB44.9060707@namesys.com> <200509181321.23211.vda@ilport.com.ua> <20050918102658.GB22210@infradead.org> <200509181406.25922.chrivers@iversen-net.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26058-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509181406.25922.chrivers@iversen-net.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: Christian Iversen <chrivers@iversen-net.dk>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Christian Iversen wrote:

>On Sunday 18 September 2005 12:26, Christoph Hellwig wrote:
>  
>
>>On Sun, Sep 18, 2005 at 01:21:23PM +0300, Denis Vlasenko wrote:
>>    
>>
>>>This is it. I do not say "accept reiser4 NOW", I am saying "give Hans
>>>good code review".
>>>      
>>>
>>After he did his basic homework.  Note that reviewing hans code is probably
>>at the very end of everyones todo list because every critizm of his code
>>starts a huge flamewar where hans tries to attack everyone not on his
>>party line personally.
>>
>>I've said I'm gonna do a proper review after he has done the basic
>>homework, which he seems to have half-done now at least.  Right now he
>>hasn't finished that and there's much more exciting filesystems like ocfs2
>>around [...]
>>    
>>
>
>Now _what_ good does that sentence do us? I've been following this this since 
>the primary reiser filesystem was number 3, and the kernel everybody was 
>using was 2.4.10. You've probably been following this list for far longer, 
>but is that really an excuse for rudeness?
>
>reiser4 has many, many extremely interesting features. I'm sure anybody is 
>more than willing to go into detail with them, but saying that "ocfs2 is much 
>more exiting" is just plain bashing, and it's not fair to Hans, to Namesys, 
>or to every one of us who can't wait for reiser4 in mainline. 
>
>Could you please keep your personal idea of which filesystem is more 
>interesting to yourself? It doesn't help anybody accomplish anything. 
>
>  
>
Hellwig, people who write slow file systems should not lecture their
measurably superiors on how to code.  Oh, and I should mention that
other people besides me have measured reiser4, and concluded it is twice
the speed of the other Linux filesystems, so don't go claiming it is
just my benchmarks.   What you are doing is keeping me from doing a real
code review myself by keeping my guys so busy that they don't have time
to review the fixmes I inserted and would insert more of if I thought
they had time for them.   If you were as well suited to doing code
reviews as I am, you would have written a faster file system yourself.  
Anybody can find things to fix in someone else's code, and it can go on
for years if they want it to.  I could get what you do from hiring a
college junior, and if it was a good university I'd probably learn more
from that junior in college than from you.  We are doing work, and you
are getting in the way.  Nobody who wants reiser4 views your
contributions as the least bit positive.  I fear you will delay us until
ext3 can catch up.

What you are is someone who substitutes social connections for technical
ability.  You measurably can't code as well as we can, so once it
conforms to VFS interface requirements, please go away.


