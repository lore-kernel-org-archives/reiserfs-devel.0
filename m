From: Hans Reiser <reiser@namesys.com>
Subject: Re: I oppose Chris and Jeff's patch to add an unnecessary additional
 namespace to ReiserFS
Date: Tue, 27 Apr 2004 10:29:19 -0700
Message-ID: <408E986F.90506@namesys.com>
References: <1082750045.12989.199.camel@watt.suse.com> <408D3FEE.1030603@namesys.com> <20040426203314.A6973@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18248-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040426203314.A6973@infradead.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christoph Hellwig <hch@infradead.org>
Cc: Chris Mason <mason@suse.com>, Linus Torvalds <torvalds@osdl.org>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, akpm@osdl.org



Christoph Hellwig wrote:

>On Mon, Apr 26, 2004 at 09:59:26AM -0700, Hans Reiser wrote:
>  
>
>>The xattr namespace offers zero functional advantage over the file 
>>namespace.  The use of '.' instead of '/' is idiotic, see the very short 
>>paper "The Hideous Name" by Rob Pike  ( www.cs.bell-labs.com/cm/cs/doc/ 
>>) for why mindlessly varying the separators in hierarchical names 
>>throughout an OS is a bad idea. 
>>    
>>
>
>Hans, where have you been the last three years?  Hiding under a rock?
>
>  
>

>As for ACLs in v3 that's a decision of the maintainer, currently you're
>the formal maintainer, but I don't remember a single patch from you.
>Most of the linux 2.6 work has been done by Chris and quite a bit of
>work by your employees.  Chris is paid for doing a stable and working
>reiserfs variant for SuSE so he seems to be qualified for doing that, to..
>  
>
Did you notice that V4 blows XFS and ReiserFS V3 away in benchmarks?    
That is what I have been doing for 3 years....

See www.namesys.com for details.
