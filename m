From: Toby Thain <toby@smartgames.ca>
Subject: Re: reiserfs performance on ssd
Date: Thu, 27 Apr 2006 12:20:33 -0400
Message-ID: <BAYC1-PASMTP050C1EF12709BADAABFDBEBFBD0@CEZ.ICE>
References: <20060427151655.8b771812.pegasus@nerv.eu.org> <20060427134702.GA8202@favonius> <e692861c0604270728p2aa4a4e0i70d1ad43a3da2fcf@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v749.3)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28535-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e692861c0604270728p2aa4a4e0i70d1ad43a3da2fcf@mail.gmail.com>
Message-Id: <4913EB32-526F-4212-82AB-56DE04A43763@smartgames.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Gregory Maxwell <gmaxwell@gmail.com>
Cc: reiserfs-list@namesys.com


On 27-Apr-06, at 10:28 AM, Gregory Maxwell wrote:

> On 4/27/06, Sander <sander@humilis.net> wrote:
>>> I have a simple solid state disk to play with here.
>>> See http://nerv.eu.org/iram/
>>
>> Interesting review, thanks.
>>
>> To get better reliability you could raid1 them.
>> I guess this is a 'must' anyway when used in servers (just like with
>> harddisks).
>>
>> Have to try this product myself..
>
> Because they have no ECC most failures will just be completely silent
> data corruption.
> A sadly useless device.

Sure ECC would be nice, but how does this differ from disk? Silent  
failures are certainly possible.

The fact that error detection and propagation doesn't really happen  
in modern disk subsystems is why systems like Sun's ZFS are coming  
into being.

--T
