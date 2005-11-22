From: David Masover <ninja@slaphack.com>
Subject: Re: More Slowdown
Date: Tue, 22 Nov 2005 08:29:15 -0600
Message-ID: <43832B3B.8070802@slaphack.com>
References: <200511171447.41362.mail@earthworm.de> <200511221123.51724.marcel@hilzinger.hu> <20051122103812.GB12072@favonius> <200511221144.34541.marcel@hilzinger.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27074-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511221144.34541.marcel@hilzinger.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marcel Hilzinger <marcel@hilzinger.hu>
Cc: reiserfs-list@namesys.com

Marcel Hilzinger wrote:
> Am Dienstag, 22. November 2005 11:38 schrieb Sander:
> 
>>Marcel Hilzinger wrote (ao):
>>
>>>Did you ever think about, that this is not a reiser4 problem, but a
>>>kernel bug or a problem related to hal?
>>>
>>>Suse 10 has big problems with external USB drives using sync as mount
>>>option. They used sync already in 9.3 but with 2.6.11 there were no
>>>such problems. There has been some changes in kernel 2.6.13 and 2.6.14
>>>concering the sync behavior, perhaps it can help investigating there
>>>first, bevor fixing reiser4 for nothing...
>>
>>Running Debian here, and all the reports have been on Reiser4
>>filesystems. Also, the same system has no such problems with other
>>filesystems.
> 
> It's not about Debian or Suse. It's about kernel 2.6.13 or 2.6.14. At least it 
> seems, that the problem does not appear on older kernels (right?)

Wrong.

You are talking about the fsync issue, right?  As far as I know, while
there has been progress lately, fsync has always been slow on Reiser4,
because until recently, it was basically a call to sync, and reiser4
syncs can be huge due to lazy writes -- stuff only ever hits disk when
there's nowhere else to put it in RAM.  Actual calls to sync are rare
enough (shutdown/reboot) that lazy writes are a good thing, but fsync
apparently needs to be faster.

I disabled fsync before the FS was even stable, because I was sick of
waiting 30 seconds or so for vim to save and quit.

It may help to have fsync only sync the file in question (as it always
has, except on Reiser4).  This has been done with lazy writes, in XFS,
so I see no reason it can't be done here -- there might have even been a
patch recently.  Personally, I'd like to see it stay as slow as it is
for awhile, so we can find the people doing stupid things (evolution)
and flame them into crispy obediance.

fsync means flush to disk.  This is something you're supposed to do with
a file when the file is so important you want to guarentee you'll have
the most recent, uncorrupted version after a crash.  If evolution is
calling fsync while resizing, this is an evolution bug, made more
obvious by reiser4 -- if a computer crashes, does the user really care
if their Evolution columns are still lined up _exactly_ the way they
were (maybe mid-click'n'drag) when the crash occurred?

If there is a user who cares that much about column widths, can we flame
them to crispiness also?

