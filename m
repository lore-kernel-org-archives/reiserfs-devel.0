From: "Thomas Graham" <lkthomas@sml.dyndns.org>
Subject: Re: hans! i found a bug in reiser4 :((((
Date: Mon, 12 Apr 2004 18:40:22 +0800 (HKT)
Message-ID: <12910.144.214.5.217.1081766422.squirrel@sml.dyndns.org>
References: <1081698647.5514.3.camel@redeeman.linux.dk>
    <1081755850.1183.30.camel@tribesman.namesys.com>
    <407A6B87.1080101@fbsd.za.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-17862-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <407A6B87.1080101@fbsd.za.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: aquadog <aquadog@fbsd.za.net>
Cc: reiserfs-list@namesys.com

it seems a very serious problem, are you sure that the problem is come
from reiserfs4 ? did you put optimize tag to none when you compile glibc ?
because glibc is very sensative on optimize tag, please post the error
section to mail list, so that people could help for that, I hope that's
not reiser4 problem, errrr...


> That is correct.
>
> Vladimir Saveliev wrote:
>> Hello
>>
>>
>> Do you mean that you put glibc sources on reiser4 and that make fails?
>>
>>
>
>


-- 
HK Celtic Orchestra leader and coordanator: Thomas Graham Lau
Phone number: 852-93239670    (24hours a day, 7days a week non-stop phone)
Web site: http://sml.dyndns.org
Email: lkthomas@sml.dyndns.org
