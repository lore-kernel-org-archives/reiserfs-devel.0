From: Hans Reiser <reiser@namesys.com>
Subject: Re: random minor benchmark: Re: Copy 20 tarfiles: ext2 vs (reiser4,
 unixfile) vs (reiser4,cryptcompress)
Date: Fri, 27 Jan 2006 00:41:59 -0800
Message-ID: <43D9DCD7.3090600@namesys.com>
References: <43D7C6BE.1010804@namesys.com> <43D7CA7F.4010502@namesys.com> <20060126153343.GH4311@suse.de> <43D91225.3030605@namesys.com> <20060126185612.GM4311@suse.de> <43D933EB.6080009@namesys.com> <20060127080625.GS4311@suse.de> <43D9D681.7020002@namesys.com> <20060127082113.GV4311@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751228AbWA0ImD@vger.kernel.org>
In-Reply-To: <20060127082113.GV4311@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@suse.de>
Cc: Edward Shishkin <edward@namesys.com>, LKML <linux-kernel@vger.kernel.org>, Reiserfs mail-list <Reiserfs-List@namesys.com>

Jens Axboe wrote:

>
>Yeah and that's ok, I was just interested in seeing some more
>interesting compression benchmarks so I wondered if you had done that.
>
>  
>
I think "random minor benchmark" was an apt description, yes.;-)

First we will debug it fully. Then we will figure out how to change
mongo so that the files do not consist entirely of the letter a as their
contents, and run mongo on it. Probably we will find some way to slice
up a linux kernel tar file into files of random sizes, and assume that
is a fair thing to let it compress during mongo. Then, just so people
won't think mongo is slanted in our favor we will do some cp -r's of
large numbers of linux kernel source trees and time that also.

Hans
