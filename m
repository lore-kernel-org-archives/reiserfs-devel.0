From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 for 2.6.16 (version 3) (or what is in the reiser4 todo
 list)
Date: Mon, 05 Jun 2006 22:31:56 -0700
Message-ID: <4485134C.9020205@namesys.com>
References: <1148923857.6482.12.camel@tribesman.namesys.com> <20060531235811.GA11674@rvalles.homedns.org.> <20060606020422.GB32109@rvalles.homedns.org.>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28741-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060606020422.GB32109@rvalles.homedns.org.>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: rvalles <rvalles@es.gnu.org>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

rvalles wrote:

>On Thu, Jun 01, 2006 at 01:59:20AM +0200, rvalles wrote:
> =20
>
>>>ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.16/reiser4-for-2.6.16-3.pa=
tch.gz contains the most recent reiser4 code which is considered stable ins=
ide Namesys.
>>>Please try it. Any feedback is welcome.
>>>     =20
>>>
>
> =20
>
>>Finally, the "fsync/mmap >1minute writing to disk while halting all IO"
>>I reported a few weeks ago seems to be gone. Are you aware of that? what
>>caused it on the first place?
>>
>>01:53:17 up 1 day, 23:59, 11 users,  load average: 0.37, 0.14, 0.21
>>
>>This allows me to use a kernel newer than 2.6.12.6 for the first time.
>>Now, let's hope it stays ok and the bug doesn't show itself in just a
>>few hours.
>>   =20
>>
>03:57:54 up 7 days,  2:03, 11 users,  load average: 1.66, 1.64, 1.91
>
>Ok, it's been a week already. While something has improved, the problem
>seems to still be there; it triggers much less often, and behaves
>different.
> =20
>
Well, we are getting close to this being at the top of the queue, so
over the next week can you collect data for us that says: I see such and
such delays with the new code?  I hope that we can then try to fix it.=20
We need to write a patch that makes the generic write code pass to
reiser4 more than 4k at a time, change our read code to submit bios more
than 4k at a time, test the generic read code to see that it does not
let device congestion cause it to request from us 4k at a time, and then
we (I hope) can turn to these pauses and fsync optimization.  These
pauses and fsync optimization will be related code I think.  I think we
need to let users control whether fsync is lazy or aggressive, and (this
is speculative)  we need to refine our throttling of atom growth so that
when atoms are forced to flush they do so smoothly.  I need to
understand though, does it ever happen without fsync being waited on in
the new code?  If the problem is purely that the process doing fsync
waits too long, then that is much easier than if either it happens
without fsync or fsync causes every process waiting on IO to hang.=20
Also, if it is only that fsync causes every process waiting on IO to
hang, it could be that IO scheduler tweaks could help it.  On the other
hand, if pauses happen every 600 seconds, then we have a deeper issue.

>For now, I've only managed to trigger it using mutt, the moment I "send"
>mail, it happens like 90% of the times. I can now, tho, edit files with vim
>without turning crazy.
>
>My brother, who uses the computer (I only ssh to it) hasn't noticed any
>problem, therefore if the problem isn't fixed, it is well hidden. Also,
>when I trigger it, it doesn't seem to affect whatever I/O is being done
>in paralel of the task that caused it, which makes me think it triggers
>far more often than I notice.
>
>Haven't tried -4, should I? I think I've heard it only fixes build-as-modu=
le
>problems, but I really don't know.
>
>Thanks,
>Roc Vall=E8s Dom=E8nech
>
> =20
>

