From: Lexington Luthor <Lexington.Luthor@gmail.com>
Subject: Re: Another article abour Reiser4 on linux.com
Date: Sun, 06 Aug 2006 13:41:12 +0100
Message-ID: <eb4o19$5ik$1@sea.gmane.org>
References: <87bqqzbaug.fsf@baldur.nicundtas.de> <Pine.LNX.4.62.0608051913200.12088@robo.Stanford.EDU> <44D5A650.3080708@namesys.com> <200608061304.42692.bernd-schubert@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29507-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608061304.42692.bernd-schubert@gmx.de>
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Bernd Schubert wrote:
> An alternative might be a reiser4 fuse port. Has some advantages:
> 
> - Doesn't need to be included into the kernel.
> 
> - can be GPL
> 
> - Referring to the fuse site it also works on BSD (http://fuse4bsd.creo.hu/).
> 
> - Kills one of the major arguments on LKML - if reiser4 is included but 
> Namesys abandons  it in the future and reiser4 has to be removed from the 
> kernel that time again, it still could be mounted.
> 

Please please no. The kernel people will use that as an argument for 
keeping it out of the kernel. I want reiser4 to be popular enough to 
make my apps depend on it and not have the users complain about having 
to use an obscure fs.

Besides, the only thing about reiser4 that interests me more than XFS or 
reiserfs is the speed. In FUSE, you lose all that (as well as millions 
of context switches, there is a huge amount of copying going on). If 
reiser4 gets slower, I might as well use XFS or even old reiserfs.


- LL

