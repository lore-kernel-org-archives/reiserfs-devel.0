From: George Beshers <gbeshers@comcast.net>
Subject: Re: viewprinting: what format should views be stored in?
Date: Mon, 16 Aug 2004 09:47:13 -0400
Message-ID: <4120BAE1.5030400@comcast.net>
References: <411FFCB4.2060400@namesys.com> <41201252.1080803@comcast.net> <412015D0.8030806@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20328-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412015D0.8030806@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>



Hans Reiser wrote:

>
>>> Another approach is to use stem compressed names, or some other 
>>> unique within the fs format for the mask.
>>
>>
>> Can you elaborate on this for a newbie
>
>
> fired
> fireman
> fireplace
> get stored as
> fired
> !4man
> !4place
> if we use classic stem compression, if we use a tree that branches 
> where the names diverge (I forget, is that a radix tree or?) then we 
> have another structure.

Trie I think is what you mean.  http://www.nist.gov/dads/HTML/trie.html


