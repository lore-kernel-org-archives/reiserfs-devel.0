From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: --rebuild-tree always finds errors --check is ok
Date: Tue, 04 Jan 2005 17:30:39 +0300
Message-ID: <1104849038.32178.54.camel@tribesman.namesys.com>
References: <41D71C4E.6000209@hanaden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23034-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41D71C4E.6000209@hanaden.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: hanasaki <hanasaki@hanaden.com>
Cc: reiserfs-list@namesys.com

Hello

On Sun, 2005-01-02 at 00:55, hanasaki wrote:
> Running reiser3 on kernel 2.6.10 and 2.6.9 with Debian sarge and unstable.
> 
> the --rebuild-tree always finds errors and corrects them.  even when run
> more than once consecutively without mounting the partition in between.
> 
Please provide reiserfsck --rebuild-tree output.
What is version of your reiserfsck? (reiserfsck -V)

> --check says all is good.
> 
> 
> 
> 

