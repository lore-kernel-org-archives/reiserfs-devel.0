From: Philippe =?ISO-8859-1?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: Quotas aand 2.5.x
Date: Wed, 15 Jan 2003 11:59:53 +0100
Message-ID: <20030115115953.7e01be58.philippe.gramoulle@mmania.com>
References: <20030114182217.4fa8f2f8.philippe.gramoulle@mmania.com>
	<20030114203842.A18999@namesys.com>
	<3E2451B0.1020905@namesys.com>
	<20030115104306.51404b4c.philippe.gramoulle@mmania.com>
	<20030115124629.A30051@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12357-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030115124629.A30051@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiser@namesys.com, reiserfs-list@namesys.com, mason@namesys.com

On Wed, 15 Jan 2003 12:46:29 +0300
Oleg Drokin <green@namesys.com> wrote:

  |  Hello!
  |  
  |  On Wed, Jan 15, 2003 at 10:43:06AM +0100, Philippe Gramoull? wrote:
  |  
  |  > Actually, right now, we still have that nasty bug every time we run quotacheck that prenvent us from enabling them on several filerservers which is a big problem right now (that's on 2.4.x)
  |  
  |  Have you tried 2.4. without Chris' datalogging patched, but with original short
  |  overflow fix?

Well, my question was more like a Plan B.

I think i did, and that it still crashed, always during the quotacheck,  but i'll try it again to be 100% sure.

Thanks,

Philippe
