From: Shaya Potter <spotter@cs.columbia.edu>
Subject: Re: silent semantic changes with reiser4
Date: Sun, 29 Aug 2004 08:52:46 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <1093794766.9102.10.camel@localhost.localdomain>
References: <20040825204240.GI21964@parcelfarce.linux.theplanet.co.uk>
	 <Pine.LNX.4.58.0408251348240.17766@ppc970.osdl.org>
	 <20040825212518.GK21964@parcelfarce.linux.theplanet.co.uk>
	 <20040826001152.GB23423@mail.shareable.org>
	 <20040826003055.GO21964@parcelfarce.linux.theplanet.co.uk>
	 <20040826010049.GA24731@mail.shareable.org> <412DA40B.5040806@namesys.com>
	 <20040826140500.GA29965@fs.tum.de>
	 <1093530313.11694.56.camel@leto.cs.pocnet.net>
	 <20040826150434.GF5733@mail.shareable.org>
	 <20040829123428.GP5108@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040829123428.GP5108@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Zarochentsev <zam@namesys.com>
Cc: Jamie Lokier <jamie@shareable.org>, Christophe Saout <christophe@saout.de>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Sun, 2004-08-29 at 16:34 +0400, Alex Zarochentsev wrote:

> Do you mean COW files or some another thing?  For COW files, the reiser4
> support is not enough, we need to teach cp(1) or another utility to inform the
> fs layer that copying can be done by creation of COW files.

it's easy enough to add that via an fs ioctl(), I did the equivalent
last semester for some research I'm doing while using ext3cow (which
unfortunately was put on hold for the summer), it's just a take off of
sys_link(), a sys_cowpy() of sorts.


