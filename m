From: Patrick O'Rourke <porourke@egenera.com>
Subject: Re: rsync and memory leak on linux 2.2?
Date: 19 Feb 2003 16:24:09 -0500
Message-ID: <1045689849.1168.24.camel@barnes>
References: <1045156304.11405.149.camel@barnes>
	<87r8abtlhq.fsf@freeze.oslo.dnmi.no>  <20030214130111.A27034@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12838-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030214130111.A27034@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Adrian Phillips <a.phillips@met.no>, reiserfs-list@namesys.com

On Fri, 2003-02-14 at 05:01, Oleg Drokin wrote:

> On Fri, Feb 14, 2003 at 07:38:41AM +0100, Adrian Phillips wrote:
> >     Patrick> We have two machines running Linux 2.2 with ReiserFS
> >     Patrick> v3.5.32 and we're seeing a memory leak which we feel is
> >     Patrick> related to reiser and some interaction with rsync.
> > Well, there is a 3.5.34 which has, obviously, a number of bug

I just thought I would follow up with a note that the bug turned
out NOT to be in the reiser code.  The rsync operation I described
turned out to be a red herring.

Thanks for the suggestions,

Pat

-- 
Patrick O'Rourke
porourke@egenera.com

