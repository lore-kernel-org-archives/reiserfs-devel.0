From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Reiser4 and NFS
Date: Tue, 07 Sep 2004 11:57:22 +0400
Message-ID: <1094543842.1340.61.camel@tribesman.namesys.com>
References: <413C5DBA.1070207@fh-landshut.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21557-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <413C5DBA.1070207@fh-landshut.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oliver Korpilla <okorpil@fh-landshut.de>
Cc: reiserfs-list@namesys.com

Hello

On Mon, 2004-09-06 at 16:53, Oliver Korpilla wrote:
> Hello!
> 
> I've recently upgraded my Debian Sarge to use a Reiser4 as a root filesystem out 
> of curiosity.
> 
> I've been doing development on this box, involving serving a root filesystem to 
> an embedded target via NFS.
> 
> My box (the host) is a vanilla kernel.org Linux 2.6.8.1-mm1 with 
> reiser-all.diff.gz patchset. It's configured to serve NFSv3.
> 
> The target has a TimeSys 2.4.21 (realtime) Linux kernel with NFSv3 client support.
> 
> Before that, I've used 2.4.26 with an ext3 filesystem, and everything went fine. 
> Then I've upgraded kernel and my root filesystem (to Reiser4, I surely consider 
> that an upgrade! ;) ), and I get NFS error -45 (Operation not supported), when 
> target wants to do the LOOKUP operation (I can see that on Ethereal).
> 
> I've found a similar error occuring when serving VFAT partitions over NFS:
> http://linux.derkeiler.com/Mailing-Lists/Kernel/2004-02/7848.html
> 
> I've switched the particular subtree of my root FS that I want to serve via NFS 
> back to ext3, and the problem is gone, so this problem is clearly rooted in the 
> interaction between NFS and Reiser4.
> 
> If I were to do a wild guess, I'd say: Since both VFAT and Reiser4 directory 
> semantics differ from "standard Unix" (or at least ext*) conventions, this is 
> interferring with the NFS LOOKUP operation, don't you think?
> 
> I'll be glad to provide any additional information if required.
> 

I have no problems with exporting reiser4 via NFS. Could it be that you
have problem because your client is embedded?

> Thanks and with kind regards,
> Oliver Korpilla
> 

