From: Hans Reiser <reiser@namesys.com>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 20:26:21 -0800
Message-ID: <41D4D4ED.9010603@namesys.com>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local>	<m38y7gx8kq.fsf@merlin.emma.line.org>	<20041230235911.4911a20c.hihone@bigpond.net.au>	<m3sm5nj2ef.fsf@merlin.emma.line.org> <87is6jpvdu.fsf@quasar.esben-stien.name> <41D4602D.2050609@namesys.com> <41D4CFEF.609@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22992-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41D4CFEF.609@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Esben Stien <b0ef@esben-stien.name>, Matthias Andree <ma@dt.e-technik.uni-dortmund.de>, hihone@bigpond.net.au, reiserfs-list@namesys.com

David Masover wrote:

> Hans Reiser wrote:
>
>> Esben Stien wrote:
>>
>>>
>>> I really don't like that there is no undelete feature in reiserfs -
>>> it's not planned for reiserfs-4 either.
>>>
>> Blame Linus for that.  I would put it in, but he thinks it belongs in 
>> userspace.  I may still put it in someday and just not tell him.;-)  
>> I'll just let the users know about it and not him.;-)
>
>
> He has some good points, though.  If you're going to have a kernel, 
> you want to keep it small, put stuff in only if it needs to be there.  
> And how much speed do we lose by putting stuff in userspace, if we do 
> it right?  C'mon, if Doom 3 can run in userspace, surely some sort of 
> trash can / recycle bin can, right?
>
> Oh wait... Gnome/KDE already do that.
>
>
>
the problem being that everyone uses rm not the gnome/kde trashcan....  
literal copying of Apple doesn't work for unix because we use shells 
most of the time.
