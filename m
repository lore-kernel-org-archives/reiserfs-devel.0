From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 17:02:16 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <412E7A08.5070005@namesys.com>
References: <Pine.LNX.4.44.0408260736080.23532-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0408260736080.23532-100000@chimarrao.boston.redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rik van Riel <riel@redhat.com>
Cc: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Matt Mackall <mpm@selenic.com>, Nicholas Miell <nmiell@gmail.com>, Wichert Akkerman <wichert@wiggy.net>, Jeremy Allison <jra@samba.org>, Andrew Morton <akpm@osdl.org>, Spam <spam@tnonline.net>, torvalds@osdl.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Rik van Riel wrote:

>
>
>In my opinion we shouldn't merge file-as-a-directory
>semantics into the kernel until we figure out how to
>fix the backup/restore problem and keep standard unix
>utilities work.
>
>  
>
One incremental piece at a time our solution will fall into place.  
Pieces should go in when they are individually ready.  Warning users 
that some pieces might be changed out from under them up until when 2.8 
ships is ok with me though.
