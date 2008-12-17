From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: The...  reiser4 with no ambiguity
Date: Thu, 18 Dec 2008 00:49:53 +0300
Message-ID: <49497401.40005@gmail.com>
References: <494035ED.4000706@gmx.de> <49404165.6050806@gmail.com> <49405D98.7000402@gmx.de> <4941467B.30308@gmail.com> <49414FC3.1040206@gmx.de> <494157FD.5020708@gmail.com> <ghroan$2e2$1@ger.gmane.org> <49419A90.4020906@gmail.com> <ghu32e$nqp$1@ger.gmane.org> <49440D64.9050900@gmail.com> <gi38gg$56v$1@ger.gmane.org> <49455BB0.7000300@gmail.com> <gi6uhv$akc$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <gi6uhv$akc$1@ger.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralph Ulrich <eulenreich@gmx.de>
Cc: reiserfs-devel@vger.kernel.org

Ralph Ulrich wrote:
> Edward Shishkin Sunday 14 December 2008 20:17:
>   
>>>  I know you stress this quiet often in your mails. Or is it just your
>>>  focussing for now to get reiser4 mainline?
>>> Is it not possible to introduce new extended features in reiser4 and
>>> hide these features vfs?
>>>       
>> Yes, it is possible, but, again, those features should implement
>> some new (optimal, efficient, safe, reliable, etc.) form of data
>> storage.
>>     
>
> I have the idea to rewrite reiser4 code to another
> language

I am a bit disappointed: I wanted to concentrate efforts
on the Linux port..

>  (probably D: has clean syntax, has classes and 
>   
yup, object-oriented means would be a plus.

> garbage collection) and then to have a demon system in
> user space where I can experiment to implement 
> sql - database features. My aim is a winfs (Microsoft)
> like system where you have both a filesystem api 
> and a full featured database.
>
> Could reiser4 fit well to my purpose ?
>   

You might want a high-performance reiser4 storage level
with EOTTL technology.

File plugins and some methods (plug.file) of item plugins
are heavily integrated with the Linux vm subsystem, so you
will need to rewrite them.

> As of now all plugin types have to be "hard-formatted" 
> on the partition. You cannot introduce
> new plugins to an existing filesystem, yes? 
>   

mm.. We can.
There is a notion of compatible development model "4.X.Y":
http://lwn.net/Articles/226251 (Appendix D)
Ask, if something is not clear.

> The first part of my work would be to enable a special place 
> on disk for definitions of used plugins.
>   

Sorry, can not understand the above.

Common notes:
1. As Flex already said, this project will take a lot of
man-hours. I would add it might be of the same order that
was spent for the original Reiser's project.

2. You might want the plugin design document.
I have promised it will be ready in this September..
Sigh.. Coming soon..

Edward.
