From: Richard Stallman <rms@gnu.org>
Subject: Re: reiser4 non-free?
Date: Fri, 07 May 2004 21:21:03 -0400
Message-ID: <E1BMGWV-00012P-K7@fencepost.gnu.org>
References: <pHiWpB.A.zfD.ypomAB@murphy>
            <409A9867.7040105@almg.gov.br> <200405062008.i46K8Bja026035@turing-police.cc.vt.edu>
Reply-To: rms@gnu.org
Return-path: <reiserfs-list-return-18552-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <200405062008.i46K8Bja026035@turing-police.cc.vt.edu>
	(Valdis.Kletnieks@vt.edu)
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis.Kletnieks@vt.edu
Cc: humberto.massa@almg.gov.br, reiser@namesys.com, debian-legal@lists.debian.org, reiserfs-list@namesys.com

    > It's the same case as Windows NDIS drivers loading on linux. They were 
    > created in a different environment, and would exist as they are even if 
    > linux did not exist. Provided GPL'd glue code, you can load them in the 
    > linux kernel, and they are _not_ derivative works.

The idea that "glue code" makes it ok to combine GPL-covered code with
non-free code has no basis in the GPL.  The GPL applies to the entire
combination of code that is combined into a larger program.  If a.o is
under the GPL and talks to b.o which talks to c.o, the GPL covers all
three files, if all three are combined as one program.

Linus has implicitly and sometimes explicitly given permission for
some kinds of non-free dynamically loaded modules; perhaps the concept
of "glue code" is relevant in terms of the permission he has given.
I'm not the one to ask about that kind of issue.
