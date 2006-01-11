From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 warning?
Date: Wed, 11 Jan 2006 00:16:45 -0800
Message-ID: <43C4BEED.9040503@namesys.com>
References: <20060110211802.GA16793@apartia.fr> <43C4BCF2.1070000@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27658-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43C4BCF2.1070000@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "E.Gryaznova" <grev@namesys.com>
Cc: Louis-David Mitterrand <vindex+lists-reiserfs-list@apartia.org>, reiserfs-list@namesys.com

E.Gryaznova wrote:

> Hello.
>
>
> Louis-David Mitterrand wrote:
>
>> Hello,
>>
>> When rebooting a server I catched this in the logs:
>>
>>     Jan 10 18:13:55 zenon kernel: <4>reiser4[apache-perl(6359)]:
>> disable_write_barrier (fs/reiser4/wander.c:233)[zam-1055]:
>>     Jan 10 18:13:55 zenon kernel: WARNING: disabling write barrier
>>
>> Is it bad?
>>  
>>
> No. You may ignore this warning.
>
> Thanks,
> Lena.
>
>> (using 2.6.14 patch)
>>
>>
>>  
>>
>
>
>
Always explain things like this to users, don't just tell them to ignore
it, tell them why they can ignore it.  Zam, please send in the patch to
change it to a notice instead of warning.

Hans
