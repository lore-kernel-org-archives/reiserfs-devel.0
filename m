From: Chris wakefield <c_wakefield@shaw.ca>
Subject: Re: R4 won't mount.
Date: Wed, 21 Jan 2004 00:23:28 -0800
Message-ID: <400E3700.2090802@shaw.ca>
References: <20040121080522.85547.qmail@web21507.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-16596-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <20040121080522.85547.qmail@web21507.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Paolo Correnti <paolunix@yahoo.com>
Cc: reiserfs-list@namesys.com

Hi Paolo.
Thanks for your reply.  I'm mounting a new reiser4 partition.  I just 
recreated another partition with cfdisk  (not rewriting R4 over the 
previous one) and still won't mount.  I'm getting the usual error 
report:  "mount: wrong fs type, bad option, bad superblock on 
/dev/hda7.....etc"
I also recompiled my 2.6.1 kernel & reiser4progs-0.4.20 as well.
I have noticed that the kernel compile is complaining though, now that I 
think about it I remember the original patching coming up with "hunk  
#1, etc, succeeding, etc and I had about 6 or 8 of those.  I ignored 
them as I assumed the word "succeeding" meant that things went ok.
So my next step will be to repatch a fresh kernel.
Chris W.
 

Paolo Correnti wrote:

>Are to trying to mount and old partition or a new
>partition ?
>
>I've had problems mounting a Reiser4 partition
>(created with last 2003 snapshot) with latest
>snapshot.
>I had to re-create it and now all is working well.
>
>I'm testing R4 on a laptop (Pemtium 4) and a PC (AMD
>Duron) with kernel 2.6.1 and latest Namesys snapshot,
>using simple ./configure;make;make install for libaal
>and reiser4progs (I mean without options).
>
>Paolo
>
>--- Chris wakefield <c_wakefield@shaw.ca> wrote:
>  
>
>>Hello.
>>I'm trying out R4, and I'm having no luck mounting
>>the device with the 
>>R4 filesystem.
>>I've managed to compile libaal from /FIXED/
>>(./configure;make;make install).
>>reiser4progs-0.4.20 is compiled with:
>> --disable-debug --disable-fnv1-hash
>>--disable-rupasov-hash 
>>--disable-tea-hash --disable-deg-hash
>>--disable-short-keys 
>>--disable-specia --with-libaal=/usr/local/lib
>>then:  make;make install
>>
>>My problem is, that after making a R4 filesystem on
>>a partition, it 
>>won't mount.  I've tried various options, but still
>>doesn't work.
>>I wonder if I am missing something?
>>I'm running debian testing on an athlon64
>>Can someone suggest some options or strategies?
>>Thank you,
>>Chris w.
>>
>>
>>
>>    
>>
>
>
>__________________________________
>Do you Yahoo!?
>Yahoo! Hotjobs: Enter the "Signing Bonus" Sweepstakes
>http://hotjobs.sweepstakes.yahoo.com/signingbonus
>
>  
>

