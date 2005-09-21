From: Hans Reiser <reiser@namesys.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Wed, 21 Sep 2005 10:36:43 -0700
Message-ID: <43319A2B.3050707@namesys.com>
References: <200509182004.j8IK4JNx012764@inti.inf.utfsm.cl>	 <432E5024.20709@namesys.com> <20050920075133.GB4074@elf.ucw.cz>	 <20050921000425.GF6179@thunk.org> <4330A8F2.7010903@emc.com>	 <4330ACE2.8000909@namesys.com> <4330B388.8010307@emc.com>	 <4330CDF1.4050902@namesys.com> <e692861c05092021552d39cecc@mail.gmail.com> <43314242.1050802@emc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26209-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43314242.1050802@emc.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ric Wheeler <ric@emc.com>
Cc: gmaxwell@gmail.com, vitaly@thebsh.namesys.com, Theodore Ts'o <tytso@mit.edu>, Pavel Machek <pavel@suse.cz>, Horst von Brand <vonbrand@inf.utfsm.cl>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Ric Wheeler wrote:

> Gregory Maxwell wrote:
>
>> On 9/20/05, Hans Reiser <reiser@namesys.com> wrote:
>>  
>>
>>
>> Another goal of the group should be to formulate a requested set of
>> changes or extensions to the makers of drives and other storage
>> systems.  For example, it might be advantageous to be able to disable
>> bad block relocation and allow the filesystem to perform the action.
>> The reason for this is because relocates slaughter streaming read
>> performance, but the filesystem could still contiguously allocate
>> around them...
>>
>>  
>>
The words were attributed to me, but were not mine.

Sometimes mua's do that to one.

