From: Chris Mason <mason@suse.com>
Subject: Re: Benchmarks from Guru Labs
Date: 18 Jul 2002 08:24:25 -0400
Message-ID: <1026995065.2486.5.camel@tiny>
References: <20020718115327.GE3841@ariel.karmak.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11044-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020718115327.GE3841@ariel.karmak.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Carmack <karmak@karmak.org>
Cc: reiserfs-list@namesys.com

On Thu, 2002-07-18 at 07:53, Michael Carmack wrote:
> 
> I didn't see any mention of this in the archives. There are some
> ReiserFS benchmarks at
> 
>     http://www.gurulabs.com/ext3-reiserfs.html
> 
> The first set of tests (for small files) show a significant performance
> advantage with 'notail' turned on. Assuming disk space is not an issue,
> are there any performance advantages to 'notail' that are not reflected
> in these tests?

notail is faster in most cases.  With some tail tuning, tails could be
faster for synchronous applications (like mail servers) when the file
size is <= blocksize.  This is because flushing the tail to disk would
be free with flushing the new inode information.

> 
> Also, can anyone comment on why Ext3 has a significant edge over ReiserFS
> in the small-file tests, but the situation reverses as file-size 
> increases? There's not much commentary in the article.

Getting good consistent results out of postmark is tricky.  Notice that
between the 2nd and 3rd tests, he changed 3 different postmark variables
(file size, number of files, number of transactions).

What I can say is that we've been doing performance fixes for reiserfs
for a while now, and some of them are really coming together.  Many will
go into 2.4.20-pre.

-chris




