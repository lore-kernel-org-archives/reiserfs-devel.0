From: Grzegorz Kulewski <kangur@polcom.net>
Subject: Re: why does reiserfs list get so much spam?
Date: Fri, 16 Sep 2005 16:00:19 +0200 (CEST)
Message-ID: <Pine.LNX.4.63.0509161552090.21130@alpha.polcom.net>
References: <432A9BFD.10700@mch.one.pl> <20050916104129.GA11025@kruemel>
 <432AA409.5070006@interia.pl> <Pine.LNX.4.63.0509161259560.21130@alpha.polcom.net>
 <432AAA38.9000102@mch.one.pl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25988-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <432AAA38.9000102@mch.one.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Tomasz Chmielewski <mangoo@mch.one.pl>
Cc: reiserfs-list@namesys.com

On Fri, 16 Sep 2005, Tomasz Chmielewski wrote:

> Grzegorz Kulewski schrieb:
>>  On Fri, 16 Sep 2005, Tomasz Chmielewski wrote:
>> 
>> >  Ingo Bormuth schrieb:
>> > 
>> > >   On 2005-09-16 12:18, Tomasz Chmielewski wrote:
>> > > 
>> > > >  When I look at the archives, the first impression is that 90% of 
>> > >  posts on > the list are spam messages...
>> > > >  Can't you do something about that?
>> > > 
>> > > 
>> > >   Locally I pipe all mail through spamassassin and hardly see any spam.
>> > >   I think that should also be applicable for the archive (which really 
>> > >   is
>> > >   hard to read by now).
>> > 
>> > 
>> >  The real reason is that it allows posts from non-registered users...
>> >  This should really be fixed.
>> >  Spam in the archive looks lame :)
>> > 
>> >  I just sent this mail from an email which I never registered to 
>> >  send/receive mail from this list.
>>
>>
>>  Don't do that. *Many* people subscribed to LKML are posting here and often
>>  Namesys people CC this list in their posts. This way replies to such posts
>>  will be lost. It will cause major pain in following such threads.
>>
>>  Instead there are really good techniques to fight spam while not causing
>>  harm to legitimate users. For example checking if sending host is allowed
>>  to post mails from specified domain, different bayes filters (including
>>  adaptive ones), graylisting and so on. I will bet that only first of these
>>  ideas will kill 50% of spam here (including this from *polcom.net that I
>>  reported to Hans several months ago - of course this spam does not come
>>  from our servers but is using fake domain - easy to filter out).
>
> yeah, but it is to be used by the end-user.

No - it should be filtered at the moment of delivery to mail list software 
before going to subscribed users or to archive. It is done in this way on 
LKML and on all other lists. It is done on this list too but something is 
probably misconfigured or not configured good enough.


> the archive will be still filled with spam.

No. Why? Spam should be dead before it is going anywhere from the list 
(including all potential archives).


> not everyone who wants to know about reiser subscribes to the list; most of 
> the people would just use the archives.

... or are posting or CCing this list without being subscribed

Exactly, so we should not limit posting to only subscribed users. I know 
that some stupid lists are doing so (for example acpi list IIRC) but this 
is pain for me (I am not subscribed) when I want to report yet another 
problem with acpi on my system or when I am replying to thread that is 
CCd to acpi list.


Grzegorz Kulewski
