From: Chris Mason <mason@suse.com>
Subject: Re: NFS issues with reiserfs 3.6? ext3 works...
Date: Fri, 26 Mar 2004 10:08:21 -0500
Message-ID: <1080313700.2820.111.camel@watt.suse.com>
References: <20040326115302.GD1315@mathematik.uni-bielefeld.de>
	 <1080307106.5920.1.camel@tribesman.namesys.com>
	 <1080308538.2822.95.camel@watt.suse.com>
	 <20040326140939.GH1315@mathematik.uni-bielefeld.de>
	 <1080310685.2820.104.camel@watt.suse.com>
	 <20040326142015.GI1315@mathematik.uni-bielefeld.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17498-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040326142015.GI1315@mathematik.uni-bielefeld.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernhard Sadlowski <sadlowsk@mathematik.uni-bielefeld.de>
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

On Fri, 2004-03-26 at 09:20, Bernhard Sadlowski wrote:
> On 26 Mar 2004 09:18, Chris Mason <mason@suse.com> wrote:
> > > I did compile both kernels myself from original kernel.org source. 
> > > 
> > Thanks for the clarification.  Running dt under strace as Vladimir
> > suggested will help.
> 
> I did send him the output by private mail, because the list doesn't
> accept bigger attachments. If you are interested, I can send you the
> strace output too.

Vladimir sent them along.  I only read the quickly, the traces looks the
same to me for reiserfs and ext3.  It tries to find directory test3 on
the disk and then call off to helios which returns a failure.

You'll have to check things on the helios side I think.

-chris



