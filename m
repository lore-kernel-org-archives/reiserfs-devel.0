From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 01:08:02 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <412EEBE2.8090200@namesys.com>
References: <Pine.LNX.4.44.0408261315240.27909-100000@chimarrao.boston.redhat.com> <Pine.LNX.4.58.0408261019580.2304@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0408261019580.2304@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds@osdl.org>
Cc: Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Linus Torvalds wrote:

>
>  
>
>No no. The stream you get from a directory is totally _independent_ of the 
>contents of the directory.
>
but the user can link filename/metas/body to filename/metas/tar, if we 
implement a tar plugin, if it happens that the user wants it to be 
totally dependent.

> Anything else would be pointless.
>
>		Linus
>-
>To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>Please read the FAQ at  http://www.tux.org/lkml/
>
>
>  
>

