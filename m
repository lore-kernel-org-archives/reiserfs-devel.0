From: Michael Chang <miranda@uranus.com>
Subject: Re: Data loss during power off
Date: Tue, 25 Jun 2002 20:31:32 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0206252023271.16192-100000@ion.uranus.com>
References: <20020626000904.22479.qmail@hm47.locaweb.com.br>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10845-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020626000904.22479.qmail@hm47.locaweb.com.br>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henrique Faria <henrique@streamworks.com.br>
Cc: reiserfs-list@namesys.com


What you're probably looking for, then, is battery-backed RAM or 
non-volatile memory.  No journalling file system is going to be able to 
commit *every* single byte to a journal, at least not on an 
instruction-by-instruction basis during disk writes (even the kernel 
itself has write buffers that won't be saved if you shut off the power
on a normal system).


Okay.  It's hot here.  I just pulled that out of my butt.  I could be 
entirely wrong.


Michael




On Tue, 25 Jun 2002, Henrique Faria wrote:

> Hello!
> We're using reiserfs 3.6.25 and linux 2.4.18, in a 256 MB flash memory card,
> to develop a game. Data is written all the time, in local files, by the main
> process. The "power off" test has to be done, for the machines will be
> turned off with no shutdown process.
> What's happening: pressing the power off button (during data writing) makes
> data to be lost. Is it possible to force the data to be written in the file
> system? I tried to change the JOURNAL_MAX_TRANS_AGE and the
> JOURNAL_MAX_COMMIT_AGE consts. Less data is lost, but I still get some loss.
> Thanks,
> 
> Henrique R. Faria
> 

-- 
/* BEGIN SIG 
*
* "It might look like I'm doing nothing, but at the cellular level
* I'm really quite busy."
*  ---anonymous
*
*-----------------------------
* Michael Chang
* miranda@uranus.com
* http://www.syndetic.org/
*/

