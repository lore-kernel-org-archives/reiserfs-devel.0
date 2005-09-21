From: Edward Shishkin <edward@namesys.com>
Subject: Re: Compression Plugin
Date: Wed, 21 Sep 2005 15:56:21 +0400
Message-ID: <43314A65.3060009@namesys.com>
References: <433017C1.4050408@gmail.com> <43307E49.8060404@slaphack.com> <e692861c05092015364a887a44@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26205-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e692861c05092015364a887a44@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: gmaxwell@gmail.com
Cc: David Masover <ninja@slaphack.com>, Clay Barnes <clay.barnes@gmail.com>, reiserfs-list@namesys.com

Gregory Maxwell wrote:

>On 9/20/05, David Masover <ninja@slaphack.com> wrote:
>  
>
>>Probably lzo, which is already used for other things like network
>>connections (ssh, openvpn, and so on).  The nice thing about lzo is that
>>it's fast, faster than gzip or bzip2, and gets decent compression -- not
>>great, but decent.  I don't usually get gzip or bzip2 to compress at
>>disk speed, but then, I usually crank the compression way up, so YMMV.
>>The point of using a fast algorithm is that you not only save space, but
>>when you apply it to things like text files, it can actually make things
>>go faster.
>>
>>But I imagine it will be settable per-file.  Files can be both encrypted
>>and compressed, and I think (I hope) it could be with a choice of
>>crypto/compression algorithms.
>>    
>>
>
>I didn't know SSH supported LZO.  Rsync does though...
>
>Gzip compression is pretty darn quick at lower levels, though
>depending on the lz77 implimentaiton it can be fairly slow at higher
>compression levels.
>
>An interesting idea:  select the algo and a range of compression
>levels per file, but select the actual compression level at flush time
>based on some estimate of how loaded the system is.. :)
>  
>

Compression level usually means a separate algorithm of some family and
should be represented by separate transform plugin. It is possible to assign
_any_ compression transform plugin id once in flush time when the file 
is newly
created, but I am not sure if it should depend on the current snapshot 
of system
monitoring.
  However, it will be possible to turn a compression off for a file in 
any time
you want. Reiser4 deflate manager will call the compression mode plugin 
which
represents some policy in such switching. The default policy will be the one
suggested by Hans: if the first cluster of a file is incompressible, 
then turn
it off. One can invent and add new policies.

>Probably not worth it even though the amount of compression and the
>speed differ greatly from -1 to -9... I hope no one wastes their time
>on it until the more important things are done.. but perhaps a nice
>touch.
>  
>
