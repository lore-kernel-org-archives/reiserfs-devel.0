From: Wes Janzen <superchkn@sbcglobal.net>
Subject: Re: FS Corruption with VIA MVP3 + UDMA/DMA
Date: Sat, 09 Aug 2003 07:19:29 -0500
Message-ID: <3F34E6D1.7030900@sbcglobal.net>
References: <16128.19218.139117.293393@charged.uio.no> <3F007EBF.9020506@sbcglobal.net> <3F10729F.7070701@sbcglobal.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15261-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F10729F.7070701@sbcglobal.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Kernel <linux-kernel@vger.kernel.org>
Cc: reiserfs-list@namesys.com

I seemed to get a skeptical reaction when I originally posted this to 
the list, however, just google for "mvp3 corrupt dma mode" to confirm.  
I don't know that it takes to hit this error, but it's very easy to 
reproduce on my machine.  Some links only mention UDMA, but all DMA 
modes are affected on my board.  I couldn't even burn a CD over 12X 
without running into this issue.  There I thought it was bad media, but 
after burning 11 CD's at 32X with the PDC20269 (rather than the native 
IDE) and not encountering any errors using the same batch of media and 
writer, the culprit is clear.

I don't know why I didn't google for this in the first place, but it 
looks like it is a known issue.  Just apparently not well-known.

Probably not especially important though, I wonder just how many people 
are still running this setup...  With Linux, I'd say even fewer.





