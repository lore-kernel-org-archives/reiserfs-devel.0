From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: testing/questions about latest Reiser4
Date: Tue, 06 Apr 2004 10:48:10 +0400
Message-ID: <1081234089.1162.57.camel@tribesman.namesys.com>
References: <4070E534.9010509@mrs.umn.edu>
	 <1081178588.1162.47.camel@tribesman.namesys.com>
	 <200404052300.i35N0NTT025232@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17740-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404052300.i35N0NTT025232@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: Grant Miner <mine0057@mrs.umn.edu>, reiserfs-list@namesys.com

Hello

On Tue, 2004-04-06 at 03:00, Valdis.Kletnieks@vt.edu wrote:
> On Mon, 05 Apr 2004 19:23:08 +0400, Vladimir Saveliev said:
> 
> > >   Are 
> > > pseudo files just representation of stat data stored a special way? 
> > 
> > Pseudo files are not stored anywhere
> 
> Subtle distinction here - the data in a pseudo file has to be stored
> *somewhere* if you want it to persist across reboots, and even for things that
> don't survive a reboot, the data has to be saved *someplace* in memory, even if
> it's only in a variable or a dentry structure or something like that....
> 
> So more accurate might be to say "The content of pseudo files is created on the
> fly from metadata that is managed (and possibly saved) by the file system".
> 

Yes, thanks, I should have said something like that

> (Sorry to be pedantic, but it's a point that will cause a lot of confusion if you
> don't really understand it)...

