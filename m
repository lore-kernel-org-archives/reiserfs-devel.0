From: Paolo Correnti <paolunix@yahoo.com>
Subject: Re: R4 won't mount.
Date: Wed, 21 Jan 2004 00:05:22 -0800 (PST)
Message-ID: <20040121080522.85547.qmail@web21507.mail.yahoo.com>
References: <400DE43F.4070502@shaw.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16595-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <400DE43F.4070502@shaw.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris wakefield <c_wakefield@shaw.ca>
Cc: reiserfs-list@namesys.com

Are to trying to mount and old partition or a new
partition ?

I've had problems mounting a Reiser4 partition
(created with last 2003 snapshot) with latest
snapshot.
I had to re-create it and now all is working well.

I'm testing R4 on a laptop (Pemtium 4) and a PC (AMD
Duron) with kernel 2.6.1 and latest Namesys snapshot,
using simple ./configure;make;make install for libaal
and reiser4progs (I mean without options).

Paolo

--- Chris wakefield <c_wakefield@shaw.ca> wrote:
> Hello.
> I'm trying out R4, and I'm having no luck mounting
> the device with the 
> R4 filesystem.
> I've managed to compile libaal from /FIXED/
> (./configure;make;make install).
> reiser4progs-0.4.20 is compiled with:
>  --disable-debug --disable-fnv1-hash
> --disable-rupasov-hash 
> --disable-tea-hash --disable-deg-hash
> --disable-short-keys 
> --disable-specia --with-libaal=/usr/local/lib
> then:  make;make install
> 
> My problem is, that after making a R4 filesystem on
> a partition, it 
> won't mount.  I've tried various options, but still
> doesn't work.
> I wonder if I am missing something?
> I'm running debian testing on an athlon64
> Can someone suggest some options or strategies?
> Thank you,
> Chris w.
> 
> 
> 


__________________________________
Do you Yahoo!?
Yahoo! Hotjobs: Enter the "Signing Bonus" Sweepstakes
http://hotjobs.sweepstakes.yahoo.com/signingbonus
