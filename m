From: Hans Reiser <reiser@namesys.com>
Subject: Re: NFS setup for a reiserfs-based /home
Date: Wed, 25 Sep 2002 22:25:41 +0400
Message-ID: <3D91FFA5.9010909@namesys.com>
References: <20020924215756.GA24963@jerry.marcet.dyndns.org> <20020925114009.B23339@namesys.com> <200209251533.19567.Dieter.Nuetzel@hamburg.de> <20020925173718.A17138@namesys.com> <20020925154626.S32363@noris.de> <20020925175128.A3477@namesys.com> <20020925160957.U32363@noris.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11541-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthias Urlichs <smurf@noris.de>
Cc: Oleg Drokin <green@namesys.com>, Dieter N?tzel <Dieter.Nuetzel@hamburg.de>, Javier Marcet <jmarcet@pobox.com>, reiserfs-list <reiserfs-list@namesys.com>

Matthias Urlichs wrote:

>Hi,
>
>Oleg Drokin:
>  
>
>>This is just matter of truest, if you trust the binary closed source firmware
>>from such a device, that it will handle failures and this kind of stuff
>>correctly, go for it.
>>With Linux' softraid paranoid people can verify their own worst assumptions by
>>just reading source code ;)
>>
>>    
>>
>Well, Linux' softraid doesn't handle some things at all well, either...
>as I noticed the hard way. A bug report to the softraid people will be
>written, and it will NOT be pretty.
>
>  
>
Yes, I believe this.  RAID is risky whether closed or open, there are a 
lot of not so well done implementations.  With hardware RAID the thing 
to worry about is, does it eventually write its caches out to disk. 
 Yes, there are some that do not, and then the battery fails and 6 month 
old data goes poof, resulting in a support call in which we tell a 
sysadmin the sad story of how fsck does not work if there is nothing on 
disk, and no it is not reiserfs it is the hardware RAID that made it go 
poof, and then they go back to the large established vendor and sure 
enough do confirm that it is a known bug....

Hans


