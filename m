From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: rebuild-tree working for more then 3 days- what to do?
Date: Fri, 07 Jan 2005 16:13:27 +0300
Message-ID: <1105103606.3616.98.camel@tribesman.namesys.com>
References: <2AEAD962-6089-11D9-A3E5-003065C0167C@xslf.com>
	 <1105093253.3616.34.camel@tribesman.namesys.com>
	 <53BAB6CE-60A5-11D9-8B41-003065C0167C@xslf.com>
	 <1105101220.4192.68.camel@tribesman.namesys.com>
	 <1332240552.20050107134330@tnonline.net>
	 <87390888-60AC-11D9-8B41-003065C0167C@xslf.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23069-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87390888-60AC-11D9-8B41-003065C0167C@xslf.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shoshannah Forbes <xslf@xslf.com>
Cc: Spam <spam@tnonline.net>, reiserfs-list@namesys.com

Hello

On Fri, 2005-01-07 at 16:03, Shoshannah Forbes wrote:
> On 07/01/2005, at 14:43, Spam wrote:
> 
> >   There are liveCD's with reiser4 and reiser4progs. For example: 
> > http://lxnay.dnsalias.org/livecd-iso/index.php
> 
Spam is about reiser4!! progs. Whereas you need reiserfsprogs.

> As the system there is Gentoo, and this LiveCD is gentoo, this looks 
> like my best bet.
> Well, heading for the download now. See you in a few days (hopefully 
> after rebuild-tree is finished)...
> ---

reiserfsck --rebuild-tree 's speed depends of file set substantially.
The worst case - a lots (millons) of small files.
But even in that case on average today hardware it should not take more
than 4-5 hours for 60gb filesystem.
Please inform us how does it progress. Pass 0 is the longest usually.

> Shoshannah Forbes
> http://www.xslf.com
> 
> 

