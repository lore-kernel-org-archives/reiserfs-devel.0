From: David Masover <ninja@slaphack.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Sun, 04 Sep 2005 11:42:21 -0500
Message-ID: <431B23ED.7070505@slaphack.com>
References: <4317FD1B.504@namesys.com>	 <Pine.GSO.4.44L.0509021620380.23379-100000@unix2.cc.ksu.edu>	 <b14e81f005090318046ee67d7e@mail.gmail.com>	 <431A5E43.4060005@slaphack.com> <431A6E71.4060105@namesys.com> <194f6255050904022932ca34ea@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25859-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <194f6255050904022932ca34ea@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linuxhippy@gmail.com
Cc: reiserfs-list@namesys.com

Clemens Eisserer wrote:
> Well, it sounds a bit like a microsoft manager explaining why XP-Home
> has no terminal server features ;-)
> 
> I think an mkfs-option would be best, with a warning if the value
> given by the user is nonsence (3-8% ok?).

Is there a reason we need to specify this at mkfs time?  What about a 
mount option?

It seems that if you could do this in the kernel source, you could 
certainly do it at mount-time, per-fs.  In other words, it seems that 
it's not something which needs to be specified in the FS format itself.

>>This is a bit arrogant, but I believe that a user that does not know how
>>to recompile the kernel with the #define changed is not sophisticated
>>enough to know how much he is going to hurt his performance by going
>>from 95% to 99% space used, and a user who does not want to bother with
>>recompiling is not going to study the topic enough to realize he is
>>making a mistake 80% of the time.  It is important to know when
>>designing a product when your users intuitions are going to be wrong
>>80%of the time, and while one should always be slow to reach such a
>>conclusion, I think this is such a case.

And yet, there are still plenty of options in the kernel, in mount 
options and in menuconfig, which are dangerous and almost never right.
