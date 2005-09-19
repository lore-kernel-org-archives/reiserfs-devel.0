From: "Marc Perkel" <marc@perkel.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Mon, 19 Sep 2005 06:45:25 +0200
Message-ID: <000101c5bcd4$f37818f0$0300a8c0@intra.lexbox.org>
References: <200509182004.j8IK4JNx012764@inti.inf.utfsm.cl> <432DCE2A.5070705@slaphack.com> <432DDF7A.3050704@teleformix.com> <op.sxbtg9lzth1vuj@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26054-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <op.sxbtg9lzth1vuj@localhost>
Sender: <linux-kernel-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: unlisted-recipients, , no To-header on input, IMB Recipient 1 <mspop3connector.david.sanchez@lexbox.fr>
Cc: LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>



PFC wrote:

>
>
>> I'm of the same opinion.  If I have hardware that has a problem, and  
>> causes downtime, it gets replaced or repaired.  I don't switch to a  
>> different piece of software to compensate for broken hardware.
>>
>> With that said, I have seen ReiserFS expose hardware that had 
>> problems.   Hardware was repaired, and ReiserFS rides again.
>
>
>

Agreed - if the hardware has problem and anything is readable I'm happy. 
When I was sysadmin at EFF we got a bunch of IBM Deathstar drives - and 
for those who experiences this - every one of them fails. But they 
usually fail slowly. What amazed me was I would stat to see seek errors 
- sector not found and I would copy off everything I could onto a new 
drive before I lost anything. And - I thought it was amazing that I 
usually managed to get all the important stuff. So - I give reiser 
credit for being somewhat resiliant.

here's the way I see it. This isn't like Hans Reiser is some unknown guy 
who has some wild idea that we all don't know. ReiserFS is a majoy 
player in the Linux world and many people like it the best. Several 
distros use Reiser as their default install. So to me this gives him 
more than average standing and the way I see it - there has to be a good 
reason to NOT merge it rather than a reason TO merge it.

So - is Reiser4 going to break anything? If not - what is the reason to 
not do it?

-- 
Marc Perkel - marc@perkel.com

Spam Filter: http://www.junkemailfilter.com
    My Blog: http://marc.perkel.com

