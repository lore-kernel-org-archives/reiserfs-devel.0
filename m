From: Hans Reiser <reiser@namesys.com>
Subject: I would like to see ReiserFS V3 enter a feature freeze real soon.
Date: Mon, 31 May 2004 09:48:00 -0700
Message-ID: <40BB61C0.5020902@namesys.com>
References: <20040528122854.GA23491@clipper.ens.fr>	 <1085748363.22636.3102.camel@watt.suse.com>	 <1085750828.1914.385.camel@tribesman.namesys.com> <1085751695.22636.3163.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18932-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1085751695.22636.3163.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Vladimir Saveliev <vs@namesys.com>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Andrew Morton <akpm@osdl.org>, Alexander Zarochentcev <zam@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>

While I like and appreciate the data journaling stuff, and I think it 
should go in, real soon now I think we should avoid adding new features 
to V3.  Let the mission critical server folks have a reiserfs version 
that only gets bug fixes added to it, and let V4 be for those who want 
excitement.

Are there any things which Chris and Jeff think should go in besides 
data journaling/ordering and bitmap algorithm changes?

Also, I would like to see some serious benchmarks of the bitmap 
algorithm changes before they go in.  They seem nice in theory, and some 
users liked them for their uses, but that does not make a serious 
scientific study.  Such a study has a high chance of making them even 
better.;-)

zam, I view you as the block allocator maintainer, please review that 
bitmap code from Chris.

Chris and Jeff, can you propose a benchmarking plan for the bitmap code?

Hans


Chris Mason wrote:

>On Fri, 2004-05-28 at 09:27, Vladimir Saveliev wrote:
>
>  
>
>>>The good news is that we tracked this one down recently.  2.6.7-rc1
>>>shouldn't do this anymore.
>>>
>>>      
>>>
>>Just out of curiosity, what was it?
>>    
>>
>
>It was a bug in reiserfs_file_write caused by the data=ordered changes. 
>I was dropping i_sem before changing i_size, and the result was that
>writepage was zeroing out bytes it thought was past the end of the file.
>
>See the recent thread with "1352 NUL bytes at the end of a page?" in the
>subject.  The funny part was that we started getting bug reports for
>this on the suse kernel just a few days before Steven Cole reported it,
>so I was able to overlap some of the bug hunting/testing.
>
>-chris
>
>
>
>
>
>  
>

