From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Reiser4 und LZO compression
Date: Tue, 29 Aug 2006 06:05:15 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0608290603330.8045@yvahk01.tjqt.qr>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru>  <44F322A6.9020200@namesys.com>
 <20060828173721.GA11332@hello-penguin.com>  <44F332D6.6040209@namesys.com>
 <1156801705.2969.6.camel@nigel.suspend2.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29718-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1156801705.2969.6.camel@nigel.suspend2.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nigel Cunningham <ncunningham@linuxmail.org>
Cc: Edward Shishkin <edward@namesys.com>, Stefan Traby <stefan@hello-penguin.com>, Hans Reiser <reiser@namesys.com>, Alexey Dobriyan <adobriyan@gmail.com>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org, Andrew Morton <akpm@osdl.org>

>> >>Hmm.  LZO is the best compression algorithm for the task as measured by
>> >>the objectives of good compression effectiveness while still having very
>> >>low CPU usage (the best of those written and GPL'd, there is a slightly
>> >>better one which is proprietary and uses more CPU, LZRW if I remember
>> >>right.  The gzip code base uses too much CPU, though I think Edward made
>> > 
>> > I don't think that LZO beats LZF in both speed and compression ratio.
>> > 
>> > LZF is also available under GPL (dual-licensed BSD) and was choosen in favor
>> > of LZO for the next generation suspend-to-disk code of the Linux kernel.
>> > 
>> > see: http://www.goof.com/pcg/marc/liblzf.html
>> 
>> thanks for the info, we will compare them
>
>For Suspend2, we ended up converting the LZF support to a cryptoapi
>plugin. Is there any chance that you could use cryptoapi modules? We
>could then have a hope of sharing the support.

I am throwing in gzip: would it be meaningful to use that instead? The 
decoder (inflate.c) is already there.

06:04 shanghai:~/liblzf-1.6 > l configure*
-rwxr-xr-x  1 jengelh users 154894 Mar  3  2005 configure
-rwxr-xr-x  1 jengelh users  26810 Mar  3  2005 configure.bz2
-rw-r--r--  1 jengelh users  30611 Aug 28 20:32 configure.gz-z9
-rw-r--r--  1 jengelh users  30693 Aug 28 20:32 configure.gz-z6
-rw-r--r--  1 jengelh users  53077 Aug 28 20:32 configure.lzf


Jan Engelhardt
-- 
