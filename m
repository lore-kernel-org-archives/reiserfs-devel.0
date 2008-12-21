From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: The...  reiser4 with no ambiguity
Date: Sun, 21 Dec 2008 16:38:22 +0300
Message-ID: <494E46CE.1050005@gmail.com>
References: <494035ED.4000706@gmx.de> <49404165.6050806@gmail.com> <49405D98.7000402@gmx.de> <4941467B.30308@gmail.com> <49414FC3.1040206@gmx.de> <494157FD.5020708@gmail.com> <ghroan$2e2$1@ger.gmane.org> <49419A90.4020906@gmail.com> <ghu32e$nqp$1@ger.gmane.org> <49440D64.9050900@gmail.com> <gi38gg$56v$1@ger.gmane.org> <49455BB0.7000300@gmail.com> <gi6uhv$akc$1@ger.gmane.org> <49497401.40005@gmail.com> <gidfnq$u7o$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <gidfnq$u7o$1@ger.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralph Ulrich <eulenreich@gmx.de>
Cc: reiserfs-devel@vger.kernel.org

Ralph Ulrich wrote:
> Edward Shishkin Wednesday 17 December 2008 22:49:
>   
>> I am a bit disappointed: I wanted to concentrate efforts
>> on the Linux port..
>>     
>
> I would like to create some kind of reiser4-SDK where 
> more people can easily experiment with reiser4. 
>   

I am skeptical about expediency of the end product,
especially after taking into account its possible high
cost:  why people can not experiment with reiser4,
say, in uml (user mode linux )?

> In my vision reiser4 has a big future as a specialized 
> filesystem: A filesystem where you can add special features/logic/semantics perhaps even dynamicly. 
>   

Imho specialized filesystem is something like ramfs ;)

> I need a different reiser4: A minimal reiser4 "kernel" with 
> common features,  this r4-kernel then loads extensions 
> special to a r4 partition directly from that partition. 
> I mean the defenitions of extensions but also the code 
> of these extensions. So there has to be a common 
> interpreter of such extensions included in a r4-"kernel".
>
>   

> This way every r4-"extended"-partition can serve a 
> different purpose. Eg think of some semantic 
> extensions special to music. Users would mount 
> a specialized r4 partition at
> /home/username/mymusic
> Or for pictures .... etc
>
> I believe reiser4 has a big future with its capabilities 
> in a field of special storage. Think of all the new
> little "iphone" devices. 
>  
>   
>>>  (probably D: has clean syntax, has classes and
>>>       
>> yup, object-oriented means would be a plus.
>>     
> A rewrite would have self-educational purpose for me 
> personally and could have documentation effects 
> (if done proper) for reiser4 in general.
>
>   
>>> Could reiser4 fit well to my purpose ?
>>>       
>> You might want a high-performance reiser4 storage level
>> with EOTTL technology.
>>     
> EOTTL ??
>
>   

yes, "extents on the twig level", the favourite Hans' feature..

>   
>>> The first part of my work would be to enable a special place
>>> on disk for definitions of used plugins.
>>>       
>> Sorry, can not understand the above.
>>     
> See above notes!
>   

Why to not load the "extensions" from a file?
I don't think, that additional formats to store it
on a "low level" is a good idea and the first
issue to resolve...

Edward.
