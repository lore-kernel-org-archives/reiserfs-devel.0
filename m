From: Rik van Riel <riel@redhat.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 13:16:22 -0400 (EDT)
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0408261315240.27909-100000@chimarrao.boston.redhat.com>
References: <20040826190548.3e67726f.diegocg@teleline.es>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040826190548.3e67726f.diegocg@teleline.es>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Diego Calleja <diegocg@teleline.es>
Cc: jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thu, 26 Aug 2004, Diego Calleja wrote:

> All this looks like reinventing the file/directory concept wheel.
> Instead of adding support for streams and "use files as directories",
> why not orientate it to "use directories as files? Streams could very
> well be provided by directories containing files,

So all I need to do is "cat /bin | gzip -9 > /path/to/backup.tar.gz" ?

This is getting surreal.

-- 
"Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it." - Brian W. Kernighan

