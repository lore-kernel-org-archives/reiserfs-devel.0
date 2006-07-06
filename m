From: Toby Thain <toby@smartgames.ca>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Thu, 6 Jul 2006 13:26:32 -0400
Message-ID: <BAYC1-PASMTP05F875A74B572C29224C5ABF770@CEZ.ICE>
References: <1151602916.32453.40.camel@ipso.snappymail.ca> <1151608355.6335.79.camel@tribesman.namesys.com> <1151612146.11510.4.camel@ipso.snappymail.ca> <44A55271.7050501@namesys.com> <44A55591.6060500@suse.com> <1152059846.30139.11.camel@ipso.snappymail.ca> <44AB25EE.8030702@namesys.com> <20060706125856.fdac1d16.pegasus@nerv.eu.org> <1152200638.30139.45.camel@ipso.snappymail.ca>
Mime-Version: 1.0 (Apple Message framework v750)
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28919-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1152200638.30139.45.camel@ipso.snappymail.ca>
Message-Id: <FFF9F6E6-DA74-49D5-9EC2-24924AB07C94@smartgames.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1254"; delsp="yes"; format="flowed"
To: reiserfs-list@namesys.com


On 6-Jul-06, at 11:43 AM, Mike Benoit wrote:

> On Thu, 2006-07-06 at 12:58 +0200, Jure Pe=C4=8Dar wrote:
>> On Tue, 04 Jul 2006 19:37:34 -0700
>> Hans Reiser <reiser@namesys.com> wrote:
>>
>>> Mike Benoit wrote:
>>>
>>>> Hi Jeff,
>>>>
>>>> I just tried the patch you suggested and it didn't make a
>>>> difference.
>>>> The load still spikes as soon as the free space falls below ~10%.
>>>>
>>>>
>>> Jeff, please audit your code for what happens when all the bitmap
>>> blocks reach 90% full.  Could you discuss your design and code in
>>> that regard for our benefit?
>>>
>>> Mike, thanks so much for going to this much effort.  It is rather
>>> likely this is a problem affecting many users.
>>
>> I run my busy mailservers with 0.5-2% free space (that's still a =20
>> couple of gigabytes) and have no problems. It's true that I =20
>> haven't touched the kernel & reiserfs there (2.4.21), so it does =20
>> not have any additions to the reiserfs v3 code since then. It just =20=

>> works, so I don't have any desire to fix it :)
>>
>>
>
> My desktop machine (v2.6.16, same as my MythTV box) is running with 9%
> free space right now and it is not experiencing any slow down. I think
> the problem is caused by the usage pattern of MythTV and how it
> simultaneously streams one or more large files to the HD in relatively
> small chunks over a long period of time.

...And then has a hard timing requirement when reusing the free =20
space, which a desktop/server doesn't have, exposing the issue.
--T

>
> --=20
> Mike Benoit <ipso@snappymail.ca>

