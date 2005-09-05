From: David Masover <ninja@slaphack.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Mon, 05 Sep 2005 13:20:43 -0500
Message-ID: <431C8C7B.4050409@slaphack.com>
References: <4317FD1B.504@namesys.com>	 <Pine.GSO.4.44L.0509021620380.23379-100000@unix2.cc.ksu.edu>	 <b14e81f005090318046ee67d7e@mail.gmail.com>	 <431A5E43.4060005@slaphack.com> <431A6E71.4060105@namesys.com>	 <194f6255050904022932ca34ea@mail.gmail.com>	 <431B23ED.7070505@slaphack.com> <b14e81f005090505162a15723a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25867-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f005090505162a15723a@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: thenewme91@gmail.com
Cc: linuxhippy@gmail.com, reiserfs-list@namesys.com

michael chang wrote:
> On 9/4/05, David Masover <ninja@slaphack.com> wrote:
> 
>>Clemens Eisserer wrote:
>>
>>>Well, it sounds a bit like a microsoft manager explaining why XP-Home
>>>has no terminal server features ;-)
>>>
>>>I think an mkfs-option would be best, with a warning if the value
>>>given by the user is nonsence (3-8% ok?).
>>
>>Is there a reason we need to specify this at mkfs time?  What about a
>>mount option?
> 
> 
> When maybe we'd need to change the metadata.  Even in ext2/3 you can
> only modify this by "tuning" the fs.
> 
> 
>>>>This is a bit arrogant, but I believe that a user that does not know how
>>>>to recompile the kernel with the #define changed is not sophisticated
>>>>enough to know how much he is going to hurt his performance by going
>>>
>>>>from 95% to 99% space used, and a user who does not want to bother with
>>>
>>>>recompiling is not going to study the topic enough to realize he is
>>>>making a mistake 80% of the time.  It is important to know when
>>>>designing a product when your users intuitions are going to be wrong
>>>>80%of the time, and while one should always be slow to reach such a
>>>>conclusion, I think this is such a case.
> 
> 
> I agree here, and anyone who disagrees is either weird, or lacks
> common sense.

That's not an argument.  As we learned in Philosophy class, that is 
called "begging the question."

I'm betting that a user who wants to tune this and understands what it 
means won't want to have to recompile just to test out a new setting, 
and a user who doesn't understand the mistake they are making probably 
won't be able to change a menuconfig option, a mount option, or a tunefs 
option by themself anyway.  And, if they do, they should realize that it 
can be dangerous and/or stupid to tweak these things -- after all, some 
options still in menuconfig can cause massive fs corruption, and say so.

And, anyone who disagrees with me must lack common sense :P
