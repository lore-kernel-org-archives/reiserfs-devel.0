From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: 2.6.23-rc6-git3 (not -git4): reiserfs bug
Date: Thu, 13 Sep 2007 12:56:32 -0700
Message-ID: <20070913125632.885563da.randy.dunlap@oracle.com>
References: <20070913125448.e71a0b11.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20070913125448.e71a0b11.randy.dunlap@oracle.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: lkml <linux-kernel@vger.kernel.org>
Cc: reiserfs-devel@vger.kernel.org

On Thu, 13 Sep 2007 12:54:48 -0700 Randy Dunlap wrote:

> on x86_64, 2 CPU + HT, 4 GB RAM:
> 
> reiserfs with blocksize of 1 KB, data=ordered
> 
> 
> [ 9828.242431] ------------[ cut here ]------------
> [ 9828.247056] kernel BUG at fs/reiserfs/journal.c:531!
> [ 9828.252017] invalid opcode: 0000 [1] SMP
> [ 9828.256070] CPU 0
> [ 9828.258105] Modules linked in: reiserfs loop
> [ 9828.262428] Pid: 16555, comm: pdflush Not tainted 2.6.23-rc6-git3 #1
                                                       ~~~~~~~~~~~~~~~~~~


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
