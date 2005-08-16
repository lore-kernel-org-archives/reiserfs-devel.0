From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 sending process to D state
Date: Tue, 16 Aug 2005 11:28:49 -0700
Message-ID: <43023061.3060305@namesys.com>
References: <43012902.1010600@webalive.biz> <4301D2F1.1030907@namesys.com> <4301D739.3090104@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25520-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4301D739.3090104@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: mohammad.rahman@webalive.biz, reiserfs-list@namesys.com, Nate Diller <ndiller@namesys.com>

Vladimir V. Saveliev wrote:

> Hello
>
> Hans Reiser wrote:
>
>> Nate also reported this, yes?....
>>
>
> Yes, but with different test.
> I tried both and they worked fine here.
>
>>> WARNING: Flush failed: -12
>>> reiser4[pdflush(99)]: writeout
>>> (fs/reiser4/vfs_ops.c:586)[nikita-31001]:
>>> code: -12 at fs/reiser4/wander.c:1268
>>> WARNING: Flush failed: -12
>>
>
>
see if you can get grev to reproduce it....
