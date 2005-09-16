From: Grzegorz Kulewski <kangur@polcom.net>
Subject: Re: why does reiserfs list get so much spam?
Date: Fri, 16 Sep 2005 13:08:23 +0200 (CEST)
Message-ID: <Pine.LNX.4.63.0509161259560.21130@alpha.polcom.net>
References: <432A9BFD.10700@mch.one.pl> <20050916104129.GA11025@kruemel>
 <432AA409.5070006@interia.pl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25980-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <432AA409.5070006@interia.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Tomasz Chmielewski <mangoo@interia.pl>
Cc: reiserfs-list@namesys.com

On Fri, 16 Sep 2005, Tomasz Chmielewski wrote:

> Ingo Bormuth schrieb:
>>  On 2005-09-16 12:18, Tomasz Chmielewski wrote:
>> 
>> > When I look at the archives, the first impression is that 90% of posts on 
>> > the list are spam messages...
>> > Can't you do something about that?
>>
>>
>>  Locally I pipe all mail through spamassassin and hardly see any spam.
>>  I think that should also be applicable for the archive (which really is
>>  hard to read by now).
>
> The real reason is that it allows posts from non-registered users...
> This should really be fixed.
> Spam in the archive looks lame :)
>
> I just sent this mail from an email which I never registered to send/receive 
> mail from this list.

Don't do that. *Many* people subscribed to LKML are posting here and often 
Namesys people CC this list in their posts. This way replies to such 
posts will be lost. It will cause major pain in following such threads.

Instead there are really good techniques to fight spam while not causing 
harm to legitimate users. For example checking if sending host is allowed 
to post mails from specified domain, different bayes filters (including 
adaptive ones), graylisting and so on. I will bet that only first of these 
ideas will kill 50% of spam here (including this from *polcom.net that I 
reported to Hans several months ago - of course this spam does not come 
from our servers but is using fake domain - easy to filter out).


Grzegorz Kulewski
