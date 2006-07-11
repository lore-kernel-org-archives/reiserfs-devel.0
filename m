From: Toby Thain <toby@smartgames.ca>
Subject: Re: any way to disable fsync?
Date: Tue, 11 Jul 2006 19:41:10 -0400
Message-ID: <BAYC1-PASMTP0152E46B1E5184F223039DBF680@CEZ.ICE>
References: <op.tcjl3meld4os1z@localhost> <200607112157.k6BLvUqk028924@turing-police.cc.vt.edu>
Mime-Version: 1.0 (Apple Message framework v750)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28958-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200607112157.k6BLvUqk028924@turing-police.cc.vt.edu>
Message-Id: <5BAA6698-9B1B-41F0-ACBA-14454A793619@smartgames.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Valdis.Kletnieks@vt.edu
Cc: =?UTF-8?Q?=C5=81ukasz_Mierzwa?= <prymitive@pcserwis.net>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>


On 11-Jul-06, at 5:57 PM, Valdis.Kletnieks@vt.edu wrote:

> On Tue, 11 Jul 2006 23:03:12 +0200, =?iso-8859-2?B? 
> o3VrYXN6IE1pZXJ6d2E=?= said:
>> I got problem with apps that are calling fsync, it makes my hard  
>> drive
>> flush like mad and it slows down things quite a lot.
>
> Several have posted how to bypass it.  I'll pose the opposite side:
>
> Usually, applications call fsync() because they're pretty sure that if
> the disk and in-memory copies aren't lined up, a crash at that  
> point could
> result in data loss and/or corruption.
>
> So sqlite calls fsync() - probably because if it *doesn't*, and your
> system crashes/reboots, you *will* lose that sqlite database.

Absolutely; it's required for commit semantics. :-)

>
> Your data, your decision.

