From: "Thomas Graham" <lkthomas@sml.dyndns.org>
Subject: Re: http://www.namesys.com/snapshots/2004.08.03-internal.testing/
Date: Wed, 4 Aug 2004 22:16:26 +0800 (HKT)
Message-ID: <4273.192.168.0.30.1091628986.squirrel@sml.dyndns.org>
References: <200406150022.34578.vitaly@namesys.com>
    <200408031750.00291.vitaly@namesys.com>
    <20040803135805.GK1284@nysv.org>
    <200408031819.51600.vitaly@namesys.com> <4110A38A.7040807@namesys.com>
    <20040804095513.GL1284@nysv.org>
    <20040804144144.2f5fe7b3@philou.gramoulle.local>
    <1091627399.4791.22.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19982-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1091627399.4791.22.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

if a convertor are not done yet, I think we could wait until it's bundle
into the .tar.gz and we could use it, actually, do we HAVE TO do that
format changes ? or normal user could just ignore that except for some of
them who reach problem with that ?

> On Wed, 2004-08-04 at 08:41, Philippe Gramoull=E9 wrote:
>> Hello,
>>
>> On Wed, 4 Aug 2004 12:55:13 +0300
>> mjt@nysv.org (Markus T=F6rnqvist) wrote:
>>
>>   | >These blocks refers to blocks that were used by files and are now
>> backup
>>   | >super blocks?  These blocks could be critical database files, etc.?
>>   |
>>   | Seems to me like yes, but Reiser4 hasn't launched yet officially, so
>>   | I somehow doubt people will have anything too critical on Reiser4.
>>   |
>>   | I'm at least preparing myself to take backups of everything.
>>
>>
>> I completely agree. I really don't mind having another tens of format
>> disk change, if it make things better
>> faster, or cleaner. If people currently use reiser4 in production for
>> mission critical applications, without any backups,
>> well..., let's say that they had a bet and they lost :)
>>
>> As Markus said, Reiser4 hasn't been officially released, so i'm all for
>> format disk change if it improves things in the end
>> and even if few people might get burnt with that.
>
> If it provides some significant benefit, make the format change now.
> Whatever gets into the kernel you'll be stuck with ;-)
>
> -chris
>
>
>


--=20
HK Celtic Orchestra leader and coordanator: Thomas Graham Lau
Phone number: 852-93239670    (24hours a day, 7days a week non-stop phone)
Web site: http://sml.dyndns.org
Email: lkthomas@sml.dyndns.org
