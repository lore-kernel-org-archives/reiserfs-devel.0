From: Denis Vlasenko <vda@ilport.com.ua>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Sat, 17 Sep 2005 13:51:57 +0300
Message-ID: <200509171351.57152.vda@ilport.com.ua>
References: <432AFB44.9060707@namesys.com> <432B1F84.3000902@namesys.com> <1C909C65-8B71-4817-AE13-519599D0B11A@mac.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751058AbVIQKwe@vger.kernel.org>
In-Reply-To: <1C909C65-8B71-4817-AE13-519599D0B11A@mac.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kyle Moffett <mrmacman_g4@mac.com>
Cc: Hans Reiser <reiser@namesys.com>, Christoph Hellwig <hch@infradead.org>, LKML Kernel <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Friday 16 September 2005 22:52, Kyle Moffett wrote:
> [CC list trimmed to relevant people, no need to spam Linus' and  
> Andrew's mailboxes, they have enough to do as it is]
> 
> On Sep 16, 2005, at 15:39:48, Hans Reiser wrote:
> > Christoph Hellwig wrote:
> >> additinoal comment is that the code is very messy, very different
> >> from normal kernel style, full of indirections and thus hard to read.
> >
> > Most of my customers remark that Namesys code is head and shoulders
> > above the rest of the kernel code.  So yes, it is different.
> 
> And yet thousands and thousands of people, businesses, etc, say that  
> the Linux kernel code is miles above all the commercial software out  
> there. Please leave the worthless rhetoric out of a technical  
> discussion.  The issue stands that in many ways the Reiser4 code does  
> not exactly follow Documentation/CodingStyle and does not match most  
> of the rest of the kernel, making it hard to read for other kernel  
> developers.  If you were just doing this forever as an external  
> kernel patch, nobody would give a damn.  On the other hand, you're  
> trying to get it included in the upstream kernel, which means that  
> those same "other kernel developers" for whom it is hard to read may  
> be expected to maintain it until the end of time.  Given this, it  
> seems perfectly reasonable to ask that it be cleaned up.

I think it makes sense to supply examples from reiser4 code
which you want to be changed. "It's ugly" is not specific enough.
--
vda
