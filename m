From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS problems
Date: Thu, 07 Aug 2003 16:58:23 +0400
Message-ID: <3F324CEF.4070608@namesys.com>
References: <20030806182055.A28562@bitwizard.nl> <20030806164852.GA14719@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15224-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030806164852.GA14719@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>, reiserfs-list@namesys.com, copy@harddisk-recovery.nl

Oleg Drokin wrote:

>So basically speaking you do not want to run rebuild-tree operation on the 
>FS that contains files with reiserfs metadata embedded in them in clear.
>This is also explained in our FAQ.
>
if you compress these files, then you will be okay.  You would almost 
always want to compress them.....


-- 
Hans


