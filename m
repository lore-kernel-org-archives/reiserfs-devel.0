From: Hans Reiser <reiser@namesys.com>
Subject: Re: [RFC] Pathname Semantics with //
Date: Thu, 09 Sep 2004 17:49:37 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <4140FA21.50101@namesys.com>
References: <20040909191641.A33B315E8B@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040909191641.A33B315E8B@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: linux-fsdevel@vger.kernel.org, 'ReiserFS List' <reiserfs-list@namesys.com>

David Dabbs wrote:

>  
>
>>Use of : in addition to / is a bad idea, see The Hideous Name by Rob
>>Pike for why.
>>
>>Hans
>>
>>    
>>
>
>I've read The Hideous Name, and I think you're taking Pike out of context.
>He wrote that document when device files were still only a part of a
>research version of UNIX. His main point is that programs should not be
>saddled with understanding physical devices when constructing filenames.
>
No, it was more than that.  It was that hierarchy requires only one 
delimiter.


