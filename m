From: Helge Hafting <helge.hafting@hist.no>
Subject: Re: The argument for fs assistance in handling archives
Date: Mon, 06 Sep 2004 15:43:56 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <413C699C.5050900@hist.no>
References: <200409040227.i842R7io003637@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <200409040227.i842R7io003637@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Spam <spam@tnonline.net>, Oliver Hunt <oliverhunt@gmail.com>, Hans Reiser <reiser@namesys.com>, Linus Torvalds <torvalds@osdl.org>, David Masover <ninja@slaphack.com>, Jamie Lokier <jamie@shareable.org>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Horst von Brand wrote:

>Spam <spam@tnonline.net> said:
>  
>
>>Horst von Brand <vonbrand@inf.utfsm.cl> said:
>>    
>>
>>>Helge Hafting <helge.hafting@hist.no> said:
>>>      
>>>
>>>[...]
>>>      
>>>
>>>>The only new thing needed is the ability for something to be both
>>>>file and directory at the same time.
>>>>        
>>>>
>>>Then why have files and directories in the first place?
>>>      
>>>
>
>  
>
>>  Good point, we don't need them :)
>>    
>>
>
>Great. Then everything is a firectory (or dile?). And a firectory points at
>other firectories and contains data. I just don't see how you are supposed
>to distinguish the data from further firectories...
>  
>
By name.
fopen("somefile", "r");  //opens somefile data
fopen("somefile/substream", "r");  //opens a substream of somefile. 

Helge Hafting
