From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: [PAID PRIORITY SUPPORT REQUEST] Quotas not fully working in
 2.4.21-pre5
Date: Sat, 5 Apr 2003 13:28:26 +0200
Message-ID: <20030405132826.4756fa82.philippe.gramoulle@mmania.com>
References: <20030405024529.71d46842.philippe.gramoulle@mmania.com>
	<20030405114200.A984@namesys.com>
	<20030405131118.215367f2.philippe.gramoulle@mmania.com>
	<20030405152215.A2147@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13590-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030405152215.A2147@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: ReiserFS Mailing List <reiserfs-list@namesys.com>, reiserfs-dev@namesys.com

On Sat, 5 Apr 2003 15:22:15 +0400
Oleg Drokin <green@namesys.com> wrote:

  | # CONFIG_QIFACE_COMPAT is not set
  | suggests that you do not have compatibility stuff enabled.

I didn't need compatibility. We use the new vfsv0 format.

  | Please enable it and see if it cures the problem? 

Ok , will do.

  | At least that's how I forced my quotatools to work.

Hmm, that's not clearly stated that it should be set even if we use the new quota format.

I would be happy if it cures the problem but i would still find it odd.

  | Well, mine are 3.03 and your are 3.07, help text says that this option is only required for quota
  | tools <= 3.04. But I still think you should try it.

Ok, i'll do that right now.

Thanks,

Philippe
