From: Chris Mason <mason@suse.com>
Subject: Re: NFS issues with reiserfs 3.6? ext3 works...
Date: Fri, 26 Mar 2004 08:42:18 -0500
Message-ID: <1080308538.2822.95.camel@watt.suse.com>
References: <20040326115302.GD1315@mathematik.uni-bielefeld.de>
	 <1080307106.5920.1.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17493-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1080307106.5920.1.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>
Cc: Bernhard Sadlowski <sadlowsk@mathematik.uni-bielefeld.de>, reiserfs-list@namesys.com

On Fri, 2004-03-26 at 08:18, Vladimir Saveliev wrote:
> Hello
> 
> On Fri, 2004-03-26 at 14:53, Bernhard Sadlowski wrote:
> > Hi!
> > 
> > A short question:
> > 
> > What are the remaining differences between reiserfs and ext3 regarding
> > NFS? 
> > 
> 
> We thought no before your mail
> 
> > Details:
> > 
> > I have two Linux machines with current kernel 2.4.25 and two
> > Directories on the NFS Server dematl04:
> > 
> > dematl04:/vol01 (ext3 fs)
> > dematl04:/raid  (reiserfs 3.6)
> > 
> > On both machines we use Helios Ethershare (a commercial software for
> > print and fileservices for Macintosh). Helios Ethershare uses and
> > updates a file .Desktop every time some mac is creating, writing or
> > changing files in a Macintosh volume.  The "dt" utility has to be used
> > in a shell for mkdir, rm, mv, touch, ... I guess it has to lock this
> > file whilche applying changes.
> >
Does Helios Ethershare use the standard linux in kernel nfs server, or
does it patch things somehow?

-chris


