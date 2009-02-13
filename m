From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [patch 2/4] vfs: add set_page_dirty_notag
Date: Fri, 13 Feb 2009 15:09:10 +0100
Message-ID: <1234534150.6519.101.camel@twins>
References: <18837.24581.181196.569183@edward.zelnet.ru>
	 <1234530519.6519.46.camel@twins>  <49957C43.7050701@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <49957C43.7050701@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@suse.de>, Ryan Hope <rmh3093@gmail.com>, Randy Dunlap <randy.dunlap@oracle.com>, linux-kernel@vger.kernel.org, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

On Fri, 2009-02-13 at 16:57 +0300, Edward Shishkin wrote:
> >
> > Eew, so reiser4 will totally side-step the regular vm inode
> writeback
> > paths -- or is this fixed by a more elaborate than usual
> > a_ops->writepages() ?
> >   
> The second.
> 
> reiser4_writepages() catches the anonymous  (tagged)
> pages, captures them mandatory, then commits all atoms
> of the file.

OK, can you then make it painfully clear in the function comment, esp.
since you export this function?
