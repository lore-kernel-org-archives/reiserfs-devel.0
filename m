From: "Thomas Graham" <lkthomas@sml.dyndns.org>
Subject: Re: reiser4 without problems?!
Date: Mon, 22 Nov 2004 11:09:25 +0800 (HKT)
Message-ID: <1433.147.8.17.110.1101092965.squirrel@sml.dyndns.org>
References: <20041121201203.8A3C23956@sitemail.everyone.net>
    <20041121204104.GY26192@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-22482-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041121204104.GY26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Markus =?iso-8859-1?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

I don't have so much problem as using it as a storage FS, I use reiser3
for my root filesystem, couldn't trust that, I wouldn't give it a risk
such as apache bugs before, pretty unstable tho, I have a 200GB and a
160GB HD using as non-root folder for storage, nothing crash but the
repacker sucks, Hans seems giveup on repacker idea, well, what's next ?

> On Sun, Nov 21, 2004 at 12:12:02PM -0800, BLuEGoD wrote:
>>
>> Hi, I want to run a debian with reiser4, but since reiser4 went out,
>> there
>> is no one that run it without problems, anyone knows if any kernel with
>> -mm
>> patches runs well?.. I think nowadays all people are losing time with
>
> Apart from my recent issues, which I just realized others have reported
> as well, the -cko series has been the best for me, and unfortunately
> the -rc2-mm2 crashes even worse for me (if I turn debug on), so it'll
> take a while before I can say anything more.
>
> Reiser4progs is still in Debian, so that's nothing.
>
>> reiser4, because I read that reiser4 comes without anything positive
>> than
>> others (that is because comes with "core" only).. If someone can set up
>> for
>> three or more days a system stable with reiser4 and 2.6.X kernel please
>> tell
>> me who!
>
> I just used debootstrap to install from a small partition which I still
> have as reiserfs.
>
> It's not a big issue to install it yourself.
>
> --
> mjt
>
>


-- 
HK Celtic Orchestra leader and coordanator: Thomas Graham Lau
Phone number: 852-93239670    (24hours a day, 7days a week non-stop phone)
Web site: http://sml.dyndns.org
Email: lkthomas@sml.dyndns.org
