From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 23:17:10 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <41302366.3020306@namesys.com>
References: <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de> <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org> <20040825204240.GI21964@parcelfarce.linux.theplanet.co.uk> <1093467601.9749.14.camel@leto.cs.pocnet.net> <20040825225933.GD5618@nocona.random> <412DA0B5.3030301@namesys.com> <20040826112818.GL5618@nocona.random> <1093520699.9004.11.camel@leto.cs.pocnet.net> <20040826121630.GN5618@nocona.random> <20040827183858.GF5108@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040827183858.GF5108@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alex Zarochentsev <zam@namesys.com>
Cc: Andrea Arcangeli <andrea@suse.de>, Christophe Saout <christophe@saout.de>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Alex Zarochentsev wrote:

>
>
>There should be infracture to change plugin on fly, and choosing object's
>plugins at object's creation time.  Currently only certain object's plugins
>can be changed through <object>/metas/plugin interface. 
>  
>
To be more clear for those not familiar with our project, there is much 
more work to be done, and one of the areas that (extremely) needs more 
work is changing plugins on the fly and clean interfaces for specifying 
them at creation time.
