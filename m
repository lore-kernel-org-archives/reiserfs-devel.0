From: Spam <spam@tnonline.net>
Subject: Re: [patch] Repacker stats
Date: Sun, 24 Oct 2004 14:52:13 +0200
Message-ID: <713783005.20041024145213@tnonline.net>
References: <200410202159.46110.sikkh@wp.pl>
 <1378615689.20041022193803@tnonline.net>
 <200410231033.29164.christian.mayrhuber@gmx.net> <417A860D.9010701@namesys.com>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22155-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <417A860D.9010701@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com



>> Christian Mayrhuber wrote:

>> On Friday 22 October 2004 19:38, Spam wrote:
>>  
>>
>>>  Hello,
>>>
>>>  I was interested in testing the repacker statistics tool that Piotr
>>>  Neuman wrote (and others later added to). But from what I can see
>>>  the repacker is disabled in 2.6.9-rc4-mm1, because of this patch:
>>>
>>>     
>>>    
>>>
>>>  http://kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.9-rc4/2.6.9-rc4-mm1/broken-out/reiser4-disable-repacker.patch
>>>
>>>
>>>  Is there something wrong with the repacker that is has to be
>>>  disabled?
>>>
>>>  ~S
>>>  
>>>    
>>>
>>
>>Currently the repacker is known to corrupt the filesystem, that's
>>why it's disabled, I guess.
>>
>>  
>>
> There are two reasons:

> 1) functionality that is not stable should be turned off until it is
> stable ("...." and repacker both).

  Turned off, or perhaps better to be marked as unstable or dangerous.
  If it isn't available, no one will test and report problems.

> 2) we aren't making payroll and need something nonessential to bundle
> with support if we want people to buy support so that I am to be able to
> quit my day job and pay people.  There is nothing less essential yet
> still salable than a repacker/resizer.  ext3 had a proprietary resizer,
> so it is not an innovation by us.

  This I do understand very well. It brings my thoughts to Diskepper
  from Executive Software (www.executive.com). Microsoft included a
  basic version of their defrag software into Windows 2000. Users see
  the functionality, but they cannot do much with it other than manual
  defrag. All advanced features usually needed for corporate world is
  only available if you pay to "upgrade" to full version of Diskeeper.

  My suggestion is to leave a basic version of the repacker for normal
  users, and to offer a more advanced and manageable version for
  corporate network and server use? More users will see the
  availability of defrag with Reiser4 and choose it above another fs.
  In the end, probably, more people/companies would buy the extended
  features?

> reiser4 development is going at greatly reduced speed due to our needing
> to take contracts involving other kernel work rather than working on
> reiser4.  I am basically unable to spend time reviewing reiser4 code
> because I have this day job fixing things not related to reiser4 in the
> kernel.  I am glad to have the day job, but getting money from our work
> on reiser4 would be better.....

> I have also asked both the EU and the US for money, wish me luck. I'd
> like to start working on the enhanced semantics for ReiserFS, but I need
> money to do that.  We are losing momentum vs. Apple and MS.  The resizer
> might bring in the money for enhanced semantics work.

  I wish you luck. It would be a shame if you would have to quit the
  work on your filesystems.

  ~S

-- 

