From: Edward Shishkin <edward@namesys.com>
Subject: Re: Reiser4 und LZO compression
Date: Thu, 31 Aug 2006 16:00:47 +0400
Message-ID: <44F6CF6F.5010605@namesys.com>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru>	 <e692861c0608291136j6ae2293cha230575acf6c031d@mail.gmail.com>	 <44F4914A.1010005@slaphack.com> <44F4979E.9020101@namesys.com>	 <44F49D7F.3010403@slaphack.com>	 <0954BE4F-E3A4-4A59-B275-10C1D8DB5101@smartgames.ca>	 <44F4C2C9.3070101@slaphack.com> <op.te3aq1uwcigqcu@apollo13>	 <44F5C1D7.5060904@namesys.com> <44F5C313.40905@namesys.com> <194f62550608310232h3425638dx9876abb7f0f88422@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29764-reiserfs=m.gmane.org@namesys.com>
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
> 
> Will the LZO compression code in reiser4 be able to use multi-processor 
> systems?
> E.g. if I've a Turion-X2 in my laptop will it use 2 threads for
> compression/decompression making cpu throughput much better than
> whatthe disk could do?
> 

Compression is going in flush time and there can be more then
one flush thread that processes the same transaction atom.
Decompression is going in the context of readpage/readpages.
So if you mean per file, then yes for compression and no for
decompression.

Edward.


> lg Clemens
> 
> 
> 2006/8/30, Hans Reiser <reiser@namesys.com>:
> 
>> Edward Shishkin wrote:
>> >
>> > (Plain) file is considered as a set of logical clusters (64K by
>> > default). Minimal unit occupied in memory by (plain) file is one
>> > page. Compressed logical cluster is stored on disk in so-called
>> > "disk clusters". Disk cluster is a set of special items (aka "ctails",
>> > or "compressed bodies"), so that one block can contain (compressed)
>> > data of many files and everything is packed tightly on disk.
>> >
>> >
>> >
>> So the compression unit is 64k for purposes of your benchmarks.
>>
> 
> 

