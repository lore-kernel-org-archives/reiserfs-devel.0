From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Mon, 30 Aug 2004 00:42:13 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <4132DA55.5080903@namesys.com>
References: <Pine.LNX.4.44.0408271043090.10272-100000@chimarrao.boston.redhat.com> <412F7D63.4000109@namesys.com> <20040827230857.69340aec.pj@sgi.com> <20040829150231.GE9471@alias> <4132205A.9080505@namesys.com> <20040829183629.GP21964@parcelfarce.linux.theplanet.co.uk> <20040829185744.GQ21964@parcelfarce.linux.theplanet.co.uk> <41323751.5000607@namesys.com> <20040829212700.GA16297@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040829212700.GA16297@parcelfarce.linux.theplanet.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: viro@parcelfarce.linux.theplanet.co.uk
Cc: flx@msu.ru, Paul Jackson <pj@sgi.com>, riel@redhat.com, ninja@slaphack.com, torvalds@osdl.org, diegocg@teleline.es, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

I think we have to either:

1) Link only to the file and not the directory in the file-directory 
duality. This means we change the semantics of hard link so that it only 
links to the data and the standard metadata, and the optional 
attributes/streams/files-in-directory are not seen by the second link. 
You can think of this as meaning that hard links only connect to the 
file and not the directory in the file-directory wave-particle duality

or, 2) we should ask Alexander Smith to help with applying the graph 
traversal cycle detection code that he wrote.

I can go either way contentedly for now. 2) is the right long term 
solution. 1) is probably the right short term solution.

Ok, Linus and Viro, now I see why it was hard. Being able to effectively 
connect to compound documents only with symlinks is a bit distasteful, 
but it is quite livable, and I very much hope you decide it is better 
than fragmenting the namespace.

Hans



