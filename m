From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Question on IICACHE and mount info (2.4.19-pre5)
Date: Mon, 08 Apr 2002 14:45:58 +0200
Message-ID: <3CB19106.90401@mb.tu-ilmenau.de>
References: <3CACE903.30901@mb.tu-ilmenau.de> <20020405090248.A6915@namesys.com> <3CB182B0.4030009@mb.tu-ilmenau.de> <20020408160226.A937@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 04/08/2002 02:02 PM, Oleg Drokin wrote:

> Hello!
> 
> On Mon, Apr 08, 2002 at 01:44:48PM +0200, Manuel Krause wrote:
> 
> 
[...]
> Noborder is evil right now, don't use it if you are not sure what are you
> doing ;)


O.k., _then_ I should not use it! :-))

[...]
> Hm, things are not so good here.
> 
> Too bad you do not have any file-size distribution statistics.


Is there an easy way to get this info from the filesystems?

>>Yes, I have differences. But I think they're not the ones we wanted to 
>>see?! I double checked the lines I pasted to this email ;-)
>>
> 
> I believe right now we have better patches to speed-up things both on read
> (IDE only) and write that we are testing mostly locally.


Could you make them available on the namesys server? ;-)


> iicache only speedups some reads on large files (I have not looked at
> new iicache write support yet, so my observations are only can be applied 
> up to iicache-9 patch)
> 
> Bye,
>     Oleg

Thanks,

Manuel



