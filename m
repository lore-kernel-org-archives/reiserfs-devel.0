From: Oleg Drokin <green@namesys.com>
Subject: Re: Problem mounting fs after a crash 2
Date: Tue, 3 Sep 2002 09:52:32 +0400
Message-ID: <20020903095232.A32171@namesys.com>
References: <4.3.1.2.20020826171650.030e6770@mail.hlf.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11357-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4.3.1.2.20020826171650.030e6770@mail.hlf.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reiserml <reiserml@hlf.net>
Cc: reiserfs-list@namesys.com

Hello!

   If you have not come to solution yet, you might want to upgrade your
   kernel to latest available one from SuSE.
   Also please post kernel messages that appears in your logs after the
   segmentation faulf of mount operation.

Bye,
    Oleg
On Mon, Aug 26, 2002 at 05:16:55PM +0200, Reiserml wrote:
> Hi list
> 
> i forgot
> after reiserfsck --check --fix-fixable /dev/vg2/video
> 
> i get the folowing:
> 
> ---
> on-disk bitmap dose not match to the correct one. 178 bytes differ
> ok
> Checking Semantic tree ../img/new/Indiana ..
> ok
> ----
> 
> Thx 
> 
