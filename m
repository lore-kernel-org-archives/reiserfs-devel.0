From: Voicu Liviu <pacman@mscc.huji.ac.il>
Subject: Re: Horrible ftruncate performance
Date: Wed, 23 Jul 2003 08:49:59 +0300
Message-ID: <3F1E2207.3080409@mscc.huji.ac.il>
References: <Pine.LNX.4.30.0307151407100.6563-100000@divine.city.tvnet.hu> <200307151848.59027.Dieter.Nuetzel@hamburg.de> <20030715170540.GA1213@namesys.com> <3F1D69AC.5040302@namesys.com> <1058892649.5042.29.camel@tiny.suse.com> <3F1D7DD8.3010806@namesys.com> <1058898249.2749.2.camel@tiny.suse.com> <20030723001645.GB8032@namesys.com> <3F1E2A54.5080805@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14995-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F1E2A54.5080805@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, Chris Mason <mason@suse.com>, Dieter N?tzel <Dieter.Nuetzel@hamburg.de>, Szakacsits Szabolcs <szaka@sienet.hu>, Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>, reiserfs-list@namesys.com

Hans Reiser wrote:
> Oleg Drokin wrote:
> 
>> Hello!
>>
>> On Tue, Jul 22, 2003 at 02:24:09PM -0400, Chris Mason wrote:
>>
>>  
>>
>>> Heh, everything needs to be zero defect ;-)  But I completely agree
>>> about not adding new item types or other format changes.  Still,
>>> non-extent filesystems can create holes faster than we can, so it is
>>> worth talking about ways to fix it (within the constraints of existing
>>> code).
>>>   
>>
>>
>> Yeah, we really can insert items with the actual data in the tree
>> (as I already discussed with Chris). (No, not one item per one pointer,
>> that will be messy). That should work, I think.
>>
>> No, that won't hurt reiser4, because the key strenght of the reiser4 
>> is the
>> throughput and online repacker.
>>
> Online repacker is not the key strength, but it is a quite nice feature 
> that accentuates the other strengths.

Then what is the key strength? Or better to ask, how does V4 differs 
from V3?
Best regards,
Liviu

>> Today the Linus have proclaimed that he really needs the online 
>> repacker because
>> he got tired by inter-file fragmentation (as opposed to in-file
>> fragmentation) and he really looks forward for someone who
>> can deliwer XP-like feature of grouping data
>> based on the previous read-patterns.
>>
> that is a very nice feature, it is indeed quite important, and it also a 
> major work item that we have no sponsor for.  Unfortunately, it is a 
> non-focused feature (it helps everyone), and getting it sponsored will 
> be hard.
> 
>>
>> Bye,
>>    Oleg
>>
>>
>>  
>>
> 
> 


-- 
Voicu Liviu
Rothberg International School
Computation center, Mount Scopus
Hebrew University of Jerusalem
Tel: 972(2)-5881253
E-mail: pacman@mscc.huji.ac.il

System Operating: Linux Gentoo1.4 ( www.gentoo.org )

Click here to see my GPG signature:
	http://search.keyserver.net:11371/pks/lookup?template=netensearch%2Cnetennomatch%2Cnetenerror&search=pacman%40mscc.huji.ac.il&op=vindex&fingerprint=on&submit=Get+List


