From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH CFT] tons of logging patches
Date: 04 Jun 2002 09:34:16 -0400
Message-ID: <1023197656.31475.101.camel@tiny>
References: <1023076301.22608.1778.camel@tiny>
	<3CFC1CB5.8040102@mb.tu-ilmenau.de> <1023159462.31682.54.camel@tiny> 
	<3CFC3F0B.6060707@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10501-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CFC3F0B.6060707@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Tue, 2002-06-04 at 00:16, Manuel Krause wrote:

> 
> P.S.: Please, keep me informed, as Namesys seems to need a pushup for 
> 2.4. kernels... ;-) Sorry, Hans! ;-)

BTW, for general usage, the most important speedup in these patches is
the commit_super patch.  The namesys guys already have that in the queue
of stuff to send for 2.4.20-pre.

The tweaks included in the data logging code improve a few of the corner
cases that were hurting us.

-chris


