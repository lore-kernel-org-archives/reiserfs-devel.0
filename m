From: Jeff Garzik <jgarzik@pobox.com>
Subject: Re: I oppose Chris and Jeff's patch to add an unnecessary additional
 namespace to ReiserFS
Date: Tue, 27 Apr 2004 14:07:40 -0400
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <408EA16C.4030102@pobox.com>
References: <1082750045.12989.199.camel@watt.suse.com> <408D3FEE.1030603@namesys.com> <20040426203314.A6973@infradead.org> <408E986F.90506@namesys.com> <20040427183400.A20221@infradead.org> <408E9F42.2080804@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org-S264254AbUD0SMs@vger.kernel.org>
In-Reply-To: <408E9F42.2080804@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@suse.com>, Linus Torvalds <torvalds@osdl.org>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, akpm@osdl.org

Hans Reiser wrote:
> Christoph Hellwig wrote:
> 
>>> Did you notice that V4 blows XFS and ReiserFS V3 away in 
>>> benchmarks?    That is what I have been doing for 3 years....
>>>
>>> See www.namesys.com for details.
>>>   
>>
>>
>> see www.microsoft.com why Windows is much better than Linux.  Yeah, 
>> thanks.
>>  
>>
> Ask the users whether their laptops, etc.,  seem to go a lot faster with 
> V4.  They seem to be pretty happy with it.
> 
> V4 fixed all of V3's serious performance flaws, and totally obsoletes 
> it.    I am very happy with it.


For the present thread, this is irrelevant, as the irreverent responses 
hinted at:

Regardless of _any_ features or fixes in V4, reiserfs V3 will be used in 
production system for years.  Minor feature additions to an existing 
filesystem make it far easier for kernel engineers and sysadmins to 
assess the impact on their systems -- which is typically of less impact 
than switching to a new filesystem.

	Jeff


