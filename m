From: Hans Reiser <reiser@namesys.com>
Subject: Re: Horrible ftruncate performance
Date: Wed, 23 Jul 2003 10:14:18 +0400
Message-ID: <3F1E27BA.3070603@namesys.com>
References: <Pine.LNX.4.30.0307151407100.6563-100000@divine.city.tvnet.hu>	 <200307151848.59027.Dieter.Nuetzel@hamburg.de>	 <20030715170540.GA1213@namesys.com>  <3F1D69AC.5040302@namesys.com>	 <1058892649.5042.29.camel@tiny.suse.com>  <3F1D7DD8.3010806@namesys.com> <1058898249.2749.2.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14993-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1058898249.2749.2.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Oleg Drokin <green@namesys.com>, Dieter N?tzel <Dieter.Nuetzel@hamburg.de>, Szakacsits Szabolcs <szaka@sienet.hu>, Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>, reiserfs-list@namesys.com

Chris Mason wrote:

>On Tue, 2003-07-22 at 14:09, Hans Reiser wrote:
>
>  
>
>>>It's important to remember that releasing v4 doesn't automatically
>>>convert all existing v3 users to it.  This is the kind of thing we
>>>should try to fix without making major design changes to v3.  It's at
>>>least worth talking about, "use v4" can't always be the answer.
>>>
>>>      
>>>
>>V3 is in feature freeze.   Unfortunately, determining what is a feature 
>>and what is a bug is a process based not just on the user experience, 
>>but on the structure of the code.  The proper fix for this bug is to add 
>>a feature called extents.   This  belongs in, and is in, V4.  V4 will be 
>>available very soon.
>>
>>Adding features, like new kinds of items, will disturb the stability of 
>>V3.  V3 needs to be zero defect.  It is now in a phase in its lifetime 
>>where conservatism is appropriate.
>>
>>    
>>
>
>Heh, everything needs to be zero defect ;-)  But I completely agree
>about not adding new item types or other format changes.  Still,
>non-extent filesystems can create holes faster than we can,
>
by using a format that is better designed for large holes....

> so it is
>worth talking about ways to fix it (within the constraints of existing
>code).
>
>-chris
>
>
>
>
>  
>

V4 is going out for outside testers this week.  It blows v3 away in 
performance, space usage, well structured code, scalability, features, 
everything really.  The only reason to use V3 is that it is highly debugged.

V4 is a nice example of what you can't easily do incrementally (unless, 
of course, you have the plugin infrastructure V4 has.;-) ).

-- 
Hans


