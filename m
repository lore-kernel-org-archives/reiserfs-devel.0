From: Chris Mason <mason@suse.com>
Subject: Re: NFS issues with reiserfs 3.6? ext3 works...
Date: Fri, 26 Mar 2004 09:18:05 -0500
Message-ID: <1080310685.2820.104.camel@watt.suse.com>
References: <20040326115302.GD1315@mathematik.uni-bielefeld.de>
	 <1080307106.5920.1.camel@tribesman.namesys.com>
	 <1080308538.2822.95.camel@watt.suse.com>
	 <20040326140939.GH1315@mathematik.uni-bielefeld.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17495-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040326140939.GH1315@mathematik.uni-bielefeld.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernhard Sadlowski <sadlowsk@mathematik.uni-bielefeld.de>
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

On Fri, 2004-03-26 at 09:09, Bernhard Sadlowski wrote:
> Hi Chris,
> 
> On 26 Mar 2004 08:42, Chris Mason <mason@suse.com> wrote:
> > Does Helios Ethershare use the standard linux in kernel nfs server, or
> > does it patch things somehow?
> 
> System1 (dematl04) is Debian/woody with Linux 2.4.25 kernel-nfs-server
> System2 (dematl08) is Redhat9 with Linux 2.4.25 with its standard nfs client
> 
> I did compile both kernels myself from original kernel.org source. 
> 
Thanks for the clarification.  Running dt under strace as Vladimir
suggested will help.

-chris


