From: Ric Wheeler <ric@emc.com>
Subject: Re: XFS corruption during power-blackout
Date: Fri, 01 Jul 2005 08:36:44 -0400
Message-ID: <42C538DC.4070000@emc.com>
References: <254889.27725ab660aa106eb6acc07307d71ef1fbd5b6fd366aebef9e2f611750fbcb467e46e8a4.IBX@taniwha.stupidest.org> <OFC7BE2BBA.42F70A93-ON88257030.00595A48-88257030.005A99A3@us.ibm.com> <054069.b93858d6b97c07747dc32be2dd8981b254d981528781006053dce7be58de88865a43b162.IBX@taniwha.stupidest.org> <20050630194437.GC8374@wohnheim.fh-wedel.de> <947885.634f7bc00f9a47e9c90ffbeec9ebb14a812e2dab7a64e2d09cedc7aa2589ffaf3593543a.IBX@taniwha.stupidest.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24890-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <947885.634f7bc00f9a47e9c90ffbeec9ebb14a812e2dab7a64e2d09cedc7aa2589ffaf3593543a.IBX@taniwha.stupidest.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Wedgwood <cw@f00f.org>
Cc: J?rn Engel <joern@wohnheim.fh-wedel.de>, Bryan Henderson <hbryan@us.ibm.com>, Al Boldi <a1426z@gawab.com>, linux-fsdevel@vger.kernel.org, linux-xfs@oss.sgi.com, Steve Lord <lord@xfs.org>, 'Nathan Scott' <nathans@sgi.com>, reiserfs-list@namesys.com

Chris Wedgwood wrote:

>On Thu, Jun 30, 2005 at 09:44:37PM +0200, J?rn Engel wrote:
>
>  
>
>>Or do you rather mean that a single sync() should block until all data
>>currently present is hardened?
>>    
>>
>
>Logically sync() should return only after all dirty buffers that
>existed before sync() was called are flushed.
>
>Anything more than this (i.e. waiting on newly (since sync was called
>but before it returns) dirtied buffers) could live-lock (actually,
>this used to happen sometimes, I don't know if that's the case).
>  
>
I think that we need one more stage in sync() behavior to make sure that 
the data is safely on the platter.  For file systems with supported 
write barriers, the last IO should be wrapped with a barrier to flush 
the disk cache.

It doesn't seem that sync() does that in today's code.



