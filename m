From: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 10 Sep 2004 07:32:54 +0100
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <1094797973.4838.4.camel@almond.st-and.ac.uk>
References: <20040825200859.GA16345@lst.de>
	 <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org>
	 <20040825204240.GI21964@parcelfarce.linux.theplanet.co.uk>
	 <Pine.LNX.4.58.0408251348240.17766@ppc970.osdl.org>
	 <20040825212518.GK21964@parcelfarce.linux.theplanet.co.uk>
	 <20040826001152.GB23423@mail.shareable.org>
	 <20040826003055.GO21964@parcelfarce.linux.theplanet.co.uk>
	 <20040826010049.GA24731@mail.shareable.org> <412DA40B.5040806@namesys.com>
	 <20040826140500.GA29965@fs.tum.de>
	 <20040826150202.GE5733@mail.shareable.org>
	 <41410DE7.3090100@techsource.com>  <41413A2B.9020405@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <41413A2B.9020405@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Timothy Miller <miller@techsource.com>, Jamie Lokier <jamie@shareable.org>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Fri, 2004-09-10 at 06:22, Hans Reiser wrote:
> He asked me, why not just access a filename's size as filename/size?

I now understand that you need a way to distinguish between something
like

shoe/size

and

shoe/.../size   (or shoe/..size)

The first one is the size of the shoe, the second is the automatically
generated size of the file (object). You would get into trouble if you
would not allow the user to use shoe/size for shoe size. Peter


