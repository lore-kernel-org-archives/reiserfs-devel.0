From: Hans Reiser <reiser@namesys.com>
Subject: Re: Can compression at filesystem level improve overall	performance?
Date: Mon, 22 Mar 2004 23:04:40 +0300
Message-ID: <405F46D8.1040607@namesys.com>
References: <405B02ED.4010602@solidcode.net>	 <1079713790.9729.1.camel@redeeman.linux.dk>	 <16475.9613.375262.677576@laputa.namesys.com> <1079978427.4658.63.camel@localhost.localdomain>
Reply-To: reiser@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17385-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1079978427.4658.63.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Scott Young <youngs1@sunyit.edu>
Cc: reiserfs-list@namesys.com, Edward Shishkin <edward@namesys.com>

Scott Young wrote:

>>That's common misconception. :)
>>
>>The goal of compression is to conserve disk bandwidth rather than space.
>>
>>By compressing it is possible to transfer data (== uncompressed data
>>user works with), at a rate higher than raw device bandwidth.
>>    
>>
>
>I will be doing some research on an algorithm that speeds up data
>transfers over a network by adaptively selecting a compression
>algorithm.  It can be applied to filesystem reads and writes too.  When
>the send queue is reasonably full on the server, it starts compressing
>data at the tail of the queue while sending the data at the head of the
>queue.  If the output stream catches up to segment currently being
>compressed, then that segment is sent uncompressed.  If the compressed
>data is not significantly smaller, then the uncompressed data is sent
>instead.  For network applications that are not network interface bound
>(like rsync over a 100mbit connection), the buffer will be empty most of
>the time and therefore little compression would be needed or wanted as
>it would only slow the application down.  Compression is chosen from a
>pool of algorithms and varied depending on the history of buffer
>overflows and under-runs.  Slower, better compression algorithms are
>used when the buffer is mostly full and the compression is observably
>effective.  The idea here is to minimize the time between the client
>requesting the data and having the usable data in a minimal amount of
>time.  This can be seen as a time-verses-amount-of-usable-data-on-client
>graph, and some applications prefer a low latency for the initial stream
>of data (such as a web page) whereas some prefer the time to retrieve a
>very large piece of data (such as scp scott@1.2.3.4/SomeBigDocument.sxw
>/home/scott over a 56k modem).
>
>Adapting this to filesystem concepts, the server can be seen as the
>write process and the client can be seen as the read process. 
>
I don't understand.  Why not view the client as the disk drive and the 
bus as the network?

> The idea
>can be applied to Reiser4 by compressing the overwrite set while the
>journal data is being written, and then compressing the tail of the
>relocate set moving backwards until the write stream catches up to the
>compression.  It could also take into account the estimated
>decompression time when reading the data back, and use it for deciding
>whether the compression ratio is good enough to write the compressed
>data instead of the uncompressed data.
>  
>
I didn't understand the above.

>Another interesting twist would be to cache the compressed data if the
>same data is going to be sent from the server several times.  This
>reduces CPU overhead on the server (and possibly it's memory
>requirements for caching the data, and reduces the amount of data that
>needs to be read from the drive), but it is complicated in the context
>of a network algorithm and is mostly application-dependent.  This is
>research for another day, maybe in the form of a derived-data plugin for
>ReiserFS where an application tells the filesystem how to construct the
>file, and the filesystem can store the original, the result, or both,
>depending on space needs and performance analysis, with copy-on-write
>metadata flags when appropriate.
>  
>
I didn't understand the above.

>I haven't started coding the adaptive compression algorithm yet, but I
>have a general idea about how I am going to implement it.  For the
>proof-of-concept, I want to write this using sockets and some basic
>library compression algorithms (gzip, bzip2, and maybe a simple MTF +
>Adaptive Huffman).  Later variants may work with TCP or other protocols
>around that layer.  Any suggestions will be appreciated.
>  
>
I think we need to use adaptive compression in Reiser4, based on the 
type of file being compressed,  and anyone who finds it interesting to 
develop heuristics for selecting compression strategies is welcome to 
help and join the fun.

>
>Scott Young
>
>
>
>
>
>
>  
>


-- 
Hans

