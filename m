From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 19:17:10 -0700
Message-ID: <412E99A6.3070905@namesys.com>
References: <Pine.LNX.4.58.0408251348240.17766@ppc970.osdl.org> <20040825212518.GK21964@parcelfarce.linux.theplanet.co.uk> <20040826001152.GB23423@mail.shareable.org> <20040826003055.GO21964@parcelfarce.linux.theplanet.co.uk> <20040826010049.GA24731@mail.shareable.org> <412DA40B.5040806@namesys.com> <20040826140500.GA29965@fs.tum.de> <1093530313.11694.56.camel@leto.cs.pocnet.net> <20040826150434.GF5733@mail.shareable.org> <1093533175.11694.77.camel@leto.cs.pocnet.net> <20040826160053.GI5733@mail.shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20868-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040826160053.GI5733@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jamie Lokier <jamie@shareable.org>
Cc: Christophe Saout <christophe@saout.de>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>, Vitaly Fertman <vitaly@namesys.com>

Jamie Lokier wrote:

>
>
>  
>
>>>By the way, can reiser4 share parts of files between different files?
>>>      
>>>
>>At the moment a file is exactly one object. But someone could write
>>another file plugin that spans a file across multiple objects, then yes,
>>multiple files could share parts.
>>    
>>
>
>Nice.  That's useful for files which appear as themselves and also as
>part of a container.
>
>And also for revision managed filesystems :)
>
>-- Jamie
>
>
>
>  
>
Inheritance is one of the unimplemented reiser4 features that Vitaly is 
working on.
