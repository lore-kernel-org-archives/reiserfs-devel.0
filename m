From: Hans Reiser <reiser@namesys.com>
Subject: Re: viewprinting: what format should views be stored in?
Date: Tue, 17 Aug 2004 19:22:24 -0700
Message-ID: <4122BD60.2090601@namesys.com>
References: <411FFCB4.2060400@namesys.com> <41201252.1080803@comcast.net> <412015D0.8030806@namesys.com> <41210FF5.7080605@comcast.net> <4121AEAA.8050008@namesys.com> <41225C9C.7050400@comcast.net> <41226A50.3010609@namesys.com> <412298E1.4080100@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20367-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412298E1.4080100@comcast.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: George Beshers <gbeshers@comcast.net>
Cc: ReiserFS List <reiserfs-list@namesys.com>

George Beshers wrote:

>
> First, rereading my e-mails I realize that there was some thinking 
> behind my questions
> which was only partially articulated.  Going back to my earlier 
> position which I will restate
> here as:
>
>     /Use of a mask should never corrupt the semantics defined by the
>     Single Unix
>     Specification /*or*/ its practical derivations and extensions,
>     e.g., BSD and Linux./
>
I expect to turn those semantics on their head within 3-5 years when we 
do the semantic enhancements.

I think you should rephrase it as: we should not break any existing 
program without getting something sufficiently worthwhile as a result, 
and doing it with care.

> That is,/ ideally/ if I created a standalone system that "looked" like 
> the system the mask
> provides then the process would behave equivalently.  I emphasize 
> ideally because to
> actually make that the case would require something closer to a 
> virtual machine---which
> is clearly beyond the scope of this project.
>
> So I am looking for potential semantic anomalies which could be 
> introduced by a
> mask over a reiser4 file system, i.e., border cases where some upfront 
> awareness
> and attention may save re-design and re-writing later on.
>
>
> Hans Reiser wrote:
>
>>
>>> The issue is how the mask might change the semantics of 
>>> sys_execve().  I have spent some time
>>> starting to trace code around, but more work is required.
>>>
>>> For the moment I think we are safe if the setuid and setgroup can 
>>> not be altered by the mask.
>>
>>
>> Ok.
>
>
> For the moment I will focus on how the uid (and assume the group id 
> will be similar)
> of a process and how the mask might lead to a different uid than would 
> be expected
> under standard semantics.

I don't think you need to support the mask changing uids.  Nice feature, 
but let's keep it minimal for now.  I think the whole issue of uid can 
be sidestepped and ignored.  You can, however, put 3 paragraphs in our 
report discussing it as a theoretical issue, if you find it interesting 
to ponder.

>
> So we agree that the process has an associated user: actually there is 
> the concept
> of real and effective uid also.
>
> I believe the statement above to be true if the process never makes a 
> setuid() system's call of
> one flavor or another because the uid is inherited from the process 
> calling execev() or is determined
> by the owner of the executable if the executable's file set-uid 
> permission bit is turned on via chmod.
>
>>>
>>> We only change the semantics if the real/effective uid or gid is 
>>> different at some point in the
>>> processes execution because of the mask---begging situations where a 
>>> call to setuid happens
>>> only if a certain file is not available.
>>
>>
>> Say more.
>
> If the process has the code like
>
>     if (stat("/etc/foobar.conf", statbuf)  < 0) {
>          if (setuid(3) < 0) {   /* Try to become sys */
>         }
>         /* Do something here */
>     }
>
> And the mask hides "/etc/foobar.conf" then in fact the uid
> will change but *not unexpectedly*, IMO.  The mask is
> creating a changed environment but the behavior is
> understandable from the source code.
>
> Put this another way, the semantics still seem correct to me
> because you are getting the behavior of "/etc/foobar.conf" actually
> not being there.
>
> Now that I think about it masking a named pipe or a lock file
> is perhaps more likely to cause problems then the setuid bit.
> More cogitation required...  :-)
>
It is not our task to ensure the mask causes no problems due to a faulty 
specification of it.  It is merely our task to ensure that creating a 
correct mask is well automated and easy.

George, trust me, the project will be a LOT more fun if we implement the 
bare minimum and get it done early, and then after that spend the rest 
of the time doing what amuses us.

For me, the big issue to decide at the start is, should a view 
specification be implemented with a format that is as if it is a 
subdirectory of the masked executable, and that the executable gets 
chrooted to, and that uses all the semantic tree traversal code already 
written by us.

I think the answer is yes, but I am going to think about it as I jog for 
an hour.  Please come up with arguments for and against it.

Hans
