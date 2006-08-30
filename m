From: PFC <lists@peufeu.com>
Subject: Re: Reiser4 und LZO compression
Date: Wed, 30 Aug 2006 11:17:15 +0200
Message-ID: <op.te3aq1uwcigqcu@apollo13>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru> <20060828173721.GA11332@hello-penguin.com> <44F332D6.6040209@namesys.com> <1156801705.2969.6.camel@nigel.suspend2.net> <20060829045937.GA9181@localhost.hsdv.com> <op.te1sixuycigqcu@apollo13> <20060829143814.GA21868@hello-penguin.com> <op.te1yjbp7cigqcu@apollo13> <44F47FEB.9060005@namesys.com> <44F4880C.3050507@slaphack.com> <e692861c0608291136j6ae2293cha230575acf6c031d@mail.gmail.com> <44F4914A.1010005@slaphack.com> <44F4979E.9020101@namesys.com> <44F49D7F.3010403@slaphack.com> <0954BE4F-E3A4-4A59-B275-10C1D8DB5101@smartgames.ca> <44F4C2C9.3070101@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29752-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44F4C2C9.3070101@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>


> Maybe, but Reiser4 is supposed to be a general purpose filesystem
> talking about its advantages/disadvantages wrt. gaming makes sense,

	I don't see a lot of gamers using Linux ;)
	But yes, gaming is what pushes hardware development these days, at least  
on the desktop.

	Also, as you said, gamers (like many others) reinvent filesystems and  
generally use the Big Zip File paradigm, which is not that stupid for a  
read only FS (if you cache all file offsets, reading can be pretty fast).  
However when you start storing ogg-compressed sound and JPEG images inside  
a zip file, it starts to stink.

	***************************

> Does the CPU power necessary to do the compression cost more or less  
> than another drive?

	***************************

	It depends, you have to consider several distinct scenarios.
	For instance, on a big Postgres database server, the rule is to have as  
many spindles as you can.
	- If you are doing a lot of full table scans (like data mining etc), more  
spindles means reads can be parallelized ; of course this will mean more  
data will have to be decompressed.
	- If you are doing a lot of little transactions (web sites), it means  
seeks can be distributed around the various disks. In this case  
compression would be a big win because there is free CPU to use ; besides,  
it would virtually double the RAM cache size.

	You have to ponder cost (in CPU $) of compression versus the cost in  
"virtual RAM" saved for caching and the cost in disks not bought.

	***************************

> Do the two processors have separate caches, and thus being overly fined
> grained makes you memory transfer bound or?

	It depends on which dual core system you use ; future systems (like Core)  
will definitely share cache as this is the best option.

	***************************

	If we analyze the results of my little compression benchmarks, we find  
that :
	- gzip is way too slow.
	- lzo and lzf are pretty close.

	LZF is faster than LZO (especially on decompression) but compresses worse.
	So, when we are disk-bound, LZF will be slower.
	When we are CPU-bound, LZF will be faster.

	The differences are not that huge, though, so it might be worthwile to  
weight this against the respective code cleanliness, of which I have no  
idea.

	However my compression benchmarks mean nothing because I'm compressing  
whole files whereas reiser4 will be compressing little blocks of files. We  
must therefore evaluate the performance of compressors on little blocks,  
which is very different from 300 megabytes files.
	For instance, the setup time of the compressor will be important (wether  
some huffman table needs to be constructed etc), and the compression  
ratios will be worse.

	Let's redo a benchmark then.
	For that I need to know if a compression block in reiser4 will be either :
	- a FS block containing several files (ie. a block will contain several  
small files)
	- a part of a file (ie. a small file will be 1 block)

	I think it's the second option, right ?


	
