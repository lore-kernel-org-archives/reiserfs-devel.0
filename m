From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 plugins
Date: Thu, 26 Aug 2004 16:55:26 -0700
Message-ID: <412E786E.5080608@namesys.com>
References: <20040825152805.45a1ce64.akpm@osdl.org>	 <412D9FE6.9050307@namesys.com> <20040826014542.4bfe7cc3.akpm@osdl.org>	 <1093522729.9004.40.camel@leto.cs.pocnet.net> <20040826124929.GA542@lst.de>	 <1093525234.9004.55.camel@leto.cs.pocnet.net> <20040826130718.GB820@lst.de>	 <1093526273.11694.8.camel@leto.cs.pocnet.net>	 <20040826132439.GA1188@lst.de>	 <1093527307.11694.23.camel@leto.cs.pocnet.net>	 <20040826134034.GA1470@lst.de> <1093528683.11694.36.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20854-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093528683.11694.36.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christoph Hellwig <hch@lst.de>
Cc: Christophe Saout <christophe@saout.de>, Andrew Morton <akpm@osdl.org>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

Christophe Saout wrote:

>
>
>I don't know, ask Hans. How could the VFS know it a filesystem wants to
>do something specific with a file that is completely transparent to the
>VFS?
>
>  
>
To know what method to use, you must determine the pluginid, and then 
find the method within that plugin for that vfs operation.

As for overhead, well, who eats whose dust in the benchmarks....?
