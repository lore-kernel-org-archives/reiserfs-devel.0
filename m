From: Hans Reiser <reiser@namesys.com>
Subject: Re: Horrible ftruncate performance
Date: Sun, 03 Aug 2003 18:05:27 +0400
Message-ID: <3F2D16A7.3060700@namesys.com>
References: <20030710052931.GA17957@namesys.com>	 <200307111716.56823.Dieter.Nuetzel@hamburg.de>	 <20030711152431.GF17180@namesys.com> <200307111730.50601.m.c.p@gmx.net>	 <20030711154415.GI17180@namesys.com> <1057943343.13317.65.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15130-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1057943343.13317.65.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Oleg Drokin <green@namesys.com>, Marc-Christian Petersen <m.c.p@gmx.net>, Dieter N?tzel <Dieter.Nuetzel@hamburg.de>, Szakacsits Szabolcs <szaka@sienet.hu>, reiserfs-list@namesys.com

Chris Mason wrote:

>On Fri, 2003-07-11 at 11:44, Oleg Drokin wrote:
>  
>
>>Hello!
>>
>>On Fri, Jul 11, 2003 at 05:34:12PM +0200, Marc-Christian Petersen wrote:
>>
>>    
>>
>>>>Actually I did it already, as data-logging patches can be applied to
>>>>2.4.22-pre3 (where this truncate patch was included).
>>>>        
>>>>
>>>>>Maybe it _IS_ time for this _AND_ all the other data-logging patches?
>>>>>2.4.22-pre5?
>>>>>          
>>>>>
>>>>It's Chris turn. I thought it is good idea to test in -ac first, though
>>>>(even taking into account that these patches are part of SuSE's stock
>>>>kernels).
>>>>        
>>>>
>>>Well, I don't think that testing in -ac is necessary at all in this case.
>>>      
>>>
>>May be not. But it is still useful ;)
>>
>>    
>>
>>>I am using WOLK on many production machines with ReiserFS mostly as Fileserver 
>>>(hundred of gigabytes) and proxy caches.
>>>      
>>>
>>I am using this code on my production server myself ;)
>>
>>    
>>
>>>If someone would ask me: Go for 2.4 mainline inclusion w/o going via -ac! :)
>>>      
>>>
>>Chris should decide (and Marcelo should agree) (Actually Chris thought it is good
>>idea to submit data-logging to Marcelo now, too). I have no objections.
>>Also now, that quota v2 code is in place, even quota code can be included.
>>
>>Also it would be great to port this stuff to 2.5 (yes, I know Chris wants this to be in 2.4 first)
>>    
>>
>
>Marcelo seems to like being really conservative on this point, and I
>don't have a problem with Oleg's original idea to just do relocation in
>2.4.22 and the full data logging in 2.4.23-pre4 (perhaps +quota now that
>32 bit quota support is in there).
>
I would like to see it go in more quickly.  I don't like significant 
lags between distro and mainline kernels in principle, and in reiserfs I 
would like to see the V3 code go mostly undisturbed after 2.4.22.  V3 
needs to become zero defect, and only a lack of changes other than 
bugfixes will make that happen.  Dribbling out changes slowly is not 
conducive to being zero defect, and V3 only has a certain window of 
usability anyway before V4 obsoletes it.

Let V3's niche be those who need zero defects, and let V4 be for those 
who want features and performance.

>2.5 porting work has restarted at last, Oleg's really been helpful with
>keeping the 2.4 stuff up to date.
>
>-chris
>
>
>
>
>  
>


-- 
Hans


