From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser4 und LZO compression
Date: Thu, 31 Aug 2006 14:22:17 -0500
Message-ID: <44F736E9.1000101@slaphack.com>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru>	 <e692861c0608291136j6ae2293cha230575acf6c031d@mail.gmail.com>	 <44F4914A.1010005@slaphack.com> <44F4979E.9020101@namesys.com>	 <44F49D7F.3010403@slaphack.com>	 <0954BE4F-E3A4-4A59-B275-10C1D8DB5101@smartgames.ca>	 <44F4C2C9.3070101@slaphack.com> <op.te3aq1uwcigqcu@apollo13>	 <44F5C1D7.5060904@namesys.com> <44F5C313.40905@namesys.com> <194f62550608310232h3425638dx9876abb7f0f88422@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29769-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <194f62550608310232h3425638dx9876abb7f0f88422@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Clemens Eisserer <linuxhippy@gmail.com>
Cc: reiserfs-list@namesys.com

Clemens Eisserer wrote:
>> But speaking of single threadedness, more and more desktops are shipping
>> with ridiculously more power than people need.  Even a gamer really
> Will the LZO compression code in reiser4 be able to use multi-processor 
> systems?

Good point, but it wasn't what I was talking about.  I was talking about 
the compression happening on one CPU, meaning even if it takes most of 
the CPU to saturate disk throughput, your other CPU is still 100% 
available, meaning the typical desktop user won't notice their apps 
running slower, they'll just notice disk access being faster.

