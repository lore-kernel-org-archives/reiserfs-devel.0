From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 09 Sep 2004 23:57:15 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <4141504B.8030104@namesys.com>
References: <20040825200859.GA16345@lst.de>	 <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org>	 <20040825204240.GI21964@parcelfarce.linux.theplanet.co.uk>	 <Pine.LNX.4.58.0408251348240.17766@ppc970.osdl.org>	 <20040825212518.GK21964@parcelfarce.linux.theplanet.co.uk>	 <20040826001152.GB23423@mail.shareable.org>	 <20040826003055.GO21964@parcelfarce.linux.theplanet.co.uk>	 <20040826010049.GA24731@mail.shareable.org> <412DA40B.5040806@namesys.com>	 <20040826140500.GA29965@fs.tum.de>	 <20040826150202.GE5733@mail.shareable.org>	 <41410DE7.3090100@techsource.com>  <41413A2B.9020405@namesys.com> <1094797973.4838.4.camel@almond.st-and.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <1094797973.4838.4.camel@almond.st-and.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Cc: Timothy Miller <miller@techsource.com>, Jamie Lokier <jamie@shareable.org>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Peter Foldiak wrote:

>On Fri, 2004-09-10 at 06:22, Hans Reiser wrote:
>  
>
>>He asked me, why not just access a filename's size as filename/size?
>>    
>>
>
>I now understand that you need a way to distinguish between something
>like
>
>shoe/size
>
>and
>
>shoe/.../size   (or shoe/..size)
>
>The first one is the size of the shoe, the second is the automatically
>generated size of the file (object). You would get into trouble if you
>would not allow the user to use shoe/size for shoe size. Peter
>
>
>
>
>  
>
exactly.

Of course, problem/shoe/size could refer to shoe size in centimeters of 
a problem shoe or the size of the problem relating to a shoe in units of 
reporters providing press coverage of it or....

So there are lots of opportunities for ambiguity in semantics....

Still, widely used builtins seem like they should be moderately evasive 
of commonly used names.
