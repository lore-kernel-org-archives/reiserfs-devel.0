From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 09 Sep 2004 22:22:51 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <41413A2B.9020405@namesys.com>
References: <20040825200859.GA16345@lst.de> <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org> <20040825204240.GI21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408251348240.17766@ppc970.osdl.org> <20040825212518.GK21964@parcelfarce.linux.theplanet.co.uk> <20040826001152.GB23423@mail.shareable.org> <20040826003055.GO21964@parcelfarce.linux.theplanet.co.uk> <20040826010049.GA24731@mail.shareable.org> <412DA40B.5040806@namesys.com> <20040826140500.GA29965@fs.tum.de> <20040826150202.GE5733@mail.shareable.org> <41410DE7.3090100@techsource.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <41410DE7.3090100@techsource.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Timothy Miller <miller@techsource.com>
Cc: Jamie Lokier <jamie@shareable.org>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>, Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>

A friend asked me a question, and because he is very bright it reminded 
me that I have not done a good job of reviewing the history of the 
design's evolution.

He asked me, why not just access a filename's size as filename/size?

So, the original idea was to access metafiles as just files within a 
directory, and it actually remains that way. However, I first decided to 
make the standard unix metafiles less intrusive on the namespace. So 
that led to calling it filename/..size and filename/..owner, etc. In 
this scheme, the use of '..' was just a style convention for metafiles, 
and not a requirement in anyway.

This was actually pretty decent as a design, but then a user on the 
mailing list suggested replacing the '..' prefix with a subdirectory 
prefix. I forget who suggested this and what the prefix was exactly. So 
we then created a '..metas' subdirectory, and this had the advantage 
that one could ls it to see all the builtins supported by a given 
plugin. This is not an important advantage, and I encourage others to 
critique it.

So, instead of filename/size we have filename/..metas/size. The only 
thing gained by this is that 'size' has a rarer name of '..metas/size'. 
The use of the '..metas/' prefix is purely a non-mandated style 
convention. File plugins that dislike it are free to violate the 
convention. There is no deep semantic to it, just a cowardly aversion to 
intruding on current namespace usage with something as common as 'size'. 
It has the significant disadvantage of being a longer name than 'size' 
or '..size'. I could be talked out of it.

Hans
